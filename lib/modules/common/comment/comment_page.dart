import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/modules/common/comment/comment_list_view.dart';
import 'package:zaix/routes/app_navigator.dart';
import 'package:get/get.dart';

class CommentPage extends StatelessWidget {
  final int objId;
  final int type;
  const CommentPage({required this.objId, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              labelPadding: AppStyle.edgeInsetsH24,
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).colorScheme.primary,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Get.isDarkMode
                  ? Colors.white70
                  : Colors.black87,
              tabs: const [
                Tab(text: "最新评论"),
                Tab(text: "热门评论"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CommentListView(objId: objId, type: type, isHot: false),
            CommentListView(objId: objId, type: type, isHot: true),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigator.toAddComment(objId: objId, type: type);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
