# Gradle 配置记录

## Gradle versionCatalogs 功能使用

官网文档：https://docs.gradle.org/current/userguide/platforms.html#sub:version-catalog-declaration

```gradle
dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            library("groovy-core", "org.codehaus.groovy:groovy:3.0.5")
            library("groovy-json", "org.codehaus.groovy:groovy-json:3.0.5")
            library("groovy-nio", "org.codehaus.groovy:groovy-nio:3.0.5")
            library("commons-lang3", "org.apache.commons", "commons-lang3").version {
                strictly("[3.8, 4.0[")
                prefer("3.9")
            }
        }
    }
}
```

如果要使用文件 libs.versions.toml 需要添加配置。（虽然官网说不需要，但实际上不配置并没有效果，这里还可以指定文件名）

```gradle
dependencyResolutionManagement {
    versionCatalogs {
        create("libs") { from(files("./libs.versions.toml")) }
    }
}
```
