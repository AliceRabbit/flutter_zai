import 'package:flutter/material.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/models/comment/comment_item.dart';
import 'package:zaix/modules/common/comment/add_comment_controller.dart';
import 'package:get/get.dart';

class AddCommentPage extends StatelessWidget {
  final int type;
  final int objId;
  final CommentItem? replyItem;
  final AddCommentController controller;
  AddCommentPage({
    super.key,
    required this.objId,
    required this.type,
    this.replyItem,
  }) : controller = Get.put(
         AddCommentController(objId: objId, type: type, replyItem: replyItem),
         tag: DateTime.now().millisecondsSinceEpoch.toString(),
       );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("添加评论")),
      body: ListView(
        padding: AppStyle.edgeInsetsA12,
        children: [
          Visibility(
            visible: replyItem != null,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: .2),
                borderRadius: AppStyle.radius4,
              ),
              margin: AppStyle.edgeInsetsB12,
              padding: AppStyle.edgeInsetsA8,
              child: Text("${replyItem?.nickname}：${replyItem?.content}"),
            ),
          ),
          TextField(
            controller: controller.textEditingController,
            decoration: const InputDecoration(
              hintText: "你想说点什么...",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (e) {
              controller.submit();
            },
            minLines: 4,
            maxLines: 6,
            maxLength: 1000,
          ),
          AppStyle.vGap12,
          ElevatedButton(onPressed: controller.submit, child: const Text("发布")),
        ],
      ),
    );
  }
}
