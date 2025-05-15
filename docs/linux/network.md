# 配置网络

## ifconfig 设置网络

> 设置网卡 eth0 的IP地址为 10.3.3.112 掩码为：255.255.255.0

```sh
ifconfig eth0 10.3.3.112 netmask 255.255.255.0
```



## 设置默认网关

> 设置网关。要设置默认网关，可以使用route命令或ip命令。

> 设置网关为 192.168.1.1

```sh
route add default gw 192.168.1.1
```

> 使用ip命令

```sh
ip route add default via 192.168.1.1
```

