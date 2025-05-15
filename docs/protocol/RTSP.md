# RTSP

## 参考文档：

- [B站讲解](https://www.bilibili.com/video/BV1xd4y147Fb/?spm_id_from=333.788&vd_source=dd1d83183f4d58b105aa36661777a79e)
- [Wiki 文档](https://zh.wikipedia.org/wiki/%E5%8D%B3%E6%99%82%E4%B8%B2%E6%B5%81%E5%8D%94%E5%AE%9A#%E5%8D%8F%E8%AE%AE%E6%8C%87%E4%BB%A4)



## 笔记

### URL格式

 rtsp_URL  =  ` (rtsp:|rtspu:)//host[:port] [abs_path]`

| name     | des                                                          |
| -------- | ------------------------------------------------------------ |
| host     | IP地址的合法Internet主机域名 (点分十进制形式)，由RFC 1123第2.1节定义 \ cite{rfc1123} |
| port     | 端口                                                         |
| abs_path | 请注意，片段和查询标识符此时没有明确定义的含义，解释留给RTSP服务器。 |


### 表格总览

| 方法          | 释义                                   |
| ------------- | -------------------------------------- |
| OPTIONS       | 请求服务端，询问rtsp服务端支持那些方法 |
| DESCRIBE      | 获取流媒体流数据的描述                 |
| SETUP         | 通过获取的视频流数据，建立播放连接     |
| PLAY          | 建立连接后，请求服务端开始播放。       |
| PAUSE         | 暂停播放请求                           |
| RECORD        | 请求录像                               |
| ANNOUNCE      |                                        |
| TEARDOWN      | 停止流请求释放相关资源                 |
| GET_PARAMETER |                                        |
| SET_PARAMETER |                                        |
| REDIRECT      |                                        |



> 以下内容复制自 [wiki ](https://zh.wikipedia.org/wiki/%E5%8D%B3%E6%99%82%E4%B8%B2%E6%B5%81%E5%8D%94%E5%AE%9A#%E5%8D%8F%E8%AE%AE%E6%8C%87%E4%BB%A4)

### OPTIONS 请求

OPTIONS请求返回服务器将接受的请求类型。 (C 代表[客户端](https://zh.wikipedia.org/wiki/客户端) S 代表[服务端](https://zh.wikipedia.org/w/index.php?title=服务端&action=edit&redlink=1))

```
C->S:  OPTIONS rtsp://example.com/media.mp4 RTSP/1.0
       CSeq: 1
       Require: implicit-play
       Proxy-Require: gzipped-messages

S->C:  RTSP/1.0 200 OK
       CSeq: 1
       Public: DESCRIBE, SETUP, TEARDOWN, PLAY, PAUSE
```



### DESCRIBE 请求

DESCRIBE请求包括RTSP [URL](https://zh.wikipedia.org/wiki/URL)（rtsp:// ...）以及可以处理的回复数据类型。该回复包括呈现描述，通常以会话描述协议（SDP）格式。其中，演示文稿描述列出了使用汇总网址控制的媒体流。在典型的情况下，每个音频和视频都有一个媒体流。

```
C->S: DESCRIBE rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 2

S->C: RTSP/1.0 200 OK
      CSeq: 2
      Content-Base: rtsp://example.com/media.mp4
      Content-Type: application/sdp
      Content-Length: 460

      m=video 0 RTP/AVP 96
      a=control:streamid=0
      a=range:npt=0-7.741000
      a=length:npt=7.741000
      a=rtpmap:96 MP4V-ES/5544
      a=mimetype:string;"video/MP4V-ES"
      a=AvgBitRate:integer;304018
      a=StreamName:string;"hinted video track"
      m=audio 0 RTP/AVP 97
      a=control:streamid=1
      a=range:npt=0-7.712000
      a=length:npt=7.712000
      a=rtpmap:97 mpeg4-generic/32000/2
      a=mimetype:string;"audio/mpeg4-generic"
      a=AvgBitRate:integer;65790
      a=StreamName:string;"hinted audio track"
```



### SETUP 请求

SETUP请求指定如何传输单个媒体流。这必须在发送PLAY请求之前完成。请求包含媒体流URL和传输说明符。该说明符通常包括用于接收RTP数据（音频或视频）的本地端口，另一个用于RTCP数据（元信息））。服务器回复通常会确认所选参数，并填写缺少的部分，例如服务器选择的端口。必须在发送聚合播放请求之前，使用SETUP配置每个媒体流。

```
C->S: SETUP rtsp://example.com/media.mp4/streamid=0 RTSP/1.0
      CSeq: 3
      Transport: RTP/AVP;unicast;client_port=8000-8001

S->C: RTSP/1.0 200 OK
      CSeq: 3
      Transport: RTP/AVP;unicast;client_port=8000-8001;server_port=9000-9001;ssrc=1234ABCD
      Session: 12345678
```



### Play 播放请求

Play 播放请求 将导致播放一个或所有媒体流。可以通过发送多个播放请求来堆叠播放请求。URL可以是聚合URL（播放所有媒体流）或单个媒体流URL（仅播放该流）。可以指定范围。如果没有指定范围，流将从头开始播放，并播放到最后，或者如果流暂停，则在暂停点恢复播放。

```
C->S: PLAY rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 4
      Range: npt=5-20
      Session: 12345678

S->C: RTSP/1.0 200 OK
      CSeq: 4
      Session: 12345678
      RTP-Info: url=rtsp://example.com/media.mp4/streamid=0;seq=9810092;rtptime=3450012
```



### PAUSE 暂停请求

PAUSE 暂停请求 暂时停止一个或所有媒体流，因此稍后可以通过播放请求恢复。请求包含聚合或媒体流URL。PAUSE请求中的范围参数指定何时暂停。当省略范围参数时，暂停会立即无限期地发生。

```
C->S: PAUSE rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 5
      Session: 12345678

S->C: RTSP/1.0 200 OK
      CSeq: 5
      Session: 12345678
```



### RECORD 记录请求

RECORD 该方法根据呈现描述开始记录一系列媒体数据。时间戳反映开始和结束时间（UTC）。如果没有给定时间范围，请使用演示文稿描述中提供的开始或结束时间。如果会话已经开始，请立即开始录制。服务器决定是否将记录的数据存储在请求URI或其他URI下。如果服务器不使用请求URI，则响应应为201，并包含描述请求状态并引用新资源的实体以及Location头。

```
C->S: RECORD rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 6
      Session: 12345678

S->C: RTSP/1.0 200 OK
      CSeq: 6
      Session: 12345678
```



### ANNOUNCE 发布请求

ANNOUNCE 发布方法有两个目的：

从客户端发送到服务器时，ANNOUNCE将请求URL标识的演示文稿或媒体对象的描述发布到服务器。当从服务器发送到客户端时，ANNOUNCE会实时更新会话描述。如果新的媒体流被添加到演示文稿中（例如，在实时演示中），则应该再次发送整个演示文稿描述，而不仅仅是附加的组件，以便可以删除组件。(下面邮箱'#'号替换成'@')

```
C->S: ANNOUNCE rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 7
      Date: 23 Jan 1997 15:35:06 GMT
      Session: 12345678
      Content-Type: application/sdp
      Content-Length: 332

      v=0
      o=mhandley 2890844526 2890845468 IN IP4 126.16.64.4
      s=SDP Seminar
      i=A Seminar on the session description protocol
      u=http://www.cs.ucl.ac.uk/staff/M.Handley/sdp.03.ps
      e=mjh#isi.edu (Mark Handley)
      c=IN IP4 224.2.17.12/127
      t=2873397496 2873404696
      a=recvonly
      m=audio 3456 RTP/AVP 0
      m=video 2232 RTP/AVP 31

S->C: RTSP/1.0 200 OK
      CSeq: 7
```



### TEARDOWN 停止发布流请求

TEARDOWN 请求用于终止会话。它停止所有媒体流，并释放所有与会话相关的数据在服务器上。

```
C->S: TEARDOWN rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 8
      Session: 12345678

S->C: RTSP/1.0 200 OK
      CSeq: 8
```



### GET_PARAMETER 获取参数请求

GET_PARAMETER 请求检索在URI中指定的呈现或流的参数的值。答复和回复的内容留给实施。没有实体的GET_PARAMETER可能用于测试客户端或服务器活动（“ping”）。

```
S->C: GET_PARAMETER rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 9
      Content-Type: text/parameters
      Session: 12345678
      Content-Length: 15

      packets_received
      jitter

C->S: RTSP/1.0 200 OK
      CSeq: 9
      Content-Length: 46
      Content-Type: text/parameters

      packets_received: 10
      jitter: 0.3838
```



### SET_PARAMETER 设置参数请求

SET_PARAMETER 此方法请求设置由URI指定的演示文稿或流的参数值。

```
C->S: SET_PARAMETER rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 10
      Content-length: 20
      Content-type: text/parameters

      barparam: barstuff

S->C: RTSP/1.0 451 Invalid Parameter
      CSeq: 10
      Content-length: 10
      Content-type: text/parameters

      barparam
```



### REDIRECT 重定向请求

REDIRECT 请求通知客户端它必须连接到另一个服务器位置。它包含强制性头文件位置，表示客户端应发出该URL的请求。它可能包含参数Range，它指示重定向何时生效。如果客户端希望继续发送或接收此URI的媒体，则客户端必须向指定的主机发出针对当前会话的TEARDOWN请求和新会话的SETUP。

```
S->C: REDIRECT rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 11
      Location: rtsp://bigserver.com:8001
      Range: clock=19960213T143205Z-
```



### 嵌入式（交错式）二进制数据

某些防火墙设计和其他情况可能会强制服务器交叉RTSP方法和流数据。通常应避免这种交错，除非有必要，因为它会使客户端和服务器操作复杂化，并增加额外的开销。交叉二进制数据只能在RTSP通过TCP传输时使用。诸如RTP数据包之类的流数据由ASCII码符号（24个十六进制）封装，后跟一个字节的信道标识符，后面是封装二进制数据的长度，以二进制字节为单位，以网络字节顺序排列。流数据紧随其后，没有CRLF，但包括上层协议头。每个$块只包含一个上层协议数据单元，例如一个RTP包。

```
C->S: SETUP rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 3
      Transport: RTP/AVP/TCP;interleaved=0-1

S->C: RTSP/1.0 200 OK
      CSeq: 3
      Date: 05 Jun 1997 18:57:18 GMT
      Transport: RTP/AVP/TCP;interleaved=0-1
      Session: 12345678

C->S: PLAY rtsp://example.com/media.mp4 RTSP/1.0
      CSeq: 4
      Session: 12345678

S->C: RTSP/1.0 200 OK
      CSeq: 4
      Session: 12345678
      Date: 05 Jun 1997 18:59:15 GMT
      RTP-Info: url=rtsp://example.com/media.mp4;
      seq=232433;rtptime=972948234

S->C: $\000{2 byte length}{"length" bytes data, w/RTP header}
S->C: $\000{2 byte length}{"length" bytes data, w/RTP header}
S->C: $\001{2 byte length}{"length" bytes  RTCP packet}
```



