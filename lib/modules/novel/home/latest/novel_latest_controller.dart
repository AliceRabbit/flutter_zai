import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/novel/latest_model.dart';
import 'package:zaix/requests/novel_request.dart';

class NovelLatestController extends BasePageController<NovelLatestModel> {
  final NovelRequest request = NovelRequest();

  @override
  Future<List<NovelLatestModel>> getData(int page, int pageSize) async {
    var ls = await request.latest(page: page);

    return ls;
  }
}
