# RTP协议

> https://www.cs.columbia.edu/~hgs/teaching/ais/1998/projects/java_rtp/report.html
>
> https://zhuanlan.zhihu.com/p/544970398?utm_id=0



## RTP 数据接收

### 数据结构

> 由于rtp,rtcp,rtsp都在同一端口上，用户需要做tcp解包处理。

RTP数据将以如下格式进行封装：（表头为顺序，值为长度）

| 标识符 | 信道 | 数据长度 | 报文 |
| ------ | ---- | -------- | ---- |
| 1      | 1    | 2        |      |

RTP数据标识符，"$" （0x24）这个一般是固定为0x24

信道数字 1个字节，用来指示信道。可以用来区分音视频等多路流媒体的通道，其中偶数通道为流媒体内容，奇数通道为RTCP(即0x00 一般代表rtp数据， 0x01 一般代表rtcp数据)

数据长度 2个字节，用来指示插入数据长度（数据包的长度减去开始的4个字节，即len字段之后的数据长度）

数据 - 数据包，比如说RTP包，总长度与上面的数据长度相同



### 报文格式









## 字节转整型

> 第三位和第四位字节需要转换为整型长度值，可以参考一下方法
>
> [参考文献](https://blog.csdn.net/LABLENET/article/details/78921803)

Kotlin的位移操作符

​	shl(bits) – 左移位 (Java’s <<)
​	shr(bits) – 右移位 (Java’s >>)
​	ushr(bits) – 无符号右移位 (Java’s >>>)
​	and(bits) – 与
​	or(bits) – 或
​	xor(bits) – 异或

1. 按位与（AND）：将两个操作数的相应位进行逻辑与运算，只有当这两个位都为1时，结果位才会为1。
2. 按位或（OR）：将两个操作数的相应位进行逻辑或运算，只要这两个位中至少有一个为1，结果位就为1。
3. 按位异或（XOR）：将两个操作数的相应位进行逻辑异或运算，当两个位不同时，结果位为1，否则为0。
4. 取反（NOT）：对操作数的每个位进行逻辑取反运算，将0变为1，将1变为0。
5. [左移**](https://m.baidu.com/s?word=左移&sa=re_dqa_zy)（左位移）：将操作数的二进制表示向左移动指定的位数，左侧会填充0，并丢弃移出的位。
6. [右移**](https://m.baidu.com/s?word=右移&sa=re_dqa_zy)（右位移）：将操作数的二进制表示向右移动指定的位数，右侧会填充0或符号位，并丢弃移出的位

示例代码：

```kotlin
private fun ByteArray.toInt(): Int {
    return (((this[0].toInt() and 0xff) shl 8) or (this[1].toInt() and 0xff))
}
```

