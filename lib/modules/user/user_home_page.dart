import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zaix/app/app_color.dart';
import 'package:zaix/app/app_style.dart';
import 'package:zaix/app/dialog_utils.dart';
import 'package:zaix/modules/user/user_home_controller.dart';
import 'package:zaix/services/comic_download_service.dart';
import 'package:zaix/services/novel_download_service.dart';
import 'package:zaix/services/user_service.dart';
import 'package:zaix/widgets/user_photo.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserHomePage extends GetView<UserHomeController> {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : AppColor.backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Get.isDarkMode
            ? SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarColor: Colors.transparent,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                systemNavigationBarColor: Colors.transparent,
              ),
        child: SafeArea(
          child: EasyRefresh(
            header: const MaterialHeader(),
            onRefresh: UserService.instance.refreshProfile,
            child: ListView(
              padding: AppStyle.edgeInsetsA4,
              children: [
                AppStyle.vGap12,
                // 用户名、头像
                Obx(
                  () => Visibility(
                    visible: UserService.instance.logined.value,
                    child: ListTile(
                      leading: UserPhoto(
                        url: UserService.instance.userProfile.value?.cover,
                        size: 48,
                      ),
                      title: Text.rich(
                        TextSpan(
                          text:
                              UserService
                                  .instance
                                  .userProfile
                                  .value
                                  ?.nickname ??
                              UserService.instance.nickname,
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Visibility(
                                visible:
                                    (UserService
                                        .instance
                                        .userProfile
                                        .value
                                        ?.userfeeinfo
                                        ?.isVip ??
                                    false),
                                child: Padding(
                                  padding: AppStyle.edgeInsetsL4,
                                  child: Image.asset(
                                    "assets/images/vip.png",
                                    height: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        UserService.instance.isVip
                            ? UserService.instance.vipInfo
                            : UserService.instance.sign,
                        style: Get.textTheme.bodySmall,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.signingIn.value
                                  ? null
                                  : controller.signIn,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 32),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                shape: const StadiumBorder(),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Visibility(
                                    visible: controller.signingIn.value,
                                    replacement: const Icon(
                                      Remix.calendar_check_line,
                                      size: 16,
                                    ),
                                    child: const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  AppStyle.hGap4,
                                  Text(
                                    controller.signingIn.value ? "签到中" : "签到",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppStyle.hGap4,
                          IconButton(
                            onPressed: controller.logout,
                            icon: const Icon(Remix.logout_box_r_line),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !UserService.instance.logined.value,
                    child: ListTile(
                      leading: const UserPhoto(url: "", size: 48),
                      title: const Text("未登录", style: TextStyle(height: 1.0)),
                      subtitle: const Text("点击前往登录"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.login,
                    ),
                  ),
                ),
                Obx(
                  () => _buildCard(
                    context,
                    children: [
                      Visibility(
                        visible: UserService.instance.logined.value,
                        child: ListTile(
                          leading: const Icon(Remix.heart_line),
                          title: const Text("我的订阅"),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                          onTap: controller.toUserSubscribe,
                        ),
                      ),
                      // Visibility(
                      //   visible: UserService.instance.logined.value,
                      //   child: ListTile(
                      //     leading: const Icon(Remix.history_line),
                      //     title: const Text("浏览记录"),
                      //     trailing: const Icon(
                      //       Icons.chevron_right,
                      //       color: Colors.grey,
                      //     ),
                      //     onTap: controller.toUserHistory,
                      //   ),
                      // ),
                      // Visibility(
                      //   visible: UserService.instance.logined.value,
                      //   child: ListTile(
                      //     leading: const Icon(Remix.chat_smile_2_line),
                      //     title: const Text("我的评论"),
                      //     trailing: const Icon(
                      //       Icons.chevron_right,
                      //       color: Colors.grey,
                      //     ),
                      //     onTap: controller.userComment,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                _buildCard(
                  context,
                  children: [
                    ListTile(
                      leading: const Icon(Remix.file_history_line),
                      title: const Text("本机记录"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.toLocalHistory,
                    ),
                    ListTile(
                      leading: const Icon(Remix.star_line),
                      title: const Text("本机收藏"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.toFavorite,
                    ),
                    ListTile(
                      leading: const Icon(Remix.download_line),
                      title: const Text("漫画下载"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => Visibility(
                              visible: ComicDownloadService
                                  .instance
                                  .taskQueues
                                  .isNotEmpty,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: AppStyle.radius24,
                                ),
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    "${ComicDownloadService.instance.taskQueues.length}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                      onTap: controller.comicDownload,
                    ),
                    ListTile(
                      leading: const Icon(Remix.download_line),
                      title: const Text("小说下载"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => Visibility(
                              visible: NovelDownloadService
                                  .instance
                                  .taskQueues
                                  .isNotEmpty,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: AppStyle.radius24,
                                ),
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    "${NovelDownloadService.instance.taskQueues.length}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                      onTap: controller.novelDownload,
                    ),
                  ],
                ),
                _buildCard(
                  context,
                  children: [
                    ListTile(
                      leading: Icon(
                        Get.isDarkMode ? Remix.moon_line : Remix.sun_line,
                      ),
                      title: const Text("显示主题"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.setTheme,
                    ),
                    ListTile(
                      leading: const Icon(Remix.settings_line),
                      title: const Text("更多设置"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.toSettings,
                    ),
                  ],
                ),
                _buildCard(
                  context,
                  children: [
                    const ListTile(
                      leading: Icon(Remix.error_warning_line),
                      title: Text("免责声明"),
                      trailing: Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: DialogUtils.showStatement,
                    ),
                    ListTile(
                      leading: const Icon(Remix.github_fill),
                      title: const Text("开源主页"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        launchUrlString(
                          "https://github.com/AliceRabbit/flutter_zai",
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Remix.upload_2_line),
                      title: const Text("检查更新"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.checkUpdate,
                    ),
                    ListTile(
                      leading: const Icon(Remix.information_line),
                      title: const Text("关于APP"),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.about,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      margin: AppStyle.edgeInsetsH12.copyWith(top: 12),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: AppStyle.radius8,
        child: Theme(
          data: Theme.of(context).copyWith(
            listTileTheme: ListTileThemeData(
              shape: RoundedRectangleBorder(borderRadius: AppStyle.radius8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}
