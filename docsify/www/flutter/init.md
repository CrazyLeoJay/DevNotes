# Flutter 初始化配置

- [开始在 Windows 上构建 Flutter Android 应用](https://docs.flutter.cn/get-started/install/windows/mobile )

- https://docs.flutter.cn/get-started/install/windows/mobile#agree-to-android-licenses



## 文档

- [Dart 文档](https://dart.cn/docs/)
- [Flutter 文档](https://docs.flutter.cn/)







## download

https://storage.flutter-io.cn/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.3-stable.zip

## 网内配置

- [在中国网络环境下使用 Flutter](https://docs.flutter.cn/community/china)

```sh
C:> $env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
C:> $env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

```

### 清华大学 TUNA 协会

[#](https://docs.flutter.cn/community/china#清华大学-tuna-协会)

[清华大学 TUNA 协会](https://tuna.moe/) 维护着 `mirrors.tuna.tsinghua.edu.cn` 镜像。它包括 Flutter SDK 和 pub package。

#### 配置你的机器使用镜像

[#](https://docs.flutter.cn/community/china#configure-your-machine-to-use-this-mirror-2)

请使用以下指令，设置你的机器使用该镜像。

在 macOS、Linux 或 ChromeOS 上：

```
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub;
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
```

content_copy

在 Windows 上：

```
$env:PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub";
$env:FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
```



## 配置

下载好的文件解压到需要安装的目录，将bin目录配置到 path 环境变量中

## 同意 Android 许可证

```sh
flutter doctor --android-licenses
```



## 初始化检查

`flutter doctor` 指令将检查 Windows 完整的 Flutter 开发环境的所有组件。

```sh
flutter doctor

# 查看详情
flutter doctor -v 
```



## 更换源

执行 `flutter doctor` 时可能会有以下错误：

```sh
...
[!] Network resources
    X A network error occurred while checking "https://maven.google.com/": 信号灯超时时间已到


! Doctor found issues in 1 category.
```



找到安装目录下 `packages\flutter_tools\lib\src\http_host_validator.dart`文件，替换源



## [选配] Dart环境变量配置

如果使用全局配置，直接使用脚本

执行命令

```sh
$ dart pub global activate webdev
$ webdev serve
-bash: webdev: command not found
```



需要将路径添加入环境变量 PATH

> 由于是用户目录，建议添加入用户的PATH

```path
C:\Users\{{USERNAME}}\AppData\Local\Pub\Cache\bin
```

| Platform       | Cache location                 |
| -------------- | ------------------------------ |
| macOS or Linux | `$HOME/.pub-cache/bin`         |
| Windows*****   | `%LOCALAPPDATA%\Pub\Cache\bin` |

