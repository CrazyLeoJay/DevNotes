# `OpenWrt` 配置记录

## 重启网络

> [官方文档：网络配置](https://openwrt.org/zh-cn/doc/uci/network?do=admin)

```sh
/etc/init.d/network reload
```





## 防火墙配置文件

`/etc/config/firewall`



## DHCP 配置

> 主要在DHCP配置中

`/etc/config/dhcp`





添加类似于以下配置

### `mac Ip`绑定

```
config host
	option name 'lion-workspace'
	option dns '1'
	option mac '1c:1b:0d:c9:08:6b'
	option ip '10.3.3.210'
	option leasetime 'infinite'
```



### 域名 `ip` 绑定

```
config domain
	option name 'static.leojay.site'
	option ip '10.3.3.6'
```

