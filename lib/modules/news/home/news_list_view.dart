import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/app/utils.dart';
import 'package:zaix/models/news/news_tag_model.dart';
import 'package:zaix/modules/news/home/news_list_controller.dart';
import 'package:zaix/routes/app_navigator.dart';
import 'package:zaix/widgets/auto_play_banner.dart';
import 'package:zaix/widgets/keep_alive_wrapper.dart';
import 'package:zaix/widgets/net_image.dart';
import 'package:zaix/widgets/page_list_view.dart';
import 'package:get/get.dart';

class NewsListView extends StatelessWidget {
  final NewsTagModel tag;
  final NewsListController controller;
  NewsListView({super.key, required this.tag})
    : controller = Get.put(NewsListController(tag), tag: tag.id.toString());

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: PageListView(
        pageController: controller,
        firstRefresh: true,
        separatorBuilder: (context, i) => Divider(
          endIndent: 12,
          indent: 12,
          color: Colors.grey.withValues(alpha: .2),
          height: 1,
        ),
        header: tag.id == 0 ? buildBanner() : null,
        itemBuilder: (context, i) {
          var item = controller.list[i];
          return InkWell(
            onTap: () {
              AppNavigator.toNewsDetail(
                newsId: item.articleId.toInt(),
                title: item.title,
                url: item.pageUrl ?? "",
              );
            },
            child: Container(
              padding: AppStyle.edgeInsetsA12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NetImage(
                    item.rowPicUrl ?? "",
                    width: 100,
                    height: 62,
                    borderRadius: 4,
                  ),
                  AppStyle.hGap12,
                  Expanded(
                    child: SizedBox(
                      height: 62,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                Utils.formatTimestamp(item.createTime ?? 0),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     const Icon(
                              //       Icons.thumb_up,
                              //       size: 12.0,
                              //       color: Colors.grey,
                              //     ),
                              //     AppStyle.hGap4,
                              //     Text(
                              //       item.moodAmount.toString(),
                              //       style: const TextStyle(
                              //         color: Colors.grey,
                              //         fontSize: 12,
                              //       ),
                              //     ),
                              //     AppStyle.hGap8,
                              //     const Icon(
                              //       Icons.chat,
                              //       size: 12.0,
                              //       color: Colors.grey,
                              //     ),
                              //     AppStyle.hGap4,
                              //     Text(
                              //       item.commentAmount.toString(),
                              //       style: const TextStyle(
                              //         color: Colors.grey,
                              //         fontSize: 12,
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBanner() {
    return Padding(
      padding: AppStyle.edgeInsetsH12.copyWith(bottom: 4),
      child: Obx(
        () => ClipRRect(
          borderRadius: AppStyle.radius4,
          child: AspectRatio(
            aspectRatio: 75 / 40,
            child: controller.banners.isEmpty
                ? const SizedBox()
                : AutoPlayBanner(
                    itemCount: controller.banners.length,
                    itemBuilder: (_, i) => NetImage(
                      controller.banners[i].picUrl,
                      width: 750,
                      height: 400,
                    ),
                    titleBuilder: (i) => controller.banners[i].title,
                    onTap: (i) => controller.openBanner(controller.banners[i]),
                  ),
          ),
        ),
      ),
    );
  }
}
