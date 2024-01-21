# WS-Discovery（网络服务动态发现）

> - [Web Services Dynamic Discovery (WS-Discovery) 文档](https://schemas.xmlsoap.org/ws/2005/04/discovery/)
>
> - [The WS-Discovery specification pdf 说明书](http://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf)
>
> 
>
> http://www.taodudu.cc/news/show-3252559.html?action=onClick
>
> [发现服务文档 ws-discovery.pdf](https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf)



```xml
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope"
               xmlns:pub="http://schemas.microsoft.com/windows/pub/2005/07"
               xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
               xmlns:wsd="http://schemas.xmlsoap.org/ws/2005/04/discovery"
               xmlns:wsdp="http://schemas.xmlsoap.org/ws/2006/02/devprof"
>
    <soap:Header>
        <wsa:To>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</wsa:To>
        <wsa:Action>http://schemas.xmlsoap.org/ws/2005/04/discovery/ProbeMatches</wsa:Action>
        <wsa:MessageID>urn:uuid:45cd586c-a96a-46c9-887e-4f5d55b1dda9</wsa:MessageID>
        <wsa:RelatesTo>uuid:b68165c3-2123-4699-97a0-cd721f71d2ab</wsa:RelatesTo>
        <wsd:AppSequence InstanceId="1705554843"
                         SequenceId="urn:uuid:97a70238-63ca-4a89-9f0f-f8d15a404831"
                         MessageNumber="63"/>
    </soap:Header>
    <soap:Body>
        <!-- 服务合集 -->
        <wsd:ProbeMatches>
            <!-- 单个服务目标 -->
            <wsd:ProbeMatch>
                <!-- 包含目标服务的稳定的唯一标识符，该标识符在网络接口、传输地址和IPv4/v6之间是恒定的。在这种情况下，该值是UUID方案URI，但如果它满足稳定性和唯一性要求，则它可以是传输URI -->
                <wsa:EndpointReference>
                    <wsa:Address>urn:uuid:974522e9-3f71-4444-ba13-22e30c55dc99</wsa:Address>
                </wsa:EndpointReference>
                <!-- 服务类型 列出了由目标服务实现的类型 (例如，参见 [WSDL 1.1])
                https://www.w3.org/TR/2001/NOTE-wsdl-20010315
                -->
                <wsd:Types>wsdp:Device pub:Computer</wsd:Types>
                <!-- 指示可以到达目标服务的传输地址; 在这种情况下，是单个HTTP传输地址。-->
                <wsd:XAddrs>http://CrazyLeojayNas:5357/974522e9-3f71-4444-ba13-22e30c55dc99</wsd:XAddrs>
                <!-- 包含目标服务的元数据的版本; 如下面所解释的，如果目标服务的元数据 Types 或者其他有变化，则递增该版本-->
                <wsd:MetadataVersion>2</wsd:MetadataVersion>
            </wsd:ProbeMatch>
        </wsd:ProbeMatches>
    </soap:Body>
</soap:Envelope>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope"
                   xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
                   xmlns:d="http://schemas.xmlsoap.org/ws/2005/04/discovery"
                   xmlns:dn="http://www.onvif.org/ver10/network/wsdl"
>
<SOAP-ENV:Header>
    <wsa:MessageID>urn:uuid:221e4f13-5566-7788-99ac-001217869724</wsa:MessageID>
    <wsa:RelatesTo>uuid:b68165c3-2123-4699-97a0-cd721f71d2ab</wsa:RelatesTo>
    <wsa:To SOAP-ENV:mustUnderstand="true">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</wsa:To>
    <wsa:Action SOAP-ENV:mustUnderstand="true">http://schemas.xmlsoap.org/ws/2005/04/discovery/ProbeMatches</wsa:Action>
</SOAP-ENV:Header>
<SOAP-ENV:Body>
    <d:ProbeMatches>
        <d:ProbeMatch>
            <wsa:EndpointReference>
                <wsa:Address>urn:uuid:480ff2de-5566-7788-99aa-001217869724</wsa:Address>
            </wsa:EndpointReference>
            <d:Types>dn:NetworkVideoTransmitter</d:Types>
            <d:Scopes>onvif://www.onvif.org/type/video_encoder onvif://www.onvif.org/type/audio_encoder
                onvif://www.onvif.org/hardware/IPC-model onvif://www.onvif.org/location/country/china
                onvif://www.onvif.org/name/NVT onvif://www.onvif.org/Profile/Streaming
            </d:Scopes>
            <d:XAddrs>http://10.3.3.190:8899/onvif/device_service</d:XAddrs>
            <d:MetadataVersion>10</d:MetadataVersion>
        </d:ProbeMatch>
    </d:ProbeMatches>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope"
                   xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
                   xmlns:d="http://schemas.xmlsoap.org/ws/2005/04/discovery"
                   xmlns:dn="http://www.onvif.org/ver10/network/wsdl"
>
<SOAP-ENV:Header>
    <wsa:MessageID>urn:uuid:414c27ba-5566-7788-99ac-001217869724</wsa:MessageID>
    <wsa:RelatesTo>&#xD;&#xA; uuid:7b63142e-f1d1-403a-b050-966664fb2582&#xD;&#xA;</wsa:RelatesTo>
    <wsa:To SOAP-ENV:mustUnderstand="true">http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</wsa:To>
    <wsa:Action SOAP-ENV:mustUnderstand="true">http://schemas.xmlsoap.org/ws/2005/04/discovery/ProbeMatches</wsa:Action>
</SOAP-ENV:Header>
<SOAP-ENV:Body>
    <d:ProbeMatches>
        <d:ProbeMatch>
            <wsa:EndpointReference>
                <wsa:Address>urn:uuid:480ff2de-5566-7788-99aa-001217869724</wsa:Address>
            </wsa:EndpointReference>
            <d:Types>dn:NetworkVideoTransmitter</d:Types>
            <d:Scopes>onvif://www.onvif.org/type/video_encoder onvif://www.onvif.org/type/audio_encoder
                onvif://www.onvif.org/hardware/IPC-model onvif://www.onvif.org/location/country/china
                onvif://www.onvif.org/name/NVT onvif://www.onvif.org/Profile/Streaming
            </d:Scopes>
            <d:XAddrs>http://10.3.3.190:8899/onvif/device_service</d:XAddrs>
            <d:MetadataVersion>10</d:MetadataVersion>
        </d:ProbeMatch>
    </d:ProbeMatches>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>

```

