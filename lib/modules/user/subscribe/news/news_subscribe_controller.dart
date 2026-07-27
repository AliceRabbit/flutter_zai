import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/user/subscribe_news_model.dart';
import 'package:zaix/requests/user_request.dart';

class NewsSubscribeController
    extends BasePageController<UserSubscribeNewsModel> {
  final UserRequest request = UserRequest();

  @override
  Future<List<UserSubscribeNewsModel>> getData(int page, int pageSize) async {
    return await request.newsSubscribes(page: page);
  }
}
