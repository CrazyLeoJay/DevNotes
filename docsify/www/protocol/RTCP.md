# RTCP协议

> *RTCP*也是用*UDP*来传送的，但*RTCP*封装的仅仅是一些控制信息，因而分组很短，所以可以将多个*RTCP*分组封装在一个*UDP*包中。

协议地址

- [rfc2326](https://datatracker.ietf.org/doc/html/rfc2326)
- [rfc7826](https://datatracker.ietf.org/doc/html/rfc7826)







# RTCP数据解析





| code | 全称                                 |                |
| ---- | ------------------------------------ | -------------- |
| 200  | SR: Sender Report RTCP Packet        | 发送方RTCP     |
| 201  | RR: Receiver Report RTCP Packet      | 接收方RTCP数据 |
| 203  | BYE: Goodbye RTCP Packet             | 通知链接断开   |
| 204  | APP: Application-Defined RTCP Packet |                |

