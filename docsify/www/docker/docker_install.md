# Docker 安装记录

由于Docker的网站经常上不去，这里记录一下基本安装

> 原网址：https://docs.docker.com/engine/install/ubuntu/
>
> 使用了阿里翻译





# 在Ubuntu上安装Docker引擎

要在Ubuntu上开始使用Docker Engine，请确保您满足先决条件，然后按照安装步骤进行操作。

## [先决条件](https://docs.docker.com/engine/install/ubuntu/#prerequisites)

> **备注**
>
> 如果您使用ufw或firewalld管理防火墙设置，请注意，当您使用Docker公开容器端口时，这些端口会绕过您的防火墙规则。有关更多信息，请参阅Docker和ufw。

### [操作系统要求](https://docs.docker.com/engine/install/ubuntu/#os-requirements)

要安装Docker Engine，您需要以下Ubuntu版本之一的64位版本:

- Ubuntu Noble 24.04 (LTS)
- Ubuntu Mantic 23.10 (EOL: 2024年7月12日)
- Ubuntu Jammy 22.04 (LTS)
- Ubuntu焦点20.04 (LTS)

适用于Ubuntu的Docker引擎兼容x86_64 (或amd64) 、armhf、arm64、s390x和ppc64le (ppc64el) 架构。

### [卸载旧版本](https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions)

在安装Docker Engine之前，您需要卸载任何冲突的软件包。

Distro维护者在APT中提供Docker包的非官方发行版。您必须先卸载这些软件包，然后才能安装Docker引擎的正式版本。

要卸载的非官方软件包是:

- `docker.io`
- `docker-compose`
- `docker-compose-v2`
- `docker-doc`
- `podman-docker`

此外，Docker引擎依赖于containerd和runc。Docker引擎将这些依赖项捆绑为一个包: containerd.io。如果您之前已经安装了containerd或runc，请卸载它们以避免与Docker Engine捆绑的版本冲突。

运行以下命令以卸载所有冲突的软件包:



```console
$ for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

apt-get可能会报告您没有安装这些软件包。

卸载docker时，存储在/var/lib/Docker/中的映像、容器、卷和网络不会自动删除。如果要从全新安装开始，并且希望清理任何现有数据，请阅读卸载Docker引擎部分。

## [安装方法](https://docs.docker.com/engine/install/ubuntu/#installation-methods)

您可以根据需要以不同的方式安装Docker Engine:

- Docker引擎与Docker Desktop for Linux捆绑在一起。这是最简单和最快的方式开始。
- 从Docker的apt存储库设置和安装Docker引擎。
- 手动安装并手动管理升级。
- 使用方便的脚本。仅建议用于测试和开发环境。

### [使用apt存储库进行安装](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

在新主机上首次安装Docker Engine之前，您需要设置Docker存储库。之后，您可以从存储库安装和更新Docker。

1. 设置Docker的apt存储库。

   

   ```bash
   # Add Docker's official GPG key:
   sudo apt-get update
   sudo apt-get install ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   
   # Add the repository to Apt sources:
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   ```

   > **备注**
   >
   > 如果您使用Ubuntu衍生发行版，例如Linux Mint，则可能需要使用UBUNTU_CODENAME而不是VERSION_CODENAME。

   如果这个下载源有问题，可以使用华为源

   https://mirrors.huaweicloud.com/mirrorDetail/5ea14d84b58d16ef329c5c13?mirrorName=docker-ce&catalog=docker

   > 由于有些方法已经过时，这里根据Docker文档进行了改动

   ```bash
   # 信任Docker的GPG公钥:
   curl -fsSL https://mirrors.huaweicloud.com/docker-ce/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://mirrors.huaweicloud.com/docker-ce/linux/ubuntu \
     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   
   #对于amd64架构的计算机，添加软件仓库:
   echo "deb [arch=armhf] https://mirrors.huaweicloud.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
   
   ```

   

2. 安装Docker包。

   最新 具体版本

   ------

   要安装最新版本，请运行:

   

   ```console
   $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

   ------

3. 通过运行hello-world映像，验证Docker引擎安装是否成功。

   

   ```console
   $ sudo docker run hello-world
   ```

   此命令下载测试映像并在容器中运行它。当容器运行时，它会打印一条确认消息并退出。

您现在已成功安装并启动Docker Engine。

> **小费**
>
> 尝试在没有root的情况下运行时收到错误？
>
> docker用户组存在，但不包含任何用户，这就是为什么您需要使用sudo来运行Docker命令。继续Linux postinstall以允许非特权用户运行Docker命令和其他可选配置步骤。

#### [升级Docker引擎](https://docs.docker.com/engine/install/ubuntu/#upgrade-docker-engine)

要升级Docker Engine，请按照安装说明的步骤2，选择要安装的新版本。

### [从软件包安装](https://docs.docker.com/engine/install/ubuntu/#install-from-a-package)

如果您无法使用Docker的apt存储库来安装Docker Engine，则可以下载发布的deb文件并手动安装。每次要升级Docker Engine时，您都需要下载一个新文件。

1. 转到 https://download.docker.com/linux/ubuntu/dists/.

2. 在列表中选择您的Ubuntu版本。

3. 转到pool/stable/并选择适用的体系结构 (amd64、armhf、arm64或s390x)。

4. 下载Docker引擎、CLI、containerd和Docker Compose包的以下deb文件:

   - `containerd.io_<version >_< arch>.deb`
   - `docker-ce_<version >_< arch>.deb`
   - `docker-ce-cli_<version >_< arch>.deb`
   - `docker-buildx-plugin_<version >_< arch>.deb`
   - `docker-compose-plugin_<version >_< arch>.deb`

