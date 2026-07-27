import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/app/log.dart';
import 'package:zaix/requests/common_request.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Utils {
  static late PackageInfo packageInfo;
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  static DateFormat dateTimeFormat = DateFormat("MM-dd HH:mm");
  static DateFormat dateTimeFormatWithYear = DateFormat("yyyy-MM-dd HH:mm");

  /// 版本号解析
  static int parseVersion(String version) {
    var sp = version.split('.');
    var num = "";
    for (var item in sp) {
      num = num + item.padLeft(2, '0');
    }
    return int.parse(num);
  }

  /// 时间戳格式化-秒
  static String formatTimestamp(int ts) {
    if (ts == 0) {
      return "----";
    }
    return formatTimestampMS(ts * 1000);
  }

  static String formatTimestampToDate(int ts) {
    if (ts == 0) {
      return "----";
    }
    var dt = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
    return dateFormat.format(dt);
  }

  /// 时间戳格式化-毫秒
  static String formatTimestampMS(int ts) {
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var dtNow = DateTime.now();
    if (dt.year == dtNow.year &&
        dt.month == dtNow.month &&
        dt.day == dtNow.day) {
      return "今天${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
    }
    if (dt.year == dtNow.year &&
        dt.month == dtNow.month &&
        dt.day == dtNow.day - 1) {
      return "昨天${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
    }

    if (dt.year == dtNow.year) {
      return dateTimeFormat.format(dt);
    }

    return dateTimeFormatWithYear.format(dt);
  }

  /// 检查相册权限
  static Future<bool> checkPhotoPermission() async {
    try {
      if (Platform.isAndroid) {
        final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
        if (sdkInt >= 29) {
          return true;
        }
        final status = await Permission.storage.request();
        if (status.isGranted) {
          return true;
        }
      } else if (Platform.isIOS) {
        final status = await Permission.photosAddOnly.request();
        if (status.isGranted || status.isLimited) {
          return true;
        }
      } else {
        return true;
      }
      SmartDialog.showToast("请授予相册权限");
      return false;
    } catch (error, stackTrace) {
      Log.e("检查相册权限失败", error: error, stackTrace: stackTrace);
      return false;
    }
  }

  /// 保存图片
  static Future<void> saveImage(String url) async {
    if ((Platform.isAndroid || Platform.isIOS) &&
        !await Utils.checkPhotoPermission()) {
      return;
    }
    try {
      Uint8List? data;
      if (url.startsWith("http")) {
        var provider = ExtendedNetworkImageProvider(url, cache: true);
        data = await provider.getNetworkImageData();
      } else {
        data = await File(url).readAsBytes();
      }

      if (data == null) {
        SmartDialog.showToast("图片保存失败");
        return;
      }
      final rawPath = url.startsWith("http") ? Uri.parse(url).path : url;
      final baseName = p.basename(rawPath);
      final fileName = baseName.isEmpty
          ? "image_${DateTime.now().millisecondsSinceEpoch}.jpg"
          : baseName;
      if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        await saveImageDesktop(fileName, data);
      } else {
        final result = await SaverGallery.saveImage(
          data,
          fileName: fileName,
          skipIfExists: false,
        );
        Log.d(result.toString());
        SmartDialog.showToast(result.isSuccess ? "保存成功" : "保存失败");
      }
    } catch (error, stackTrace) {
      Log.e("保存图片失败", error: error, stackTrace: stackTrace);
      SmartDialog.showToast("保存失败");
    }
  }

  /// 保存图片-桌面平台
  static Future<void> saveImageDesktop(String fileName, Uint8List list) async {
    final FileSaveLocation? location = await getSaveLocation(
      suggestedName: fileName,
    );
    if (location == null) {
      return;
    }
    final XFile file = XFile.fromData(list, name: fileName);
    await file.saveTo(location.path);
  }

  /// 分享
  static void share(String url, {String content = ""}) {
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      constraints: const BoxConstraints(maxWidth: 500),
      useSafeArea: true,
      backgroundColor: Get.theme.cardColor,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text("复制链接"),
            onTap: () {
              Get.back();
              Utils.copyText(url);
            },
          ),
          Visibility(
            visible: content.isNotEmpty,
            child: ListTile(
              leading: const Icon(Icons.copy),
              title: const Text("复制标题与链接"),
              onTap: () {
                Get.back();
                Utils.copyText("$content\n$url");
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.public),
            title: const Text("浏览器打开"),
            onTap: () {
              Get.back();
              launchUrlString(url, mode: LaunchMode.externalApplication);
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("系统分享"),
            onTap: () async {
              final renderBox = context.findRenderObject();
              final sharePositionOrigin = renderBox is RenderBox
                  ? renderBox.localToGlobal(Offset.zero) & renderBox.size
                  : null;
              Get.back();
              await SharePlus.instance.share(
                ShareParams(
                  text: content.isEmpty ? url : "$content\n$url",
                  sharePositionOrigin: sharePositionOrigin,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 检查更新
  static void checkUpdate({bool showMsg = false}) async {
    try {
      int currentVer = Utils.parseVersion(packageInfo.version);
      CommonRequest request = CommonRequest();
      var versionInfo = await request.checkUpdate();
      if (versionInfo.versionNum > currentVer) {
        Get.dialog(
          AlertDialog(
            title: Text(
              "发现新版本 ${versionInfo.version}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            content: Text(
              versionInfo.versionDesc,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            actionsPadding: AppStyle.edgeInsetsH12,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("取消"),
                    ),
                  ),
                  AppStyle.hGap12,
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0),
                      onPressed: () {
                        launchUrlString(
                          versionInfo.downloadUrl,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Text("更新"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        if (showMsg) {
          SmartDialog.showToast("当前已经是最新版本了");
        }
      }
    } catch (e) {
      Log.logPrint(e);
      if (showMsg) {
        SmartDialog.showToast("检查更新失败");
      }
    }
  }

  /// 复制文本
  static void copyText(String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      SmartDialog.showToast("已复制到剪切板");
    } catch (e) {
      SmartDialog.showToast(e.toString());
    }
  }
}
