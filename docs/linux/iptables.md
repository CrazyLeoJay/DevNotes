# Iptables 工具

> https://linux.die.net/man/8/iptables



## 命令

iptables [-t table] -[AD]** chain rule-specification [options]**
iptables [-t table] -I** chain [rulenum] rule-specification [options]**
iptables [-t table] -R** chain rulenum rule-specification [options]**
iptables [-t table] -D** chain rulenum [options]**
iptables [-t table] -[LFZ]** [chain] [options]**
iptables [-t table] -N** chain**
iptables [-t table] -X** [chain]**
iptables [-t table] -P** chain target [options]**
iptables [-t table] -E** old-chain-name new-chain-name



---

## -t table 取值

### filter

filter表是默认的表，如果不指明表则使用此表。其通常用于过滤数据包。其中的内置链包括：

- INPUT，输入链。发往本机的数据包通过此链。
- OUTPUT，输出链。从本机发出的数据包通过此链。
- FORWARD，转发链。本机转发的数据包通过此链。

### nat 

nat 表如其名，用于[地址转换](https://zh.wikipedia.org/wiki/网络地址转换)操作。其中的内置链包括：

- PREROUTING，路由前链，在处理路由规则前通过此链，通常用于目的地址转换（DNAT）。
- POSTROUTING，路由后链，完成路由规则后通过此链，通常用于源地址转换（SNAT）。
- OUTPUT，输出链，类似PREROUTING，但是处理本机发出的数据包。

### mangle 

mangle表用于处理数据包。其和nat表的主要区别在于，nat表侧重连接而mangle表侧重每一个数据包。[[5\]](https://zh.wikipedia.org/wiki/Iptables#cite_note-5)其中内置链列表如下。

- PREROUTING 
- OUTPUT
- FORWARD
- INPUT
- POSTROUTING

### raw 

raw表用于处理异常，有如下两个内置链：

- PREROUTING
- OUTPUT

---



# 示例

```sh
iptables -t nat -A POSTROUTING -s 10.8.1.0/24 -o eth0 -j MASQUERADE;
iptables -A INPUT -p udp -m udp --dport 51820 -j ACCEPT; 
iptables -A FORWARD -i wg0 -j ACCEPT; 
iptables -A FORWARD -o wg0 -j ACCEPT; 
```

解释：

- 设置nat表，在 请求输出时（POSTROUTING）时，修改从 10.8.1.0/24 地址出来的请求的源地址为 本机（MASQUERADE）
- 设置在 请求输入时，如果请求是指定协议 `udp`（`-p udp `） ，目标端口是51820（--dport）
  - 当链接到当前

,

