5. 安装。deb包。将以下示例中的路径更新到您下载Docker包的位置。

   

   ```console
   $ sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
     ./docker-ce_<version>_<arch>.deb \
     ./docker-ce-cli_<version>_<arch>.deb \
     ./docker-buildx-plugin_<version>_<arch>.deb \
     ./docker-compose-plugin_<version>_<arch>.deb
   ```

   Docker守护进程会自动启动。

6. 通过运行hello-world映像，验证Docker引擎安装是否成功。

   

   ```console
   $ sudo service docker start
   $ sudo docker run hello-world
   ```

   此命令下载测试映像并在容器中运行它。当容器运行时，它会打印一条确认消息并退出。

您现在已成功安装并启动Docker Engine。

> **小费**
>
> 尝试在没有root的情况下运行时收到错误？
>
> docker用户组存在，但不包含任何用户，这就是为什么您需要使用sudo来运行Docker命令。继续Linux postinstall以允许非特权用户运行Docker命令和其他可选配置步骤。

#### [升级Docker引擎](https://docs.docker.com/engine/install/ubuntu/#upgrade-docker-engine-1)

要升级Docker Engine，请下载较新的软件包文件并指向新文件重复安装过程。

### [使用便利脚本安装](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

Docker在 https://get.docker.com /提供了一个方便的脚本，用于以非交互方式将Docker安装到开发环境中。不建议在生产环境中使用便利脚本，但它对于创建适合您需求的预配脚本非常有用。另请参阅使用存储库安装步骤，了解使用软件包存储库进行安装的安装步骤。该脚本的源代码是开源的，您可以在GitHub上的docker-install存储库中找到它。

在本地运行脚本之前，请始终检查从internet下载的脚本。在安装之前，请先熟悉便利脚本的潜在风险和限制:

- 该脚本需要root或sudo权限才能运行。
- 该脚本会尝试检测您的Linux发行版和版本，并为您配置软件包管理系统。
- 该脚本不允许您自定义大多数安装参数。
- 该脚本在不要求确认的情况下安装依赖项和建议。这可能会安装大量软件包，具体取决于主机的当前配置。
- 默认情况下，脚本会安装Docker、containerd和runc的最新稳定版本。当使用此脚本配置机器时，这可能会导致Docker的意外主要版本升级。在部署到生产系统之前，始终在测试环境中测试升级。
- 该脚本不是为了升级现有的Docker安装而设计的。使用脚本更新现有安装时，可能无法将依赖项更新到预期版本，从而导致版本过期。

> **提示: 运行前预览脚本步骤**
>
> 您可以使用 -- dry-run选项运行脚本，以了解调用脚本时将运行的步骤:
>
> 
>
> ```console
> $ curl -fsSL https://get.docker.com -o get-docker.sh
> $ sudo sh ./get-docker.sh --dry-run
> ```

此示例从 https://get.docker.com /下载脚本并运行它以在Linux上安装Docker的最新稳定版本:



```console
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
Executing docker install script, commit: 7cae5f8b0decc17d6571f9f52eb840fbc13b2737
<...>
```

您现在已成功安装并启动Docker Engine。docker服务在基于Debian的发行版上自动启动。在基于RPM的发行版上，例如CentOS、Fedora、RHEL或SLES，您需要使用适当的systemctl或service命令手动启动它。如消息所示，默认情况下，非root用户无法运行Docker命令。

> **使用Docker作为非特权用户，还是以无根模式安装？**
>
> 安装脚本需要root或sudo权限才能安装和使用Docker。如果要授予非root用户访问Docker的权限，请参阅Linux的安装后步骤。您还可以在没有root权限的情况下安装Docker，或者将其配置为在无根模式下运行。有关在无根模式下运行Docker的说明，请参阅以非root用户身份运行Docker守护程序 (无根模式)。

#### [安装预发行版](https://docs.docker.com/engine/install/ubuntu/#install-pre-releases)

Docker还在 https://test.docker.com /提供了一个方便的脚本，用于在Linux上安装Docker的预发布版本。此脚本等于脚本a t get.docker.com，但将您的包管理器配置为使用Docker包存储库的测试通道。测试通道包括Docker的稳定版和预发行版 (测试版，候选版本)。使用此脚本可以提前访问新版本，并在将其发布为稳定版本之前在测试环境中对其进行评估。

要从测试通道在Linux上安装最新版本的Docker，请运行:



```console
$ curl -fsSL https://test.docker.com -o test-docker.sh
$ sudo sh test-docker.sh
```

#### [使用便利脚本后升级Docker](https://docs.docker.com/engine/install/ubuntu/#upgrade-docker-after-using-the-convenience-script)

如果您使用便利脚本安装了Docker，则应直接使用包管理器升级Docker。重新运行便利脚本没有任何好处。如果它尝试重新安装主机上已经存在的存储库，则重新运行它可能会导致问题。

## [卸载Docker引擎](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine)

1. 卸载Docker引擎、CLI、containerd和Docker Compose包:

   

   ```console
   $ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
   ```

2. 不会自动删除主机上的映像、容器、卷或自定义配置文件。要删除所有映像、容器和卷，请执行以下操作:

   

   ```console
   $ sudo rm -rf /var/lib/docker
   $ sudo rm -rf /var/lib/containerd
   ```

您必须手动删除所有已编辑的配置文件。

## [后续步骤](https://docs.docker.com/engine/install/ubuntu/#next-steps)

后续如果要使用三方软件管理Docker，会因为管理员权限失败，下个文档记录一下：

[去除管理员限制](docker_remove_sudo.md) 