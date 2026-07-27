import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/app/utils.dart';
import 'package:zaix/modules/comic/home/special/comic_special_controller.dart';
import 'package:zaix/widgets/keep_alive_wrapper.dart';
import 'package:zaix/widgets/net_image.dart';
import 'package:zaix/widgets/page_list_view.dart';
import 'package:zaix/widgets/shadow_card.dart';
import 'package:get/get.dart';

class ComicSpecialView extends StatelessWidget {
  final ComicSpecialController controller;
  ComicSpecialView({super.key})
    : controller = Get.put(ComicSpecialController());

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: PageListView(
        pageController: controller,
        firstRefresh: true,
        showPageLoadding: false,
        padding: AppStyle.edgeInsetsA12.copyWith(top: 0),
        separatorBuilder: (context, i) => AppStyle.vGap12,
        itemBuilder: (context, i) {
          var item = controller.list[i];
          return ShadowCard(
            onTap: () {
              controller.toDetail(item);
            },
            radius: 8,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 710 / 284,
                  child: NetImage(item.smallCover, width: 710, height: 354),
                ),
                Padding(
                  padding: AppStyle.edgeInsetsA8,
                  child: Row(
                    children: [
                      Expanded(child: Text(item.title)),
                      Text(
                        Utils.formatTimestampToDate(item.createTime),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
