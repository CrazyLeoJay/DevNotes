# 远程镜像备份



给镜像打个标签

```sh
$ docker tag [当前镜像名]:[当前标签] [新的镜像名]:[新的标签]
```

比如给nexus重新命名	

```sh
$ docker tag sonatype/nexus3:3.69.0-java17 hub.leojay.site/sonatype/nexus3:3.69.0-java17
$ docker push hub.leojay.site/sonatype/nexus3:3.69.0-java17
$ docker pull hub.leojay.site/sonatype/nexus3:3.69.0-java17
```

