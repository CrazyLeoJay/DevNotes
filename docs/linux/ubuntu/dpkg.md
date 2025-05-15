# dpkg 命令记录

## 安装

```bash

sudo dpkg -i package.deb
```
    

## 卸载

在Ubuntu系统中，使用`dpkg`命令安装的`.deb`软件包可以通过以下步骤来卸载：
1. 打开终端（可以通过在桌面搜索框中输入“终端”或使用快捷键Ctrl+Alt+T来启动）。
2. 在终端中，首先使用`dpkg`命令查询已安装的软件包列表，以确定要卸载的软件包名称。可以使用如下命令：
   ```bash
   dpkg -l | grep package_name
   ```
   将`package_name`替换为你想要卸载的软件包的名称。这个命令会列出所有名称中包含`package_name`的已安装软件包。
3. 确定了要卸载的软件包名称后，使用`dpkg`命令来卸载软件包。命令如下：
   ```bash
   sudo dpkg --remove package_name
   ```
   同样将`package_name`替换为实际的软件包名称。这个命令会卸载软件包，但保留其配置文件。
4. 如果你想要同时删除配置文件，可以使用以下命令：
   ```bash
   sudo dpkg --purge package_name
   ```
   运行这个命令后，软件包及其配置文件都会被删除。
请确保在执行这些操作时你有足够的权限（使用`sudo`），并且要谨慎，因为卸载软件包可能会影响系统的其他部分。如果软件包间存在依赖关系，单纯使用`dpkg`可能会留下未解决的依赖问题。在这种情况下，最好使用`apt`命令来卸载软件包，因为它会自动处理依赖关系：
```bash
sudo apt remove package_name
```
如果需要同时删除配置文件，可以使用：
```bash
sudo apt purge package_name
```
在卸载软件包之前，请确保了解这些操作的影响，并备份重要数据。
