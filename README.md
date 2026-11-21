<p align="center">
  <img width="116" src="document/logo.png" alt="ZAI-X Logo">
</p>

<h1 align="center">ZAI-X</h1>

<p align="center">
  清爽、跨平台的<a href="https://zaimanhua.com">再漫画</a>第三方开源客户端，使用 Flutter 构建
</p>

<p align="center">
  <a href="https://github.com/AliceRabbit/flutter_zai/releases/latest">
    <img src="https://img.shields.io/github/v/release/AliceRabbit/flutter_zai?include_prereleases&label=Release&color=2f81f7" alt="Latest Release">
  </a>
  <a href="https://github.com/AliceRabbit/flutter_zai/releases">
    <img src="https://img.shields.io/badge/Platform-Android%20%7C%20Windows%20%7C%20iOS%20%7C%20macOS%20%7C%20Linux-555" alt="Platforms">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/AliceRabbit/flutter_zai?label=License&color=3fb950" alt="License">
  </a>
</p>

<p align="center">
  <a href="#下载与安装">下载安装</a> ·
  <a href="#功能亮点">功能亮点</a> ·
  <a href="#界面预览">界面预览</a> ·
  <a href="#项目说明与致谢">项目致谢</a> ·
  <a href="#参与开发与自行编译">开发者指南</a>
</p>

---

## 功能亮点

- **漫画 · 轻小说 · 动漫资讯一站式浏览**  
  支持首页推荐、最新更新、分类筛选、排行榜与全站搜索，轻松发现想看的作品。
- **贴合习惯的阅读体验**  
  - **漫画阅读**：支持优先加载高清图、从左到右 / 从右到左 / 竖向条漫三种阅读方向、全屏阅读、翻页动画、操作反转与吐槽显示。
  - **轻小说阅读**：支持横竖向阅读切换、字体大小与行距自由调节、多套护眼主题即时预览。
- **账号同步与本地管理**  
  支持登录再漫画账号，同步个人订阅、每日一键签到、查看和发表评论；未登录也可使用本机阅读记录与本机收藏，追更不丢进度。
- **离线缓存下载**  
  支持漫画与轻小说批量下载管理，可自定义并发任务数和移动流量下载开关，无网环境也能流畅阅读。
- **主题切换与多端布局适配**  
  内置浅色 / 深色两种外观主题；自动适配手机竖屏与平板、桌面端宽屏分栏界面。

## 下载与安装

前往 [**GitHub Releases**](https://github.com/AliceRabbit/flutter_zai/releases/latest) 获取最新版本：

| 平台 | 系统要求 | 安装方式 |
| :--- | :--- | :--- |
| **Android** | Android 7.0 及以上 | 在 Releases 下载 `.apk` 安装包，点击安装即可 |
| **Windows** | Windows 10 / 11 | 在 Releases 下载 `.zip` 压缩包，解压后直接运行（若提供 `.msix` 也可双击安装） |
| **iOS / macOS / Linux** | iOS 13.0+ / macOS 10.15+ / Linux | 暂不提供官方预编译包，请参考[开发与构建指南](document/DEVELOPMENT.md)自行编译 |

> **提示**：安装后可在应用内 **「我的 → 检查更新」** 随时获取新版本动态；使用中遇到问题或有改进建议，欢迎前往 [Issues](https://github.com/AliceRabbit/flutter_zai/issues) 反馈。

## 界面预览

**浅色模式**

![浅色模式](document/screenshot_light.jpg)

**深色模式**

![深色模式](document/screenshot_dark.jpg)

## 项目说明与致谢

- 本项目基于 [xiaoyaocz/flutter_dmzj](https://github.com/xiaoyaocz/flutter_dmzj) 的 [zaimanhua 分支](https://github.com/xiaoyaocz/flutter_dmzj/tree/zaimanhua) 进行二次开发，现由 [AliceRabbit](https://github.com/AliceRabbit) 独立维护与持续更新。
- 衷心感谢原作者 [xiaoyaocz](https://github.com/xiaoyaocz) 及原项目所有贡献者的开源付出。

## 参与开发与自行编译

如果你想在本地运行源码、为 iOS / macOS / Linux 自行编译安装包，或向本项目提交改进，请查看完整的技术文档：

- [开发与构建指南（document/DEVELOPMENT.md）](document/DEVELOPMENT.md)

文档内包含隔离版 Flutter SDK 安装脚本、Android / Windows 编译环境配置、代码生成、CI 及打包签名等详细说明。

## 免责声明

- 本项目为[再漫画](https://zaimanhua.com)第三方开源客户端，与官方无任何关联。
- 本项目仅供编程技术学习与交流使用，**严禁用于任何商业用途**；因任何商业或不当使用行为产生的后果，均与本项目无关。
- 应用内展示的所有资源版权均归属于其原作者或原站点所有。
- 如本项目存在侵犯您合法权益的情况，请及时联系开发者，我们将第一时间删除相关内容。

## 开源协议

本项目基于 [GPL-3.0 License](LICENSE) 开源，禁止用于任何商业用途。
