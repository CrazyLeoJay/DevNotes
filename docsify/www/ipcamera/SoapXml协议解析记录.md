# SOAP XML中的协议记录

## Web Services Addressing (WS-Addressing)

> eg.:`xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"`

- W3c 标准地址](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/)

- [转-WS-Addressing](..\w3c\转-WS-Addressing.md) 



## URN 协议

> urn:schemas-xmlsoap-org:ws:2005:04:discovery

`urn:schemas-xmlsoap-org:ws:2005:04:discovery` 是一个统一资源名称（URN），它指定了一个特定的命名空间，这个命名空间是由 XML SOAPhttp://www.onvif.org/ver10/network/wsdl 组织（XMLSOAP.org）在 Web 服务领域定义的。这个命名空间中包含了与 Web 服务发现相关的协议和消息格式，即 WS-Discovery 协议。
WS-Discovery 协议是为了实现 Web 服务的动态发现而设计的。它允许在网络中运行的客户端和服务器能够找到对方，即使它们在设计时不知道对方的详细地址。这一点对于某些应用场景非常重要，比如在一个动态变化的网络环境中，或者当设备频繁加入或离开网络时。
在 WS-Discovery 中，当一个客户端需要找到服务时，它会发送一个叫做“Probe”的消息。这个消息会包含它希望找到的服务类型的信息。其他服务器在收到这个 Probe 消息后，如果提供符合要求的服务，就会返回一个“ProbeMatches”消息，这样客户端就能获得服务的详细信息，包括它们的地址（URI）和如何与之通信的其它相关信息。
URN 的一般格式是 `urn:namespace:localname`，其中 `namespace` 是一个分配给命名空间的字符串，而 `localname` 是该命名空间下的一个本地名称。在这个特定的 URN 中，`schemas-xmlsoap-org` 是命名空间，而 `ws:2005:04:discovery` 是定义在该命名空间下的本地名称，它指向的是 Web 服务发现的相关规范。
这个协议的版本号（在这里是“2005:04:discovery”）表明了它是遵循哪个时间点的 WS-Discovery 规范。随着技术的演进，可能会有新的版本出现，以支持更多的功能或改进现有的实现。

下面是一个发现视频组件的示例：

```xml
<?xml version="1.0" encoding="utf-8"?>
<Envelope xmlns:dn="http://www.onvif.org/ver10/network/wsdl"
          xmlns="http://www.w3.org/2003/05/soap-envelope">
    <Header>
        <wsa:MessageID xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing">
            uuid:7b63142e-f1d1-403a-b050-966664fb2582
        </wsa:MessageID>
        <wsa:To xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing">
            urn:schemas-xmlsoap-org:ws:2005:04:discovery
        </wsa:To>
        <wsa:Action xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing">
            http://schemas.xmlsoap.org/ws/2005/04/discovery/Probe
        </wsa:Action>
    </Header>
    <Body>
        <Probe
                xmlns="http://schemas.xmlsoap.org/ws/2005/04/discovery">
            <Types>dn:NetworkVideoTransmitter</Types>
            <Scopes/>
        </Probe>
    </Body>
</Envelope>
```

