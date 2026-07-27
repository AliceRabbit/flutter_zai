import 'package:zaix/app/app_constant.dart';
import 'package:zaix/app/controller/base_controller.dart';
import 'package:zaix/models/comic/author_model.dart';
import 'package:zaix/requests/comic_request.dart';
import 'package:zaix/services/user_service.dart';
import 'package:get/get.dart';

class ComicAuthorDetailController extends BaseController {
  final int id;
  final String authorName;
  ComicAuthorDetailController(this.id, this.authorName);

  final ComicRequest request = ComicRequest();

  Rx<ComicAuthorModel?> detail = Rx<ComicAuthorModel?>(null);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    try {
      pageLoadding.value = true;
      pageError.value = false;
      var result = await request.authorDetail(id: id, authorName: authorName);
      detail.value = result;
    } catch (e) {
      pageError.value = true;
      errorMsg.value = e.toString();
    } finally {
      pageLoadding.value = false;
    }
  }

  void subscribeAll() {
    if (detail.value == null) {
      return;
    }
    UserService.instance.addSubscribe(
      detail.value!.data.map((e) => e.id).toList(),
      AppConstant.kTypeComic,
    );
  }
}
