# Wieshark 抓包工具过滤命令记录



## 过滤RTSP包

```
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP}
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP, UDP}
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP, HTTP, HTTP/JSON, HTTP/HTML}
```

