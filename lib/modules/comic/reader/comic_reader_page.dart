import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zaix/app/app_constant.dart';

import 'package:zaix/app/app_style.dart';
import 'package:zaix/app/log.dart';
import 'package:zaix/modules/comic/reader/comic_reader_controller.dart';
import 'package:zaix/widgets/custom_header.dart';
import 'package:zaix/widgets/local_image.dart';
import 'package:zaix/widgets/net_image.dart';
import 'package:zaix/widgets/status/app_error_widget.dart';
import 'package:zaix/widgets/status/app_loadding_widget.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:remixicon/remixicon.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ComicReaderPage extends GetView<ComicReaderController> {
  const ComicReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      onKeyEvent: (e) {
        if (e.runtimeType == KeyUpEvent) {
          controller.keyDown(e.logicalKey);
          Log.d(e.toString());
        }
      },
      focusNode: controller.focusNode,
      autofocus: true,
      child: Theme(
        data: AppStyle.darkTheme,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Obx(
                () => Offstage(
                  offstage: controller.detail.value.chapterId == 0,
                  child: GestureDetector(
                    onTap: () {
                      controller.setShowControls();
                    },
                    child:
                        controller.direction.value == ReaderDirection.kUpToDown
                        ? buildVertical()
                        : buildHorizontal(context),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.leftHandMode
                              ? controller.nextPage()
                              : controller.forwardPage();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Expanded(flex: 8, child: Container()),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.leftHandMode
                              ? controller.forwardPage()
                              : controller.nextPage();
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Offstage(
                  offstage: !controller.pageLoadding.value,
                  child: const AppLoaddingWidget(),
                ),
              ),
              Obx(
                () => Offstage(
                  offstage: !controller.pageError.value,
                  child: AppErrorWidget(
                    errorMsg: controller.errorMsg.value,
                    onRefresh: () => controller.loadDetail(),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Obx(
                  () => Offstage(
                    offstage: !controller.settings.comicReaderShowStatus.value,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      padding: AppStyle.edgeInsetsA12.copyWith(
                        top: 4,
                        bottom: 4,
                      ),
                      child: Obx(() {
                        final imageCount = controller.imagePageCount;
                        final currentPage = controller.currentIndex.value + 1;
                        final pageText = controller.isOnViewPointPage
                            ? "吐槽"
                            : "$currentPage / $imageCount";
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildConnectivity(),
                            buildBattery(),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 100),
                              child: Text(
                                controller.detail.value.chapterTitle,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  height: 1.0,
                                ),
                              ),
                            ),
                            AppStyle.hGap8,
                            Text(
                              pageText,
                              style: const TextStyle(fontSize: 12, height: 1.0),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
              //顶部
              Obx(
                () => AnimatedPositioned(
                  top: controller.showControls.value
                      ? 0
                      : -(48 + AppStyle.statusBarHeight),
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    color: AppStyle.darkTheme.cardColor,
                    height: 48 + AppStyle.statusBarHeight,
                    padding: EdgeInsets.only(top: AppStyle.statusBarHeight),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: Get.back,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        AppStyle.hGap12,
                        Expanded(
                          child: Obx(
                            () => Text(
                              controller
                                  .chapters[controller.chapterIndex.value]
                                  .chapterTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //底部
              Obx(
                () => AnimatedPositioned(
                  bottom: controller.showControls.value
                      ? 0
                      : -(104 + AppStyle.bottomBarHeight),
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    color: AppStyle.darkTheme.cardColor,
                    height: 104 + AppStyle.bottomBarHeight,
                    padding: EdgeInsets.only(bottom: AppStyle.bottomBarHeight),
                    alignment: Alignment.center,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        children: [
                          buildSilderBar(),
                          Material(
                            color: AppStyle.darkTheme.cardColor,
                            child: Obx(
                              () => Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: controller.forwardChapter,
                                      icon: const Icon(Remix.skip_back_line),
                                    ),
                                  ),
                                  if (controller
                                      .settings
                                      .comicReaderShowViewPoint
                                      .value)
                                    Expanded(
                                      child: IconButton(
                                        onPressed: controller.showComment,
                                        icon: Badge(
                                          label: Text(
                                            "${controller.viewPoints.length}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: const Icon(
                                            Remix.chat_smile_2_line,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: controller.showMenu,
                                      icon: const Icon(Remix.file_list_line),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: controller.showSettings,
                                      icon: const Icon(Remix.settings_line),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: controller.nextChapter,
                                      icon: const Icon(Remix.skip_forward_line),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorizontal(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        controller.precacheNearbyPages(context, controller.currentIndex.value);
      }
    });
    return EasyRefresh(
      header: MaterialHeader2(
        triggerOffset: 80,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.radius24,
          ),
          padding: AppStyle.edgeInsetsA12,
          child: const Icon(Icons.arrow_circle_left, color: Colors.blue),
        ),
      ),
      footer: MaterialFooter2(
        triggerOffset: 80,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.radius24,
          ),
          padding: AppStyle.edgeInsetsA12,
          child: const Icon(Icons.arrow_circle_right, color: Colors.blue),
        ),
      ),
      refreshOnStart: false,
      onRefresh: () async {
        controller.forwardChapter();
      },
      onLoad: () async {
        controller.nextChapter();
      },
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (e) {
          controller.currentIndex.value = e;
          controller.precacheNearbyPages(context, e);
        },
        reverse: controller.direction.value == ReaderDirection.kRightToLeft,
        physics: controller.lockSwipe.value
            ? const NeverScrollableScrollPhysics()
            : null,
        itemCount: controller.detail.value.pageUrls.length,
        itemBuilder: (_, i) {
          var url = controller.detail.value.pageUrls[i];
          if (url == ComicReaderController.kViewPointPageTag) {
            return buildViewPoints();
          }
          return PhotoView.customChild(
            wantKeepAlive: true,
            initialScale: 1.0,
            onScaleEnd: (context, detail, e) {
              controller.lockSwipe.value = (e.scale ?? 1) > 1.0;
            },
            child: controller.detail.value.isLocal
                ? LocalImage(url, fit: BoxFit.contain)
                : NetImage(url, fit: BoxFit.contain, progress: true),
          );
        },
      ),
    );
  }

  Widget buildVertical() {
    return EasyRefresh(
      header: MaterialHeader2(
        triggerOffset: 80,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.radius24,
          ),
          padding: AppStyle.edgeInsetsA12,
          child: const Icon(Icons.arrow_circle_up, color: Colors.blue),
        ),
      ),
      footer: MaterialFooter2(
        triggerOffset: 80,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.radius24,
          ),
          padding: AppStyle.edgeInsetsA12,
          child: const Icon(Icons.arrow_circle_down, color: Colors.blue),
        ),
      ),
      refreshOnStart: false,
      onRefresh: () async {
        controller.forwardChapter();
      },
      onLoad: () async {
        controller.nextChapter();
      },
      child: ScrollablePositionedList.builder(
        itemScrollController: controller.itemScrollController,
        itemCount: controller.detail.value.pageUrls.length,
        itemPositionsListener: controller.itemPositionsListener,
        itemBuilder: (_, i) {
          var url = controller.detail.value.pageUrls[i];
          if (url == ComicReaderController.kViewPointPageTag) {
            return buildViewPoints(shrinkWrap: true);
          }
          return Container(
            constraints: const BoxConstraints(minHeight: 200),
            child: controller.detail.value.isLocal
                ? LocalImage(url, fit: BoxFit.contain)
                : NetImage(url, fit: BoxFit.fitWidth, progress: true),
          );
        },
      ),
    );
  }

  Widget buildSilderBar() {
    return Obx(() {
      final total = controller.detail.value.pageUrls.length;
      if (total <= 1) {
        return const SizedBox(height: 48);
      }
      final max = total.toDouble();
      final value = (controller.currentIndex.value + 1.0).clamp(1.0, max);
      return SizedBox(
        height: 48,
        child: Row(
          children: [
            Expanded(
              child: Slider(
                min: 1.0,
                value: value,
                max: max,
                onChanged: (e) {
                  controller.jumpToPage((e - 1).round());
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildViewPoints({bool shrinkWrap = false}) {
    return Obx(() {
      final points = controller.viewPoints;
      final isOldStyle = controller.settings.comicReaderOldViewPoint.value;
      final previewPoints = points.take(20).toList();
      final chapterTitle = controller.detail.value.chapterTitle;

      Widget body;
      if (controller.viewPointsLoading.value && points.isEmpty) {
        body = const Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                AppStyle.vGap12,
                Text("正在加载本章吐槽...", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      } else if (controller.viewPointsError.value && points.isEmpty) {
        body = Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("吐槽加载失败", style: TextStyle(color: Colors.grey)),
                AppStyle.vGap8,
                OutlinedButton.icon(
                  onPressed: controller.loadViewPoints,
                  icon: const Icon(Remix.refresh_line, size: 16),
                  label: const Text("重新加载"),
                ),
              ],
            ),
          ),
        );
      } else if (points.isEmpty) {
        body = const Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Remix.chat_smile_2_line, size: 36, color: Colors.white38),
                AppStyle.vGap8,
                Text(
                  "本章还没有吐槽，来说点什么吧",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      } else {
        body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: previewPoints.map((e) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: isOldStyle
                        ? Colors.blue.withValues(alpha: 0.85)
                        : Colors.white.withValues(alpha: 0.08),
                    borderRadius: AppStyle.radius8,
                    border: isOldStyle
                        ? null
                        : Border.all(
                            color: Colors.white.withValues(alpha: 0.16),
                            width: 1,
                          ),
                  ),
                  child: Text(
                    e.content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.35,
                    ),
                  ),
                );
              }).toList(),
            ),
            if (points.length > previewPoints.length) ...[
              AppStyle.vGap12,
              Text(
                "仅展示前 ${previewPoints.length} 条，点击下方查看全部 ${points.length} 条吐槽",
                style: const TextStyle(fontSize: 12, color: Colors.white54),
              ),
            ],
          ],
        );
      }

      final content = LayoutBuilder(
        builder: (context, constraints) {
          final minSidePadding = constraints.maxWidth * 0.1 + 8;
          final sidePadding = minSidePadding < 20 ? 20.0 : minSidePadding;
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  sidePadding,
                  shrinkWrap ? 20 : 24,
                  sidePadding,
                  shrinkWrap ? 32 + AppStyle.bottomBarHeight : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (shrinkWrap) ...[
                      Divider(color: Colors.white.withValues(alpha: 0.12)),
                      AppStyle.vGap12,
                    ],
                    if (chapterTitle.isNotEmpty)
                      Text(
                        "$chapterTitle · 本章已读完",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white54,
                        ),
                      ),
                    AppStyle.vGap4,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "本章吐槽 (${points.length})",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: "刷新吐槽",
                          onPressed: controller.loadViewPoints,
                          icon: const Icon(
                            Remix.refresh_line,
                            size: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    AppStyle.vGap12,
                    body,
                    AppStyle.vGap24,
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            controller.showComment(
                              hideControls: false,
                              autoFocusInput: true,
                            );
                          },
                          icon: const Icon(Icons.edit_outlined, size: 16),
                          label: const Text("发表吐槽"),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            controller.showComment(hideControls: false);
                          },
                          icon: const Icon(Remix.chat_smile_2_line, size: 16),
                          label: Text("全部吐槽 (${points.length})"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      if (shrinkWrap) {
        return content;
      }
      return SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: content,
        ),
      );
    });
  }

  Widget buildConnectivity() {
    var connectivityType = controller.connectivityType.value;
    IconData icon = Remix.wifi_line;
    var name = "WiFi";
    switch (connectivityType) {
      case ConnectivityResult.bluetooth:
        icon = Remix.wifi_line;
        name = "蓝牙";
        break;
      case ConnectivityResult.ethernet:
        icon = Remix.computer_line;
        name = "有线";
        break;
      case ConnectivityResult.mobile:
        icon = Remix.base_station_line;
        name = "流量";
        break;
      case ConnectivityResult.wifi:
        icon = Remix.wifi_line;
        name = "WiFi";
        break;
      case ConnectivityResult.vpn:
        icon = Remix.shield_keyhole_line;
        name = "VPN";
        break;
      case ConnectivityResult.none:
        icon = Remix.wifi_off_line;
        name = "无网络";
        break;
      case ConnectivityResult.other:
        icon = Remix.question_line;
        name = "未知";
        break;
      default:
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 12),
        AppStyle.hGap4,
        Text(name, style: const TextStyle(fontSize: 12, height: 1.0)),
        AppStyle.hGap8,
      ],
    );
  }

  Widget buildBattery() {
    var battery = controller.batteryLevel.value;
    // IconData icon = Icons.battery_0_bar;
    // if (battery >= 90) {
    //   icon = Icons.battery_full;
    // } else if (battery < 90 && battery >= 80) {
    //   icon = Icons.battery_6_bar;
    // } else if (battery < 80 && battery >= 70) {
    //   icon = Icons.battery_5_bar;
    // } else if (battery < 70 && battery >= 50) {
    //   icon = Icons.battery_4_bar;
    // } else if (battery < 50 && battery >= 30) {
    //   icon = Icons.battery_3_bar;
    // } else if (battery < 30 && battery >= 20) {
    //   icon = Icons.battery_2_bar;
    // } else if (battery < 20 && battery >= 10) {
    //   icon = Icons.battery_1_bar;
    // } else {
    //   icon = Icons.battery_0_bar;
    // }
    return Visibility(
      visible: controller.showBattery.value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(
          //   icon,
          //   size: 16,
          // ),
          // AppStyle.hGap4,
          Text(
            "电量 $battery%",
            style: const TextStyle(fontSize: 12, height: 1.0),
          ),
          AppStyle.hGap8,
        ],
      ),
    );
  }
}
