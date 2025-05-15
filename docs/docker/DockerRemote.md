# Docker remote 设置



将文件`/lib/systemd/system/docker.service`中这一行做修改

```sh
#ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecStart=/usr/bin/dockerd
```

将文件`/etc/docker/daemon.json`修改为（顺带添加一个镜像地址用于加速。）

```json
{
    "registry-mirrors": ["https://gj4iaamb.mirror.aliyuncs.com"],
    "hosts":["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]
}
```

执行命令

```sh
# 从新加载dockers.service文件
$systemctl daemon-reload
# 重启docker服务
$systemctl restart docker.service
# 查看docker服务
$systemctl status docker.service
```

显示以下内容提供表示运行成功

```shell
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2024-01-17 15:34:42 UTC; 7min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 360526 (dockerd)
      Tasks: 161
     Memory: 253.7M
        CPU: 19.487s
     CGroup: /system.slice/docker.service
             ├─360526 /usr/bin/dockerd
             ├─360851 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 9443 -container-ip 172.18.0.2 -container-port 443
             ├─360858 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 9443 -container-ip 172.18.0.2 -container-port 443
             ├─360873 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 9080 -container-ip 172.18.0.2 -container-port 80
             ├─360880 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 9080 -container-ip 172.18.0.2 -container-port 80
             ├─360904 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 9022 -container-ip 172.18.0.2 -container-port 22
             ├─360938 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 9022 -container-ip 172.18.0.2 -container-port 22
             ├─360961 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 443 -container-ip 172.19.0.2 -container-port 443
             ├─360969 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 443 -container-ip 172.19.0.2 -container-port 443
             ├─360985 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 80 -container-ip 172.19.0.2 -container-port 80
             ├─360992 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 80 -container-ip 172.19.0.2 -container-port 80
             ├─361003 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 9090 -container-ip 172.28.0.2 -container-port 80
             ├─361009 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 9090 -container-ip 172.28.0.2 -container-port 80
             ├─361022 /usr/bin/docker-proxy -proto udp -host-ip 0.0.0.0 -host-port 1194 -container-ip 172.20.0.2 -container-port 1194
             ├─361029 /usr/bin/docker-proxy -proto udp -host-ip :: -host-port 1194 -container-ip 172.20.0.2 -container-port 1194
             ├─361046 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 50000 -container-ip 172.22.0.2 -container-port 50000
             ├─361051 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 50000 -container-ip 172.22.0.2 -container-port 50000
             ├─361067 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8080 -container-ip 172.22.0.2 -container-port 8080
             └─361075 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 8080 -container-ip 172.22.0.2 -container-port 8080

Jan 17 15:34:41 lion-workspace dockerd[360526]: time="2024-01-17T15:34:41.373119518Z" level=info msg="No non-localhost DNS nameservers are left in resolv.conf. Using default external servers: [nameserver 8.8.8.8>
Jan 17 15:34:41 lion-workspace dockerd[360526]: time="2024-01-17T15:34:41.373166745Z" level=info msg="IPv6 enabled; Adding default IPv6 external servers: [nameserver 2001:4860:4860::8888 nameserver 2001:4860:486>
Jan 17 15:34:42 lion-workspace dockerd[360526]: time="2024-01-17T15:34:42.726163872Z" level=info msg="Loading containers: done."
Jan 17 15:34:42 lion-workspace dockerd[360526]: time="2024-01-17T15:34:42.807384624Z" level=info msg="Docker daemon" commit=6051f14 graphdriver(s)=overlay2 version=20.10.23
Jan 17 15:34:42 lion-workspace dockerd[360526]: time="2024-01-17T15:34:42.810447154Z" level=info msg="Daemon has completed initialization"
Jan 17 15:34:42 lion-workspace systemd[1]: Started Docker Application Container Engine.
```



最后使用地址 `tcp://0.0.0.0:2375` 访问，`0.0.0.0`换成服务器所在地址。

