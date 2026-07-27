import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/db/comic_history.dart';
import 'package:zaix/requests/user_request.dart';
import 'package:zaix/services/db_service.dart';

class LocalComicHistoryController extends BasePageController<ComicHistory> {
  final UserRequest request = UserRequest();

  @override
  Future<List<ComicHistory>> getData(int page, int pageSize) async {
    if (page > 1) {
      return [];
    }

    return DBService.instance.getComicHistoryList();
  }
}
