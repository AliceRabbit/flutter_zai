import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/widgets/status/app_empty_widget.dart';
import 'package:zaix/widgets/status/app_error_widget.dart';
import 'package:zaix/widgets/status/app_loadding_widget.dart';

import 'package:get/get.dart';

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

class PageListView extends StatelessWidget {
  final BasePageController pageController;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final EdgeInsets? padding;
  final bool firstRefresh;
  final Function()? onLoginSuccess;
  final bool showPageLoadding;
  final bool loadMore;
  final Widget? header;
  const PageListView({
    required this.itemBuilder,
    required this.pageController,
    this.padding,
    this.firstRefresh = false,
    this.showPageLoadding = false,
    this.separatorBuilder,
    this.onLoginSuccess,
    this.loadMore = true,
    this.header,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final enableLoadMore = loadMore && pageController.canLoadMore.value;
      return Stack(
        children: [
          EasyRefresh(
            header: const MaterialHeader(),
            footer: enableLoadMore
                ? const MaterialFooter(
                    clamping: false,
                    infiniteOffset: 70,
                    triggerOffset: 70,
                  )
                : null,
            controller: pageController.easyRefreshController,
            refreshOnStart: firstRefresh,
            onLoad: enableLoadMore ? pageController.loadData : null,
            onRefresh: pageController.refreshData,
            child: ListView.separated(
              padding: padding ?? EdgeInsets.zero,
              controller: pageController.scrollController,
              itemCount: header == null
                  ? pageController.list.length
                  : pageController.list.length + 1,
              itemBuilder: header == null
                  ? itemBuilder
                  : (context, index) {
                      if (index == 0) {
                        return header;
                      }
                      return itemBuilder.call(context, index - 1);
                    },
              separatorBuilder: header == null
                  ? (separatorBuilder ?? (context, i) => const SizedBox())
                  : (context, index) {
                      if (index == 0) {
                        return const SizedBox();
                      }
                      return separatorBuilder?.call(context, index - 1) ??
                          const SizedBox();
                    },
            ),
          ),
          Offstage(
            offstage: !pageController.pageEmpty.value,
            child: AppEmptyWidget(
              onRefresh: () => pageController.refreshData(),
            ),
          ),
          Offstage(
            offstage: !(showPageLoadding && pageController.pageLoadding.value),
            child: const AppLoaddingWidget(),
          ),
          Offstage(
            offstage: !pageController.pageError.value,
            child: AppErrorWidget(
              errorMsg: pageController.errorMsg.value,
              error: pageController.error,
              onRefresh: () => pageController.refreshData(),
            ),
          ),
        ],
      );
    });
  }
}
