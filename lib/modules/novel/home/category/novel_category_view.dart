import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/modules/novel/home/category/novel_category_controller.dart';
import 'package:zaix/widgets/keep_alive_wrapper.dart';
import 'package:zaix/widgets/net_image.dart';
import 'package:zaix/widgets/page_grid_view.dart';
import 'package:zaix/widgets/shadow_card.dart';
import 'package:get/get.dart';

class NovelCategoryView extends StatelessWidget {
  final NovelCategoryController controller;
  NovelCategoryView({super.key})
    : controller = Get.put(NovelCategoryController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var count = constraints.maxWidth ~/ 160;
        if (count < 3) count = 3;
        return KeepAliveWrapper(
          child: PageGridView(
            pageController: controller,
            firstRefresh: true,
            loadMore: false,
            crossAxisCount: count,
            padding: AppStyle.edgeInsetsH12.copyWith(bottom: 12),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemBuilder: (context, i) {
              var item = controller.list[i];
              return ShadowCard(
                onTap: () {
                  controller.toDetail(item);
                },
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: NetImage(item.cover, borderRadius: 8),
                    ),
                    Padding(
                      padding: AppStyle.edgeInsetsA8,
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(height: 1),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
