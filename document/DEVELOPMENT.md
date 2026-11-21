# ZAI-X 开发与构建指南

本文档面向希望从源码编译、本地调试、运行测试或参与维护 ZAI-X 的开发者。

## 环境要求与 SDK 配置

项目固定使用 **Flutter 3.44.8（Dart 3.12.2）**（版本定义在仓库根目录的 `.flutter-version`）。

Windows 下推荐使用仓库提供的 PowerShell 脚本安装项目内隔离的 SDK，避免受全局 Flutter 版本影响：

```powershell
powershell -ExecutionPolicy Bypass -File .\tool\bootstrap.ps1
.\tool\verify.ps1
```

说明：

- SDK 会安装到被 Git 忽略的 `.tooling/flutter`，下载完成后会自动校验 SHA-256。
- Flutter、Android 与 Protobuf 工具下载均优先调用 `aria2c`（支持并发与断点续传），仅在 `aria2c` 不可用或失败时回退到 `curl`。
- 依赖包使用官方 `pub.dev`，Flutter SDK 与构建产物在中国大陆网络下默认使用 CFUG 镜像；如需全部使用 Google Storage，可执行：

```powershell
.\tool\bootstrap.ps1 -UseGoogleStorage
```

- 单元测试与静态分析仅需 Git 与项目内 Flutter SDK。

## 各平台本地编译准备

### Android（最低支持 API 24 / Android 7.0）

首次进行 Android 本地编译时，执行：

```powershell
.\tool\bootstrap-android.ps1
```

该脚本会优先使用 `aria2c` 下载并校验项目内隔离的构建工具：

- Eclipse Temurin JDK 17
- Android SDK Command-line Tools
- Flutter 3.44 固定使用的 NDK 28.2
- 通过新版 `android sdk` CLI 按精确版本安装 SDK 35 / 36、Build Tools 36.0.0、Platform Tools 37.0.0 与 CMake 3.22.1（其中 SDK 35 用于仍固定以 API 35 编译的传递插件，避免 Gradle 在构建时临时补装）

首次运行会显示 Google 官方条款，所有缓存、Android 用户数据与 Gradle 数据均保存在被 Git 忽略的 `.tooling` 目录。

### Windows

Windows 本地编译需要 Visual Studio Build Tools 的「使用 C++ 的桌面开发」工作负载。可在**管理员 PowerShell** 中执行以下命令进行更新、安装和校验：

```powershell
.\tool\bootstrap-windows.ps1 -Install -UpdateVisualStudio
```

### iOS / macOS（iOS 最低 13.0，macOS 最低 10.15）

iOS 和 macOS 使用 Flutter 3.44 默认的 [Swift Package Manager](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers) 集成；当前原生插件均已支持 SwiftPM，仓库不再依赖处于维护模式的 CocoaPods。

### Linux

需安装基础构建依赖（以 Ubuntu 为例：`clang`、`cmake`、`ninja-build`、`pkg-config`、`libgtk-3-dev`、`liblzma-dev`），并启用 `flutter config --enable-linux-desktop`。

## 常用开发命令

```powershell
# 运行应用
.\tool\flutter.ps1 run

# 格式化代码
.\tool\dart.ps1 format lib test

# 生成 Hive 适配器代码
.\tool\generate-hive.ps1

# 生成 Protobuf 代码
.\tool\generate-protos.ps1

# 运行校验与本地构建
.\tool\verify.ps1 -BuildTarget android
.\tool\verify.ps1 -BuildTarget windows
```

## CI 与版本发布

- **持续集成（GitHub Actions）**：使用相同的 Flutter 版本执行代码生成一致性检查、格式检查、静态分析、单元测试，以及 Android、Windows、Linux、iOS 和 macOS 调试构建。
- **Windows MSIX 签名**：推送 `zaix/*` Tag 发布时，Windows MSIX 使用仓库 Secrets `ZAI_WINDOWS_CERTIFICATE_BASE64`（PFX 的 Base64）和 `ZAI_WINDOWS_CERTIFICATE_PASSWORD` 进行代码签名；证书 Subject 必须为 `CN=AliceRabbit`。Fastforge 不再使用随工具分发的测试证书。未配置签名 Secrets 时，发布工作流会仅上传 Windows ZIP 包。
