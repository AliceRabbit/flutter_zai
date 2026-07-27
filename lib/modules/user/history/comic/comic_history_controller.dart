import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/user/comic_history_model.dart';
import 'package:zaix/requests/user_request.dart';

class ComicHistoryController extends BasePageController<UserComicHistoryModel> {
  final UserRequest request = UserRequest();

  @override
  Future<List<UserComicHistoryModel>> getData(int page, int pageSize) async {
    if (page > 1) {
      return [];
    }
    return await request.comicHistory();
  }
}
