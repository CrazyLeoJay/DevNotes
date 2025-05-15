# JavaFx 快速使用方案

> java8 以后，javafx移出jdk，需要单独导入使用，现在版本根据各个平台不同有不同的二进制文件，所及集成难度较高，可以通过以下方式快速开始。



## Gradle插件

> idea 初始化javafx项目时，自动加载的插件（2024-02-05记录）



| 插件名称                                                     | 版本   | 作用                                                         |
| ------------------------------------------------------------ | ------ | ------------------------------------------------------------ |
| [org.javamodularity.moduleplugin](https://github.com/java9-modularity/gradle-modules-plugin) | 1.8.12 | 帮助Gradle更好的使用java9+适配模块化功能。这里主要帮助javafxplugin插件解决一些依赖问题。 |
| [org.openjfx.javafxplugin](https://github.com/openjfx/javafx-gradle-plugin) | 0.1.0  | 用于导入Javafx的java代码依赖和平台二进制文件。               |
| [org.beryx.jlink](https://github.com/beryx/badass-jlink-plugin) | 2.25.0 | java的构建工具，针对于模块化的项目，可以将项目构建出二进制文件，并且可以执行。<br />可以使用java14引入的jpackage将项目打包为本地可执行文件，比如win的exe文件 |


---

### JavaFxPlugin

> javaFx依赖插件
>
> - [Gadle plugin](https://plugins.gradle.org/plugin/org.openjfx.javafxplugin)
> - https://github.com/beryx/badass-jlink-plugin
> - 

```groovy
plugins {
  id("org.openjfx.javafxplugin") version "0.1.0"
}
```



```groovy
javafx {
        
    modules("javafx.controls", "javafx.fxml")
    //
    version = "17"
}
```







---

### jlink

> 模块化



> - [Git地址](https://github.com/beryx/badass-jlink-plugin)
> - [说明文档](https://badass-jlink-plugin.beryx.org/releases/latest/)
>
> - 



```groovy

```

