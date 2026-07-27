import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/comment/comment_item.dart';
import 'package:zaix/requests/comment_request.dart';

class CommentListController extends BasePageController<CommentItem> {
  final int type;
  final int objId;
  final bool isHot;
  final CommentRequest request = CommentRequest();
  CommentListController({
    required this.type,
    required this.objId,
    required this.isHot,
  });

  @override
  Future<List<CommentItem>> getData(int page, int pageSize) async {
    if (isHot) {
      return await request.getComment(
        type: type,
        objId: objId,
        page: page,
        sort: 2,
      );
    } else {
      return await request.getComment(type: type, objId: objId, page: page);
    }
  }
}
