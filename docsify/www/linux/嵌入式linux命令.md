# 嵌入式Linux命令

> - 文档：[设置嵌入式Linux开发板的NFS(网络文件系统)服务，开机自动挂载NFS服务](https://blog.csdn.net/qq_27961843/article/details/103325967/)

## 示例

```sh
mount -o vers=4 192.168.0.1:/home/tsanfer/share /home/root/share
```

- **-o vers=4：表示使用 NFS 文件系统第 4 版本**
- **192.168.0.1：目标主机的 IP 地址**
- **/home/tsanfer/share：远端的主机共享目录。**
- **/home/root/share：本地挂载点，即要把远端共享的目录映射到本地(开发板)的哪个目录**



## 开机自动设置静态IP地址

**添加内容到`/etc/init.d/rc`文件末尾**

> 这个文件应该是开机运行的代码，那么就可以将挂载也配置上。

```sh
ifconfig eth0 10.3.3.112 netmask 255.255.255.0
mount -o vers=4 10.3.3.6:/volume1/nfs_work /mnt
```





## 键入式板端命令：

```sh
mount -o vers=4 10.3.3.6:/volume1/nfs_work /mnt
```

