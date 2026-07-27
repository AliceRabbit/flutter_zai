


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

项目固定使用 Flutter 3.22.3（Dart 3.4.4）。Windows 下推荐使用仓库提供的
PowerShell 脚本安装隔离的 SDK，避免全局 Flutter 版本影响构建结果：

```powershell
powershell -ExecutionPolicy Bypass -File .\tool\bootstrap.ps1
.\tool\verify.ps1
```

SDK 会安装到被 Git 忽略的 `.tooling/flutter`，下载完成后会校验 SHA-256。
依赖包使用官方 `pub.dev`，Flutter SDK 和构建产物在中国大陆网络下默认使用
CFUG 镜像；如需全部使用 Google Storage：

```powershell
.\tool\bootstrap.ps1 -UseGoogleStorage
```

常用命令：

```powershell
.\tool\flutter.ps1 run
.\tool\dart.ps1 format lib test
.\tool\verify.ps1 -BuildTarget android
.\tool\verify.ps1 -BuildTarget windows
```

- 单元测试和静态分析只需要 Git 与项目内 Flutter SDK。
- Android 本地编译还需要 JDK 17、Android SDK 34 和 Android SDK Command-line Tools。
- Windows 本地编译还需要 Visual Studio 2022 的“使用 C++ 的桌面开发”工作负载。
- GitHub Actions 会使用相同的 Flutter 版本执行分析、测试、Android 调试构建和
  Windows 调试构建。

## 声明

- 本项目为[再漫画](https://zaimanhua.com)第三方开源APP

- 本项目仅用于学习交流编程技术，严禁将本项目用于商业目的。如有任何商业行为，均与本项目无关。

- 本项目内所有资源版权均归属于其著作者或原站点所有

- 如果本项目存在侵犯您的相关权益的情况，请及时与开发者联系，开发者将会及时删除有关内容。

## License

[GPL-3.0 License](https://github.com/AliceRabbit/flutter_zai/blob/main/LICENSE)，禁止用于任何商业用途
