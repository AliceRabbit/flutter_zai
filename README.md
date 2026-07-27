


<p align="center">
    <img width="128" src="/document/logo.png" alt="ZAI-X logo">
</p>
<h2 align="center">ZAI-X</h2>

<p align="center">
使用Flutter编写的再漫画跨平台第三方客户端
</p>

![浅色模式](/document/screenshot_light.jpg)

![深色模式](/document/screenshot_dark.jpg)

## 二次开发说明

- 本仓库基于[原仓库 xiaoyaocz/flutter_dmzj](https://github.com/xiaoyaocz/flutter_dmzj) 的 [zaimanhua 分支](https://github.com/xiaoyaocz/flutter_dmzj/tree/zaimanhua) 进行二次开发。

- 当前仓库由 AliceRabbit 独立维护，用于个人后续功能迭代与发布。

- 感谢原作者 [xiaoyaocz](https://github.com/xiaoyaocz) 及原项目贡献者的开源工作。

## 开发与测试环境

项目固定使用 Flutter 3.44.8（Dart 3.12.2）。Windows 下推荐使用仓库提供的
PowerShell 脚本安装隔离的 SDK，避免全局 Flutter 版本影响构建结果：

```powershell
powershell -ExecutionPolicy Bypass -File .\tool\bootstrap.ps1
.\tool\verify.ps1
```

SDK 会安装到被 Git 忽略的 `.tooling/flutter`，下载完成后会校验 SHA-256。
Flutter、Android 和 Protobuf 工具下载均优先调用 `aria2c`（支持并发与断点续传），
仅在 aria2 不可用或失败时回退到 `curl`。
依赖包使用官方 `pub.dev`，Flutter SDK 和构建产物在中国大陆网络下默认使用
CFUG 镜像；如需全部使用 Google Storage：

```powershell
.\tool\bootstrap.ps1 -UseGoogleStorage
```

首次进行 Android 本地编译时，执行：

```powershell
.\tool\bootstrap-android.ps1
```

该脚本会优先使用 aria2，下载并校验项目内隔离的 Eclipse Temurin JDK 17、
Android SDK Command-line Tools，以及 Flutter 3.44 固定使用的 NDK 28.2；
SDK 35/36、Build Tools 36.0.0、Platform Tools 37.0.0 和 CMake 3.22.1
由新版 `android sdk` CLI 按精确版本安装。SDK 35 用于仍固定以 API 35 编译的
传递插件，避免 Gradle 在构建时临时补装。首次运行会显示 Google 的官方条款，
所有缓存、Android 用户数据和 Gradle 数据均保存在被 Git 忽略的 `.tooling`
目录。

常用命令：

```powershell
.\tool\flutter.ps1 run
.\tool\dart.ps1 format lib test
.\tool\generate-hive.ps1
.\tool\generate-protos.ps1
.\tool\verify.ps1 -BuildTarget android
.\tool\verify.ps1 -BuildTarget windows
```

- 单元测试和静态分析只需要 Git 与项目内 Flutter SDK。
- Android 本地编译环境可由 `tool/bootstrap-android.ps1` 一次性配置。
- Windows 本地编译需要 Visual Studio Build Tools 的“使用 C++ 的桌面开发”
  工作负载；可在管理员 PowerShell 中执行
  `.\tool\bootstrap-windows.ps1 -Install -UpdateVisualStudio` 进行更新、安装和校验。
- iOS 最低支持 13.0，macOS 最低支持 10.15，Android 最低支持 API 24。
- iOS 和 macOS 使用 Flutter 3.44 默认的
  [Swift Package Manager](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers)
  集成；当前原生插件均支持 SwiftPM，仓库不再依赖处于维护模式的 CocoaPods。
- GitHub Actions 会使用相同的 Flutter 版本执行格式检查、分析、测试，以及
  Android、Windows、Linux、iOS 和 macOS 调试构建。
- Tag 发布的 Windows MSIX 使用仓库 Secrets
  `ZAI_WINDOWS_CERTIFICATE_BASE64`（PFX 的 Base64）和
  `ZAI_WINDOWS_CERTIFICATE_PASSWORD` 做代码签名；证书 Subject 必须为
  `CN=AliceRabbit`。Fastforge 不再使用随工具分发的测试证书。

## 声明

- 本项目为[再漫画](https://zaimanhua.com)第三方开源APP

- 本项目仅用于学习交流编程技术，严禁将本项目用于商业目的。如有任何商业行为，均与本项目无关。

- 本项目内所有资源版权均归属于其著作者或原站点所有

- 如果本项目存在侵犯您的相关权益的情况，请及时与开发者联系，开发者将会及时删除有关内容。

## License

[GPL-3.0 License](https://github.com/AliceRabbit/flutter_zai/blob/main/LICENSE)，禁止用于任何商业用途
