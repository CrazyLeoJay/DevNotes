# Flutter_gen

资源工具

> https://pub.dev/packages/flutter_gen_runner

[![Pub](flutter_gen.assets/flutter_gen.svg)](https://pub.dartlang.org/packages/flutter_gen)

## Installation 

### As a part of build_runner 

1. Add [build_runner](https://pub.dev/packages/build_runner) and [FlutterGen](https://pub.dev/packages/flutter_gen) to your package's pubspec.yaml file:

   ```yaml
   dev_dependencies:
     build_runner:
     flutter_gen_runner:
   ```

2. Install [FlutterGen](https://pub.dev/packages/flutter_gen)

   ```sh
   flutter pub get
   ```

3. Use [FlutterGen](https://pub.dev/packages/flutter_gen)

   ```sh
   dart run build_runner build
   ```



通过以下命令将 flutter_gen设置到全局脚本

```sh
$ dart pub global activate flutter_gen
```

> 需要设置环境变量

