# Wieshark 抓包工具过滤命令记录



## 过滤RTSP包

```
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP}
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP, UDP}
any _ws.col.protocol in {RTSP, RTP, RTCP, RTSP/SDP, HTTP, HTTP/JSON, HTTP/HTML}
```



## 排除不需要的包

```bash
any _ws.col.protocol not in {TCP, TLSv1.3,TLSv1.2, UDP, IGMPv2, MDNS, ARP, DNS,STP,ICMPv6,SMB2,SSDP, BROWSER, PKIX-CRL, DHCPv6}
```

