# RTSP协议

## 参考文档：

- [B站讲解](https://www.bilibili.com/video/BV1xd4y147Fb/?spm_id_from=333.788&vd_source=dd1d83183f4d58b105aa36661777a79e)
- [Wiki 文档](https://zh.wikipedia.org/wiki/%E5%8D%B3%E6%99%82%E4%B8%B2%E6%B5%81%E5%8D%94%E5%AE%9A#%E5%8D%8F%E8%AE%AE%E6%8C%87%E4%BB%A4)



## 笔记

| 方法     | 释义                                   |
| -------- | -------------------------------------- |
| OPTIONS  | 请求服务端，询问rtsp服务端支持那些方法 |
| DESCRIBE | 获取流媒体流数据的描述                 |
| SETUP    | 通过获取的视频流数据，建立播放连接     |
| PLAY     | 建立连接后，请求服务端开始播放。       |

