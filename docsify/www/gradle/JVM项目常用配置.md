# JVM项目常用配置

## Maven 上传

#### 对于Kotlin项目

```groovy
plugins {
    ...
    `maven-publish`
}

...
    
publishing {
    repositories {
        maven {
//            setUrl("https://maven.leojay.site/repository/maven-releases/")
            setUrl("https://maven.leojay.site/repository/maven-snapshots/")
        }
    }

    publications {
        create<MavenPublication>("leojay-maven") {
            groupId = project.group.toString()
            version = project.version.toString()
            artifactId = project.name
            from(components["java"])
            // kotlin 项目直接使用任务 tasks.kotlinSourcesJar
            artifact(tasks.kotlinSourcesJar)

            println("implementation(\"$groupId:$artifactId:$version\")")
        }
    }
}
```

#### 对于Java项目

先创建任务`sourcesJar`

```groovy
tasks.create("sourcesJar",Jar::class){
    from(sourceSets.main.get().allSource)
    archiveClassifier.set("sources")
}
```

然后添加工件

```groovy
artifact(tasks.getByName("sourcesJar"))
```

