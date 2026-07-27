import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:zaix/services/app_settings_service.dart';
import 'package:zaix/services/local_storage_service.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final settings = AppSettingsService.instance;
  var imageCacheSize = "正在计算缓存...".obs;
  var novelCacheSize = "正在计算缓存...".obs;

  @override
  void onInit() {
    super.onInit();
    getImageCachedSize();
    getNovelCachedSize();
  }

  void getImageCachedSize() async {
    try {
      imageCacheSize.value = "正在计算缓存...";
      var bytes = await getCachedSizeBytes();
      imageCacheSize.value = "${(bytes / 1024 / 1024).toStringAsFixed(1)}MB";
    } catch (e) {
      imageCacheSize.value = "缓存计算失败";
    }
  }

  void getNovelCachedSize() async {
    try {
      novelCacheSize.value = "正在计算缓存...";
      var bytes = await LocalStorageService.instance.getNovelCacheSize();
      novelCacheSize.value = "${(bytes / 1024 / 1024).toStringAsFixed(1)}MB";
    } catch (e) {
      novelCacheSize.value = "缓存计算失败";
    }
  }

  void cleanImageCache() async {
    var result = await clearDiskCachedImages();
    if (!result) {
      SmartDialog.showToast("清除失败");
    }
    getImageCachedSize();
  }

  void cleanNovelCache() async {
    var result = await LocalStorageService.instance.cleanNovelCacheSize();
    if (!result) {
      SmartDialog.showToast("清除失败");
    }
    getNovelCachedSize();
  }

  void setDownloadComicTask() {
    Get.dialog(
      RadioGroup<int>(
        groupValue: settings.downloadComicTaskCount.value,
        onChanged: (value) {
          if (value == null) {
            return;
          }
          Get.back();
          settings.setDownloadComicTaskCount(value);
        },
        child: SimpleDialog(
          title: const Text("漫画最大任务数"),
          children: [0, 1, 2, 3, 4, 5]
              .map(
                (value) => RadioListTile<int>(
                  title: Text(value == 0 ? "无限制" : "$value个"),
                  value: value,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void setDownloadNovelTask() {
    Get.dialog(
      RadioGroup<int>(
        groupValue: settings.downloadNovelTaskCount.value,
        onChanged: (value) {
          if (value == null) {
            return;
          }
          Get.back();
          settings.setDownloadNovelTaskCount(value);
        },
        child: SimpleDialog(
          title: const Text("小说最大任务数"),
          children: [0, 1, 2, 3, 4, 5]
              .map(
                (value) => RadioListTile<int>(
                  title: Text(value == 0 ? "无限制" : "$value个"),
                  value: value,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
