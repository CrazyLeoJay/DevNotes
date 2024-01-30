# SDP 协议

> [SDP协议-知乎解释](https://zhuanlan.zhihu.com/p/672424914)



## 协议一览

```text
# 1. 会话级别的描述（及其字段）
v=  (protocol version)
o=  (originator and session identifier)
s=  (session name)
i=* (session information)
u=* (URI of description)
e=* (email address)
p=* (phone number)
c=* (connection information -- not required if included in all media)
b=* (zero or more bandwidth information lines)
# 2. 一个或多个时间描述（字段参见下文）
z=* (time zone adjustments)
k=* (encryption key)
a=* (zero or more session attribute lines)
# 3. 零个或多个媒体级别的描述（字段参见下文）

# 时间描述的字段有这些
t=  (time the session is active)
r=* (zero or more repeat times)

# 媒体级别的描述字段有这些
m=  (media name and transport address)
i=* (media title)
c=* (connection information -- optional if included at session level)
b=* (zero or more bandwidth information lines)
k=* (encryption key)
a=* (zero or more media attribute lines)
```



## 描述

### v: protocol version

```text
v=0
```

v 的含义是 SDP 协议的版本号，目前 v 都是 0。



### o: originator and session identifier

```text
o=<username> <session-id> <session-version> <nettype> <addrtype> <unicast-address>
```

会话所有者有关的参数，包括用户名、session 信息，地址信息等。 （Owner/creator and session identifier）。

- username: 会话发起者的名称。如果不提供则用"-"表示，用户名不能包含空格；
- session-id: 主叫方的会话标识符；
- session-version: 会话版本号，一般为 0；
- nettype: 网络类型，目前仅使用 IN 来表示 Internet 网络类型；
- addrtype: 地址类型，可以是 IPV4 和 IPV6 两种地址类型；
- unicast-address：会话发起者的 IP 地址。



### s: session name

```text
s=<session name>
```

本次会话的标题或会话的名称（Session name）。



### t: time the session is active

```text
t=<start-time> <stop-time>
```

会话的起始时间和结束时间（Time session starts and stops），如果没有规定这两个时间的话，都写为 0 即可。



### m: media name

```text
m=<media> <port>/<number of ports> <proto> <fmt> ...
```

媒体行，描述了发送方所支持的媒体类型等信息（Media information）。

- media：媒体类型，可以为 "audio"、"video"、"text"、"application"、"message"，表示音频类型、视频类型、文本类型、应用类型、消息类型等，以后也可能扩展其他类型；
- port/number of ports： 流传输端口号。表示在对应的本地端口上发送流；

proto：流传输协议。举例说明：

- RTP/SAVPF 表示用 UDP 传输 RTP 包；

- TCP/RTP/SAVPF 表示用 TCP 传输 RTP 包；

- UDP/TLS/RTP/SAVPF 表示用 UDP 来传输 RTP 包，并且使用 TLS 加密；

- 最后的 SAVPF 还有其他几种值：AVP, SAVP, AVPF, SAVPF。

- - AVP 意为 AV profile
  - S 意为 secure
  - F 意为 feedback

fmt 表示媒体格式描述，它可能是一串数字，代表多个媒体，这个字段的含义与 proto 字段的类型相关。在后面，可以使用"a=rtpmap:"、"a=fmtp:"、"a=rtcp-fb" 等扩展字段来对 fmt 进行说明。



### c: connection data

```text
c=<nettype> <addrtype> <connection-address>
```

一个会话描述必须在每个媒体层都包含“c=”字段或者在会话层包含一个“c=”字段。如果这两个层都出现的话，则媒体层出现的“c=”会覆盖会话层出现的“c=”字段的值。

- nettype: 是一个文本字符串，目前只定义了“IN”，表示“Internet”，未来会定义其他值。
- addrtype: 目前只定义了 IP4 和 IP6。
- connection-address: 标志连接的地址。取决于 addrtype 字段的不同，在 connection-address 之后可能也会跟随其他的字段。



### b: bandwidth

```text
b=<bwtype>:<bandwidth>
```

这个字段的意思是本会话或者媒体所需占用的带宽。 bwtype 可以为 "CT" 或者 "AS"，给出了 bandwidth（单位 kbps）数字所代表的含义：

CT：表示会话所占的所有的带宽的大小。当用于 RTP 会话时，表示所有的 RTP 会话所占用的带宽。

AS：这个带宽类型是针对特定应用的。通常，这表示某应用所占用的最大带宽。当用于 RTP 会话时，表示单一 RTP 会话所占用的带宽.

可以理解为 CT 代表的是整个通话过程的带宽，AS 代表的是某个流的带宽。



### Encryption Keys ("k=")

```text
k=<method>

k=<method>:<encryption key>
```

如果在一个安全的信道上传输 SDP 消息，那么 SDP 之中也可以携带密钥，携带的方式就是采用字段 "k="。当然这种方式目前已经不推荐了。
字段 "k=" 可以是全局的，也可以是放在某个 "m=" 中的，分别代表应用于所有的媒体流，或者单独应用于某条媒体流。定义格式有如下几种：

- k=clear:

在这种方法中，密钥是没有经过任何转换的。除非传输通道是绝对安全的，否则不应当使用这种方法。

- k=base64:

在这种方法中，密钥经过 base64 的编码。除非保证传输通道绝对安全，否则不应当使用这种方法。

- k=uri:

在这种方法中，给出一个 URI。通过这个 URI，可以获得密钥，访问 URI 的过程中可能还需要认证。

- k=prompt

在这种方法中，没有给出密钥。但是加上这个字段后，当用户加入会话时会提示其输入密钥。这种方式目前也不推荐。



### a: attributes

```text
a=<attribute>
a=<attribute>:<value>
```

a 表示的是属性。a 字段是扩展 SDP 的主要方式，有会话层属性和媒体层属性。会话层的属性应用于所有的媒体流，媒体层的属性只应用于当前的媒体流。
属性有两种方式：

- 特性属性，a= 表示，例如："a=recvonly"
- 值属性，以a=:表示，例如"a=ice-ufrag:khLS"



![img](https://pic1.zhimg.com/80/v2-4152d132e88753818c67477f1965fc64_720w.webp)