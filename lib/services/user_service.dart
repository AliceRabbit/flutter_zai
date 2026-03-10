import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dmzj/app/app_constant.dart';
import 'package:flutter_dmzj/app/event_bus.dart';
import 'package:flutter_dmzj/app/log.dart';
import 'package:flutter_dmzj/app/utils.dart';
import 'package:flutter_dmzj/models/db/comic_history.dart';
import 'package:flutter_dmzj/models/db/novel_history.dart';
import 'package:flutter_dmzj/models/user/login_result_model.dart';
import 'package:flutter_dmzj/models/user/user_profile_model.dart';
import 'package:flutter_dmzj/modules/user/login/user_login_dialog.dart';
import 'package:flutter_dmzj/requests/user_request.dart';
import 'package:flutter_dmzj/services/db_service.dart';
import 'package:flutter_dmzj/services/local_storage_service.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserService extends GetxService {
  static StreamController loginedStreamController =
      StreamController.broadcast();
  static StreamController logoutStreamController = StreamController.broadcast();

  ///登录事件流
  static Stream get loginedStream => loginedStreamController.stream;

  ///退出登录事件流
  static Stream get logoutStream => logoutStreamController.stream;

  static UserService get instance => Get.find<UserService>();
  final LocalStorageService storage = Get.find<LocalStorageService>();
  final request = UserRequest();
  LoginResultModel? userAuthInfo;
  Future<void>? _syncSubscribedIdsTask;

  Rx<UserProfileModel?> userProfile = Rx<UserProfileModel?>(null);

  String get dmzjToken => userAuthInfo?.token ?? '';
  String get userId => userAuthInfo?.uid.toString() ?? '';
  String get nickname => userAuthInfo?.nickname ?? '';

  bool get isVip => (userProfile.value?.userfeeinfo?.isVip ?? false);

  String get sign => (userProfile.value?.description ?? "").isEmpty
      ? "无个性签名"
      : userProfile.value?.description ?? "";

  String get vipInfo =>
      "会员有效期至${Utils.dateFormat.format(userProfile.value?.userfeeinfo?.expiresTime ?? DateTime.now())}";

  /// 是否已经绑定手机号
  var bindTel = true.obs;

  /// 是否已经设置密码
  var setPwd = true.obs;

  /// 是否已经登录
  var logined = false.obs;

  /// 已经订阅的漫画ID
  var subscribedComicIds = RxSet<int>();

  /// 已经订阅的小说ID
  var subscribedNovelIds = RxSet<int>();

  void init() {
    var value = storage.getValue(LocalStorageService.kUserAuthInfo, '');
    if (value.isEmpty) {
      return;
    }
    LoginResultModel info = LoginResultModel.fromJson(json.decode(value));

    userAuthInfo = info;
    logined.value = true;
    if (logined.value) {
      unawaited(refreshProfile());
      unawaited(syncSubscribedIds());
    }
  }

  /// 设置登录信息
  void setAuthInfo(LoginResultModel info) {
    userAuthInfo = info;
    storage.setValue(LocalStorageService.kUserAuthInfo, info.toString());
    logined.value = true;
    UserService.loginedStreamController.add(true);
    unawaited(refreshProfile());
    syncRemoteHistory();
    unawaited(syncSubscribedIds(force: true));
  }

  void logout() {
    storage.removeValue(LocalStorageService.kUserAuthInfo);
    userProfile.value = null;
    logined.value = false;
    subscribedComicIds.clear();
    subscribedNovelIds.clear();
    _syncSubscribedIdsTask = null;
    UserService.logoutStreamController.add(true);
  }

  Future<bool> login() async {
    if (logined.value) {
      return true;
    }
    var result = await Get.dialog(UserLoginDialog());

    return (result != null && result == true);
  }

  /// 刷新个人资料
  Future<UserProfileModel?> refreshProfile({bool silent = true}) async {
    if (!logined.value) {
      return null;
    }
    try {
      userProfile.value = await request.userProfile();
      updateCookie();
      updateBindStatus();
      return userProfile.value;
    } catch (e) {
      Log.logPrint(e);
      if (!silent) {
        rethrow;
      }
      return null;
    }
  }

  Future<bool> signIn() async {
    try {
      if (!await login()) {
        return false;
      }
      await request.signIn();
      SmartDialog.showToast("签到成功");
      return true;
    } catch (e) {
      SmartDialog.showToast(e.toString());
      return false;
    }
  }

  /// 更新一下用户的历史记录
  void syncRemoteHistory() {
    if (!logined.value) {
      return;
    }
    syncRemoteComicHistory();
    syncRemoteNovelHistory();
  }

  void syncRemoteComicHistory() async {
    try {
      await request.comicHistory();
    } catch (e) {
      Log.logPrint(e);
    }
  }

  void syncRemoteNovelHistory() async {
    try {
      await request.novelHistory();
    } catch (e) {
      Log.logPrint(e);
    }
  }

  Future<void> syncSubscribedIds({bool force = false}) {
    if (!logined.value) {
      subscribedComicIds.clear();
      subscribedNovelIds.clear();
      return Future.value();
    }
    if (!force && _syncSubscribedIdsTask != null) {
      return _syncSubscribedIdsTask!;
    }

    final task = _syncSubscribedIdsInternal();
    _syncSubscribedIdsTask = task;
    task.whenComplete(() {
      if (identical(_syncSubscribedIdsTask, task)) {
        _syncSubscribedIdsTask = null;
      }
    });
    return task;
  }

  Future<void> _syncSubscribedIdsInternal() async {
    try {
      final comicIdsFuture = _loadAllComicSubscribedIds();
      final novelIdsFuture = _loadAllNovelSubscribedIds();
      final comicIds = await comicIdsFuture;
      final novelIds = await novelIdsFuture;

      subscribedComicIds
        ..clear()
        ..addAll(comicIds);
      subscribedNovelIds
        ..clear()
        ..addAll(novelIds);
    } catch (e) {
      Log.logPrint(e);
    }
  }

  Future<Set<int>> _loadAllComicSubscribedIds() async {
    const int batchSize = 100;
    const int maxPages = 500;
    final ids = <int>{};
    var page = 1;
    var total = 0;
    while (true) {
      final result = await request.comicSubscribesPage(
        subType: 1,
        page: page,
        size: batchSize,
      );
      ids.addAll(result.items.map((e) => e.id));
      total = result.total;
      if (ids.length >= total) {
        return ids;
      }
      page++;
      if (page > maxPages) {
        return ids;
      }
    }
  }

  Future<Set<int>> _loadAllNovelSubscribedIds() async {
    const int batchSize = 100;
    const int maxPages = 500;
    final ids = <int>{};
    var page = 1;
    var total = 0;
    while (true) {
      final result = await request.novelSubscribesPage(
        subType: 1,
        page: page,
        size: batchSize,
      );
      ids.addAll(result.items.map((e) => e.id));
      total = result.total;
      if (ids.length >= total) {
        return ids;
      }
      page++;
      if (page > maxPages) {
        return ids;
      }
    }
  }

  /// 更新绑定状态
  void updateBindStatus() async {
    try {
      if (!logined.value) {
        return;
      }
      var result = await request.isBindTelPwd();
      bindTel.value = result.isBindTel == 1;
      setPwd.value = result.isBindTel == 1;
    } catch (e) {
      Log.logPrint(e);
    }
  }

  /// 添加订阅
  Future<bool> addSubscribe(List<int> ids, int type) async {
    try {
      if (!await login()) {
        return false;
      }
      await request.addSubscribe(
        ids: ids,
        type: type,
      );
      if (type == AppConstant.kTypeComic) {
        subscribedComicIds.addAll(ids);
      } else if (type == AppConstant.kTypeNovel) {
        subscribedNovelIds.addAll(ids);
      }

      SmartDialog.showToast("订阅成功");
      return true;
    } catch (e) {
      SmartDialog.showToast(e.toString());
      return false;
    }
  }

  /// 取消订阅
  Future<bool> cancelSubscribe(List<int> ids, int type) async {
    try {
      if (!await login()) {
        return false;
      }
      await request.removeSubscribe(
        ids: ids,
        type: type,
      );
      if (type == AppConstant.kTypeComic) {
        subscribedComicIds.removeAll(ids);
      } else if (type == AppConstant.kTypeNovel) {
        subscribedNovelIds.removeAll(ids);
      }
      SmartDialog.showToast("已取消订阅");
      return true;
    } catch (e) {
      SmartDialog.showToast(e.toString());
      return false;
    }
  }

  /// 更新漫画记录
  Future updateComicHistory({
    required int comicId,
    required int chapterId,
    required int page,
    required String comicName,
    required String comicCover,
    required String chapterName,
  }) async {
    try {
      var time = DateTime.now();
      await DBService.instance.updateComicHistory(
        ComicHistory(
          comicId: comicId,
          chapterId: chapterId,
          comicName: comicName,
          comicCover: comicCover,
          chapterName: chapterName,
          updateTime: time,
          page: page,
        ),
      );
      EventBus.instance.emit(EventBus.kUpdatedComicHistory, comicId);
      if (!logined.value) {
        return;
      }
      // await request.uploadComicHistory(
      //   comicId: comicId,
      //   chapterId: chapterId,
      //   page: page,
      //   time: time,
      // );
    } catch (e) {
      Log.logPrint(e);
    }
  }

  /// 更新漫画记录
  Future updateNovelHistory({
    required int novelId,
    required int chapterId,
    required int index,
    required int total,
    required String novelName,
    required String novelCover,
    required String chapterName,
    required int volumeId,
    required String volumeName,
  }) async {
    try {
      var time = DateTime.now();
      await DBService.instance.updateNovelHistory(
        NovelHistory(
          novelId: novelId,
          chapterId: chapterId,
          volumeName: volumeName,
          volumeId: volumeId,
          chapterName: chapterName,
          updateTime: time,
          index: index,
          total: total,
          novelCover: novelCover,
          novelName: novelName,
        ),
      );
      EventBus.instance.emit(EventBus.kUpdatedNovelHistory, novelId);
      if (!logined.value) {
        return;
      }
      await request.uploadNovelHistory(
        novelId: novelId,
        volumeId: volumeId,
        chapterId: chapterId,
        page: 1,
        total: total,
        time: time,
      );
    } catch (e) {
      Log.logPrint(e);
    }
  }

  void updateCookie() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final WebViewCookieManager cookieManager = WebViewCookieManager();
      for (var item in getCookies()) {
        await cookieManager.setCookie(item);
      }
    }
  }

  List<WebViewCookie> getCookies() {
    var cookie = userProfile.value?.cookieVal ?? "";
    if (cookie.isEmpty) {
      return [];
    }
    List<WebViewCookie> cookies = [];

    cookie.split(";").forEach((element) {
      List<String> keyValue = element.split("=");
      if (keyValue.length == 2) {
        cookies.add(
          WebViewCookie(
            domain: ".dmzj.com",
            value: keyValue[1],
            name: keyValue[0],
          ),
        );
        cookies.add(
          WebViewCookie(
            domain: ".idmzj.com",
            value: keyValue[1],
            name: keyValue[0],
          ),
        );
        cookies.add(
          WebViewCookie(
            domain: ".muwai.com",
            value: keyValue[1],
            name: keyValue[0],
          ),
        );
      }
    });
    return cookies;
  }
}
