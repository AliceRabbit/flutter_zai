import 'dart:async';

import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/novel/recommend_model.dart';
import 'package:zaix/modules/novel/home/novel_home_controller.dart';
import 'package:zaix/requests/novel_request.dart';
import 'package:zaix/routes/app_navigator.dart';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NovelRecommendController extends BasePageController<NovelRecommendModel> {
  final NovelRequest request = NovelRequest();

  @override
  Future<List<NovelRecommendModel>> getData(int page, int pageSize) async {
    var ls = await request.recommend();

    return ls;
  }

  void openDetail(NovelRecommendItemModel item) {
    //漫画=1
    if (item.type == null || item.type == 2) {
      AppNavigator.toNovelDetail(item.objId ?? item.id ?? 0);
    } else if (item.type == 1) {
      //专题=5
      AppNavigator.toComicDetail(item.objId ?? 0);
    } else if (item.type == 5) {
      //专题=5
      AppNavigator.toSpecialDetail(item.objId ?? 0);
    } else if (item.type == 6) {
      //网页=6
      AppNavigator.toWebView(item.url ?? "");
    } else if (item.type == 7) {
      //新闻=7
      AppNavigator.toNewsDetail(
        url: item.url ?? "",
        newsId: item.objId ?? 0,
        title: item.title,
      );
    } else if (item.type == 8) {
      //作者=8
      AppNavigator.toComicAuthorDetail(item.objId ?? 0, authorName: item.title);
    } else if (item.type == 13) {
      //社区=13
      //直接跳转至网页
      launchUrlString(
        "http://m.forum.idmzj.com/thread/detail?tid=${item.objId}",
      );
    } else {
      SmartDialog.showToast("未知类型，无法跳转");
    }
  }

  void toLatest() {
    var homeController = Get.find<NovelHomeController>();
    homeController.tabController.animateTo(1);
  }

  void toMySubscribe() {}
}
