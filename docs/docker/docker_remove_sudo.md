# 如何去除管理员调用限制

> 原地址：https://docs.docker.com/engine/install/linux-postinstall/





## [以非root用户身份管理Docker](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

Docker守护进程绑定到Unix套接字，而不是TCP端口。默认情况下，root用户拥有Unix套接字，其他用户只能使用sudo访问它。Docker守护进程始终以root用户身份运行。

如果您不想在docker命令前加上sudo，请创建一个名为docker的Unix组并向其添加用户。当Docker守护程序启动时，它会创建一个可供docker组成员访问的Unix套接字。在某些Linux发行版上，系统在使用包管理器安装Docker引擎时会自动创建此组。在这种情况下，您无需手动创建组。

> **警告**
>
> docker组向用户授予根级权限。有关这如何影响系统安全性的详细信息，请参阅Docker守护程序攻击面。

> **备注**
>
> 要在没有root权限的情况下运行Docker，请参阅以非root用户身份运行Docker守护程序 (无根模式)。

创建docker组并添加用户:

1. 创建docker组。

   

   ```console
   $ sudo groupadd docker
   ```

2. 将您的用户添加到docker组。

   

   ```console
   $ sudo usermod -aG docker $USER
   ```

3. 注销并重新登录，以便重新评估您的组成员身份。

   > 如果在虚拟机中运行Linux，则可能需要重新启动虚拟机以使更改生效。

   您还可以运行以下命令来激活对组的更改:

   

   ```console
   $ newgrp docker
   ```

4. 验证您是否可以在没有sudo的情况下运行docker命令。

   

   ```console
   $ docker run hello-world
   ```

   此命令下载测试映像并在容器中运行它。当容器运行时，它会打印一条消息并退出。

   如果您最初在将用户添加到Docker组之前使用sudo运行docker CLI命令，则可能会看到以下错误:

   

   ```none
   WARNING: Error loading config file: /home/user/.docker/config.json -
   stat /home/user/.docker/config.json: permission denied
   ```

   此错误表示 ~/.docker/目录的权限设置不正确，原因是之前使用了sudo命令。

   要解决此问题，请删除〜/.docker/目录 (它会自动重新创建，但会丢失任何自定义设置)，或使用以下命令更改其所有权和权限:

   

   ```console
   $ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
   $ sudo chmod g+rwx "$HOME/.docker" -R
   ```

## [将Docker配置为在使用systemd启动时启动](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot-with-systemd)

许多现代Linux发行版使用systemd来管理系统引导时启动哪些服务。在Debian和Ubuntu上，Docker服务默认在启动时启动。要使用systemd在其他Linux发行版的引导时自动启动Docker和containerd，请运行以下命令:



```console
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```

若要停止此行为，请改用disable。



```console
$ sudo systemctl disable docker.service
$ sudo systemctl disable containerd.service
```

如果您需要添加HTTP代理、为Docker运行时文件设置不同的目录或分区，或进行其他自定义，请参阅自定义systemd Docker守护程序选项。

## [配置默认日志记录驱动程序](https://docs.docker.com/engine/install/linux-postinstall/#configure-default-logging-driver)

Docker提供日志记录驱动程序，用于从主机上运行的所有容器收集和查看日志数据。默认日志记录驱动程序json-file将日志数据写入主机文件系统上的json格式文件。随着时间的推移，这些日志文件的大小会扩大，从而导致磁盘资源可能耗尽。

要避免将磁盘过度用于日志数据的问题，请考虑以下选项之一:

- 配置json文件日志记录驱动程序以启用日志轮换。
- 使用备用日志记录驱动程序，例如默认情况下执行日志轮转的 “本地” 日志记录驱动程序。
- 使用将日志发送到远程日志记录聚合器的日志记录驱动程序。