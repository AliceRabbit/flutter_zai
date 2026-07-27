import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/models/novel/recommend_model.dart';
import 'package:zaix/modules/novel/home/recommend/novel_recommend_controller.dart';
import 'package:zaix/widgets/auto_play_banner.dart';
import 'package:zaix/widgets/keep_alive_wrapper.dart';
import 'package:zaix/widgets/net_image.dart';
import 'package:zaix/widgets/page_list_view.dart';
import 'package:zaix/widgets/refresh_until_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class NovelRecommendView extends StatelessWidget {
  final NovelRecommendController controller;
  NovelRecommendView({super.key})
    : controller = Get.put(NovelRecommendController());

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: PageListView(
        pageController: controller,
        padding: AppStyle.edgeInsetsH12,
        firstRefresh: true,
        loadMore: false,
        showPageLoadding: true,
        itemBuilder: (context, i) {
          var item = controller.list[i];
          if (item.categoryId == 57) {
            return buildBanner(item);
          }

          Widget? action;
          if (item.categoryId == 58) {
            action = buildShowMore(onTap: controller.toLatest);
          }
          return buildCard(
            context,
            child: buildTreeColumnGridView(item.data),
            title: item.title.toString(),
            action: action,
          );
        },
      ),
    );
  }

  Widget buildCard(
    BuildContext context, {
    required Widget child,
    required String title,
    Widget? action,
  }) {
    return Padding(
      padding: AppStyle.edgeInsetsB8,
      child: Container(
        decoration: BoxDecoration(borderRadius: AppStyle.radius8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 48, child: action),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget buildShowMore({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: const Row(
        children: [
          Text("查看更多", style: TextStyle(fontSize: 14, color: Colors.grey)),
          Icon(Icons.chevron_right, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget buildRefresh({required Future Function() onRefresh}) {
    return RefreshUntilWidget(onRefresh: onRefresh, text: "换一批");
  }

  Widget buildBanner(NovelRecommendModel item) {
    return Padding(
      padding: AppStyle.edgeInsetsB12,
      child: ClipRRect(
        borderRadius: AppStyle.radius4,
        child: AspectRatio(
          aspectRatio: 7.5 / 4,
          child: AutoPlayBanner(
            itemCount: item.data.length,
            itemBuilder: (_, i) =>
                NetImage(item.data[i].cover, width: 750, height: 400),
            titleBuilder: (i) => item.data[i].title,
            onTap: (i) => controller.openDetail(item.data[i]),
          ),
        ),
      ),
    );
  }

  Widget buildTreeColumnGridView(List<NovelRecommendItemModel> items) {
    return MasonryGridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      itemCount: items.length,
      itemBuilder: (_, i) {
        var item = items[i];
        return InkWell(
          onTap: () => controller.openDetail(item),
          borderRadius: AppStyle.radius4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppStyle.radius4,
                child: AspectRatio(
                  aspectRatio: 27 / 36,
                  child: NetImage(item.cover, width: 270, height: 360),
                ),
              ),
              AppStyle.vGap8,
              Text(
                item.title,
                maxLines: 1,
                style: const TextStyle(height: 1.2),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item.subTitle ?? item.status ?? '',
                maxLines: 1,
                style: const TextStyle(
                  height: 1.2,
                  fontSize: 12,
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppStyle.vGap8,
            ],
          ),
        );
      },
    );
  }
}
