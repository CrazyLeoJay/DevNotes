转自：https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/

全文使用 阿里翻译

---



[![W3C](http://www.w3.org/Icons/w3c_home)](http://www.w3.org/) [![W3C Member Submission](http://www.w3.org/Icons/member_subm)](http://www.w3.org/submissions/)

# Web服务寻址 (ws-addressing)

## W3C会员提交2004年8月10日

- 此版本:

  [http:// www.w3.org/提交/2004/SUBM-ws-addressing-20040810/](http://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/)

- 最新版本:

  [http:// www.w3.org/提交/ws-addressing/](http://www.w3.org/submissions/ws-addressing/)

- 作者:

  Don Box，Microsoft (编辑)

  埃里克·克里斯滕森，微软

  Francisco Curbera，IBM (编辑)

  唐纳德·弗格森，IBM

  Jeffrey Frey, IBM

  Marc Hadley, Sun Microsystems, Inc.

  Chris Kaler，微软

  David Langworthy，微软

  Frank Leymann, IBM

  Brad Lovering，微软

  微软的Steve Lucco

  史蒂夫·小米，微软

  Nirmal Mukhi, IBM

  马克·诺丁汉，BEA

  大卫·乌节，比阿

  John Shewchuk, Microsoft

  Eugène Sindambiwe, SAP

  Tony Storey, IBM

  Sanjiva Weerawarana, IBM

  史蒂夫·温克勒，SAP

## 版权声明

版权©2002-2004 BEA系统公司、国际商业机器公司、微软公司、SAP AG和Sun微系统公司。保留所有权利。
本文档在W3C文档许可证下提供。有关更多信息，请参阅W3C知识产权声明和法律免责声明。

------

## 摘要

Ws-addressing提供了用于寻址Web服务和消息的传输中立机制。具体来说，本规范定义了XML [XML 1.0，XML Namespaces] 元素来标识Web服务端点，并确保消息中端到端端点标识的安全。该规范使消息传递系统能够以传输中立的方式支持通过包括端点管理器、防火墙和网关等处理节点的网络进行消息传输。

## 本文档的状态

*本节介绍此文档在发布时的状态。其他文件可能会取代本文件。*

通过发布此文档，W3C承认BEA、IBM、Microsoft、SAP和Sun Microsystems，Inc. 已正式提交W3C进行讨论。W3C发布本文档表示W3C不认可其内容，也不表示W3C已经、正在或将要为其解决的问题分配任何资源。本文档不是W3C特许小组的产品，而是作为W3C流程的潜在输入发布的。在W3C网站上发布公认的成员提交是W3C成员资格的好处之一。请参阅W3C专利政策第3.3节中与会员提交相关的要求。请查阅已确认的W3C成员提交的完整列表。

## 目录

[1.导言](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464314)

[1.1。符号约定](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464315)

[1.2。命名空间](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464316)

[2.端点引用](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464317)

[2.1。端点引用的信息模型](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464318)

[2.2。端点引用XML Infoset表示形式](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464319)

[2.3。绑定终结点引用](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464320)

[2.4端点引用比较](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464321)

[3.消息信息头](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464322)

[3.1。消息信息头XML Infoset表示](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464323)

[3.2制定回复消息](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464324)

[3.3将操作与WSDL操作相关联](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464325)

[3.3.1显式关联](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464326)

[3.3.2默认动作模式](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464327)

[4.故障](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464328)

[4.1无效的邮件信息头](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464329)

[需要4.2消息信息头](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464330)

[4.3目标无法访问](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464331)

[不支持4.4操作](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464332)

[4.5端点不可用](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464333)

[5.安全考虑](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464334)

[6.致谢](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464335)

[7.参考文献](https://www.w3.org/submissions/2004/SUBM-ws-addressing-20040810/#_Toc77464336)

## 1.导言

Web服务寻址 (ws-addressing) 定义了两个可互操作的结构，它们传递通常由传输协议和消息传递系统提供的信息。这些构造将该底层信息标准化为可以独立于传输或应用进行处理的统一格式。这两个构造是端点引用和消息信息头。

Web服务端点是可以将Web服务消息作为目标的 (可引用的) 实体、处理器或资源。端点引用传达标识/引用Web服务端点所需的信息，并且可以以几种不同的方式使用: 端点引用适用于传达访问Web服务端点所需的信息，但也用于为发送到Web服务和从Web服务发送的各个消息提供地址。为了处理这最后一种使用情况，本规范定义了一系列消息信息头，其允许独立于底层传输的消息的统一寻址。这些消息信息头传达端到端消息特性，包括源和目的地端点的寻址以及消息身份。

这两种构造都被设计为可扩展和可重用的，以便其他规范可以构建并利用端点引用和消息信息头。

以下示例说明了如何在从http:// business456.example/client1发送到http:// fabrikam123.example/Purchasing的SOAP 1.2消息中使用这些机制:

```
(001) <S:Envelope xmlns:S="http://www.w3.org/2003/05/soap-envelope"      
                xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing">
(002)   <S:Header>
(003)    <wsa:MessageID>
(004)      uuid:6B29FC40-CA47-1067-B31D-00DD010662DA
(005)    </wsa:MessageID>
(006)    <wsa:ReplyTo>
(007)      <wsa:Address>http://business456.example/client1</wsa:Address>
(008)    </wsa:ReplyTo>
(009)    <wsa:To>http://fabrikam123.example/Purchasing</wsa:To>
(010)    <wsa:Action>http://fabrikam123.example/SubmitPO</wsa:Action>
(011)   </S:Header>
(012)   <S:Body>
(013)     ...
(014)   </S:Body>
(015) </S:Envelope>
```

行 (002) 到 (011) 表示使用规范中定义的机制的SOAP消息的报头。主体由线 (012) 至 (014) 表示。

行 (003) 到 (010) 包含消息信息头块。具体来说，行 (003) 到 (005) 指定此消息的标识符，行 (006) 到 (008) 指定对此消息的答复应作为端点引用发送到的端点。行 (009) 指定该消息的最终接收者的地址URI。行 (010) 指定标识预期语义的动作URI。

### 1.1。符号约定

关键词 “必须” 、 “不得” 、 “必须” 、 “应当” 、 “不得” 、 “应当” 、 “不应当” 、 “推荐” 、 “可以” 、本文档中的 “可选” 和 “可选” 应按照RFC 2119 [RFC 2119] 中的描述进行解释。

在描述抽象数据模型时，本规范使用XML Infoset [XML Infoset] 使用的符号约定。具体来说，抽象属性名称总是出现在方括号中 (例如，[某些属性])。

在描述具体的XML模式 [XML模式第1部分，第2部分] 时，本规范使用ws-security [ws-security] 的符号约定。具体来说，元素的 [children] 或 [attributes] 属性的每个成员都使用类似XPath的表示法 (例如，/x:MyHeader/x:SomeProperty/@ value1) 进行描述。使用 {any} 表示存在元素通配符 (<xs:any/>)。使用 @{any} 表示存在属性通配符 (<xs:anyAttribute/>)。

### 1.2。命名空间

此规范始终使用许多名称空间前缀; 表1中列出了它们。请注意，任何名称空间前缀的选择都是任意的，在语义上并不重要 (请参阅 [XML名称空间])。

| 前缀 | 命名空间                                   |
| :--- | :----------------------------------------- |
| S    | http:// www.w3.org/2003/05/soap-envelope   |
| S11  | http://schemas.xmlsoap.org/soap/envelope   |
| wsa  | http://schemas.xmlsoap.org/ws/2004/08/寻址 |
| wsp  | http://schemas.xmlsoap.org/ws/2002/12/政策 |
| xs   | http:// www.w3.org/2001/XMLSchema          |

表1本规范中使用的前缀和命名空间

Ws-addressing是根据XML信息集 [XML Infoset] 定义的。Ws-addressing符合SOAP 1.2 [SOAP 1.2] 处理模型; 对于使用本规范中定义的构造，SOAP 1.2不是必需的。Ws-addressing还被设计为能够使用WSDL 1.1 [WSDL 1.1] 描述的服务。本规范中的示例使用XML 1.0 [XML 1.0] 表示，但这不是必需的。

Ws-addressing定义的所有信息项都由XML命名空间URI [XMLNamespaces] “http://schemas.xmlsoap.org/ws/2004/08/Addressing” 标识。可以通过取消引用XML命名空间URI来获得规范的XML架构 [XML架构第1部分，第2部分] 文档。

## 2.端点引用

本节定义终结点引用的模型和语法。

本规范引入了一种新的描述元素类型，即端点引用，其目的是支持一组当前没有被WSDL 1.1 [WSDL 1.1] 适当覆盖的动态使用模式。特别是，本规范旨在促进以下使用场景:

- 服务端点描述的动态生成和定制。

- 作为有状态交互的结果而创建的特定服务实例的标识和描述。

- 在紧密耦合的环境中灵活和动态地交换端点信息，其中通信各方共享关于在交互期间使用的特定策略或协议的一组公共假设。

为了支持这些场景，我们定义了一个轻量级和可扩展的机制来动态识别和描述服务端点和实例。由于WSDL 1.1扩展模型的当前限制，WSDL 1.1服务和端口元素不能用于覆盖上面列出的用例。端点引用在逻辑上扩展了WSDL描述模型 (例如，porttype、绑定等)，但不替换它。在以下情况下，将使用端点引用而不是WSDL <service/> 元素:

- 需要标识有状态服务的特定实例，或者需要传输其实例特定的配置细节。

- 需要传达服务端点的轻量级、自包含的描述。特别地，当通信方已经共享端点配置的细节时，这可能是必要的，但是通常作为动态配置过程的结果，需要添加或更新特定的策略信息。

端点引用是对WSDL/1.1 <wsdl:service> 元素的补充，而不是替换元素。我们期望基于WSDL/1.1构建的解决方案继续利用服务元素。展望未来，我们预计端点引用和WSDL将会一致地发展。端点引用可以链接到WSDL/1.1中的服务元素，并且支持处理消息的一方不知道WSDL信息的附加场景。这些场景可以包括动态消息传送或有限能力消息处理器。

### 2.1。端点引用的信息模型

端点引用由以下抽象属性组成:

- [地址]: URI (必需)

  标识终结点的地址URI。这可以是网络地址或逻辑地址。

- [参考属性]: xs:any (0 .. 无界)。

  引用可以包含标识被传送的实体或资源所需的多个单独的属性。引用标识属性是由QName命名的元素信息项，是将消息正确分派到交互的端点侧的端点所必需的。引用属性由端点引用的颁发者提供，否则假定对消费应用程序是不透明的。这些属性的解释 (通常是端点引用的使用) 取决于用于与端点交互的协议绑定和数据编码。下面的2.3节定义了SOAP协议的默认绑定。消费应用程序应假定由具有不同 [reference properties] 的终结点引用表示的终结点可以接受不同的消息集或遵循不同的策略集，因此可能具有不同的关联元数据 (WSDL、XML Schema和ws-policy策略)。引用属性和端点策略之间的关系将在2.4节中进一步说明。

- [参考参数]: xs:any (0 .. unbounded)。

  引用可以包含与端点相关联的多个单独参数以促进特定交互。引用参数是由QName命名的元素信息项，是与端点正确交互所必需的。引用参数也由端点引用的颁发者提供，并且另外假定对消费应用是不透明的。引用参数的使用取决于用于与端点交互的协议绑定和数据编码。2.3节介绍了SOAP协议的默认绑定。与 [reference properties] 不同，两个端点引用的 [reference parameters] 可能不同，但并不意味着不同的XML模式、WSDL或策略适用于端点。

- [所选端口类型]: QName (0..1)

  正在传送的终结点的主portType的QName。

- [服务端口]: (QName，NCName (0..1)) (0..1)

  这是标识WSDL服务元素的QName，该元素包含所传送的端点的定义。服务名称提供指向服务终结点的完整说明的链接。可选的非限定名称标识服务中与端点对应的特定端口。

- [策略]: wsp: 策略 (0 .. 无界)

  Ws-policy [ws-policy] 中描述的可变数量的XML策略元素，用于描述端点的行为、要求和功能。策略可以被包括在端点中以促进消费应用的更容易处理，或者因为策略是动态生成的。然而，嵌入的策略不是权威性的，并且在交互发生时与端点相关联的策略可能是陈旧的或不一致的。

### 2.2。端点引用XML Infoset表示形式

本节将终结点引用的基于XML Infoset的表示形式定义为XML类型 (wsa:EndpointReferenceType) 和XML元素 (<wsa:EndpointReference>)。

wsa:EndpointReferenceType类型用于Web服务端点引用的任何地方。下面介绍了此类型的内容:

```
<wsa:EndpointReference>
    <wsa:Address>xs:anyURI</wsa:Address>
    <wsa:ReferenceProperties>... </wsa:ReferenceProperties> ?
    <wsa:ReferenceParameters>... </wsa:ReferenceParameters> ?
    <wsa:PortType>xs:QName</wsa:PortType> ?
    <wsa:ServiceName PortName="xs:NCName"?>xs:QName</wsa:ServiceName> ?
    <wsp:Policy> ... </wsp:Policy>*
</wsa:EndpointReference>
```

下面介绍了上面的架构概述中列出的属性和元素:

- */wsa:EndpointReference*

  这表示wsa类型的一些元素: EndpointReferenceType。此示例使用预定义的 <wsa:EndpointReference> 元素，但是可以使用类型为wsa:EndpointReferenceType的任何元素。

- */wsa:EndpointReference/wsa: 地址*

  此必需元素 (类型为xs:anyURI) 指定终结点引用的 [address] 属性。该地址可以是服务端点的逻辑地址或标识符。

- */wsa:EndpointReference/wsa:ReferenceProperties/*

  此可选元素包含传达引用的 [reference properties] 的元素。

- */wsa:EndpointReference/wsa:ReferenceProperties/{any}*

  ReferenceProperties的每个子元素表示一个单独的 [reference property]。

- */wsa:EndpointReference/wsa:ReferenceParameters/*

  此可选元素包含传达引用的 [reference parameters] 的元素。

- */wsa:EndpointReference/wsa:ReferenceParameters/{any}*

  ReferenceParameters的每个子元素代表一个单独的 [reference parameter]。

- */wsa:EndpointReference/wsa:PortType*

  此可选元素 (类型为xs:Qname) 指定端点引用的 [selected port type] 属性的值。

- */wsa:EndpointReference/wsa:ServiceName*

  此可选元素 (类型为xs:QName) 指定 <wsdl:service> 定义，该定义包含所引用端点的WSDL描述。

- */wsa:EndpointReference/wsa:ServiceName/@ PortName*

  此可选属性 (类型为xs:NCName) 指定与所引用的端点相对应的 <wsdl:port> 定义的名称。

- */wsa:EndpointReference/wsp:Policy*

  此可选元素指定与端点交互相关的策略。

- */wsa:EndpointReference/{any}*

  这是一种扩展机制，允许指定其他元素。

- */wsa:EndpointReference/@{any}*

  这是一种可扩展性机制，允许指定其他属性。

下面说明了终结点引用。此元素在URI “http:// www.fabrikam123.example/acct” 处引用类型为 “fabrikam:InventoryPortType” 的端口。

```
<wsa:EndpointReference xmlns:wsa="..." xmlns:fabrikam="...">
   <wsa:Address>http://www.fabrikam123.example/acct</wsa:Address>
   <wsa:PortType>fabrikam:InventoryPortType</wsa:PortType>
</wsa:EndpointReference>
```

### 2.3。绑定终结点引用

当消息需要被寻址到端点时，端点引用中包含的信息根据依赖于用于发送消息的协议和数据表示的转换被映射到消息。特定于协议的映射 (或绑定) 将定义如何将端点引用中的信息复制到消息和协议字段。此规范定义了端点引用的SOAP绑定。此映射可能会被其他绑定 (定义为WSDL绑定或策略) 显式替换; 但是，在没有声明必须使用不同映射的适用策略的情况下，假定应用此处定义的SOAP绑定。为了确保与各种设备的互操作性，所有符合的实现都必须支持SOAP绑定。

端点引用的SOAP绑定由以下两个规则定义:

- 端点引用中的 [address] 属性被复制到SOAP消息的 [destination] 标头字段中。
- 每个 [reference property] 和 [reference parameter] 元素都成为SOAP消息中的头块。每个 [reference property] 或 [reference parameter] (包括其所有 [children] 、 [attributes] 和 [in-scope namespaces]) 的元素信息项将作为头块添加到新消息中。

下一个示例显示如何使用端点引用的默认SOAP绑定来构造发往端点的消息:

```
<wsa:EndpointReference xmlns:wsa="..." xmlns:fabrikam="...">
   <wsa:Address>http://www.fabrikam123.example/acct</wsa:Address>
   <wsa:ReferenceProperties>
       <fabrikam:CustomerKey>123456789</fabrikam:CustomerKey>
   </wsa:ReferenceProperties>
   <wsa:ReferenceParameters>
       <fabrikam:ShoppingCart>ABCDEFG</fabrikam:ShoppingCart>
   </wsa:ReferenceParameters>
</wsa:EndpointReference>
```

根据之前所述的映射规则，地址值被复制到 “to” 标头中，并且 “CustomerKey” 元素应被按字面复制为寻址到此端点的SOAP消息中的标头。SOAP消息将如下所示:

```
<S:Envelope xmlns:S="http://www.w3.org/2003/05/soap-envelope"
         xmlns:wsa="..." xmlns:fabrikam="... ">
   <S:Header>
     ...
    <wsa:To>http://www.fabrikam123.example/acct</wsa:To>
    <fabrikam:CustomerKey>123456789</fabrikam:CustomerKey>
    <fabrikam:ShoppingCart>ABCDEFG</fabrikam:ShoppingCart>
     ...
   </S:Header>
   <S:Body>
     ...
   </S:Body>
</S:Envelope>
```

### 2.4端点引用比较

在Web服务交互的过程中，应用可以接收描述其需要与之交互的端点的多个端点引用。也可以随时间接收端点引用的不同副本。

以下规则阐明了由具有相同 [地址] 和相同 [引用属性] 的两个端点引用表示的端点行为之间的关系。

- 两个端点接受相同的消息集，并遵循和要求相同的策略集。也就是说，适用于这两个引用的XML模式、WSDL和ws-policy元数据是相同的。
- 特别地，适用于两个端点的策略是相同的，而与嵌入的 [策略] 的值无关。嵌入的策略不是权威的，并且可能与和端点相关联的策略过时或不一致。

根据 [RFC 2396] 的第6节比较两个端点引用的 [address] 属性。两个端点引用的 [reference properties] 相等，如果:

- 它们包含相同数量的单个属性；
- 对于一个端点引用中的每个引用属性，在另一个端点中存在等效的引用属性。如果每个独占XML规范化的字节流相等，则一个 [reference property] 等效于另一个 [reference property]。

因此，消费应用程序应假定不同的XML模式、WSDL定义和策略应用于地址或引用属性不同的端点引用。

## 3.消息信息头

本节定义了消息信息头的模型和语法。

消息信息头共同增强了具有以下抽象属性的消息。这些属性支持交互中涉及的端点的标识和位置。组成所有其他元素的基本交互模式是 “单向”。在这种模式中，源向目的地发送消息，而无需对交互进行任何进一步的定义。

“请求回复” 是一种常见的交互模式，由源端点发送的初始消息 (请求) 和从请求的目的地发送回源的后续消息 (回复) 组成。回复可以是应用程序消息、故障或任何其他消息。

以下属性支持单向、请求回复和任何其他交互模式:

- [目标]: URI (必需)

  此消息的预期接收者的地址。

- [源端点]: 端点引用 (0..1)

  消息源自的终结点的引用。

- [回复端点]: 端点引用 (0..1)

  一个终结点引用，用于标识答复此消息的预期接收方。如果需要回复，则消息必须包含 [reply endpoint]。发件人必须使用 [reply endpoint] 的内容来制定3.2节中定义的回复消息。如果 [回复端点] 不存在，则 [源端点] 的内容可以用于制定到源的消息。如果消息没有有意义的答复，则可能不存在此属性。如果此属性存在，则需要 [message id] 属性。

- [故障端点]: 端点参考 (0..1)

  一个端点引用，用于标识与此消息相关的故障的预期接收方。当制定3.2和4节中定义的故障消息时，发送方必须使用所回复消息的 [故障端点] 的内容来制定故障消息。如果 [故障端点] 不存在，则发送者可以使用 [应答端点] 的内容来制定故障消息。如果 [故障端点] 和 [应答端点] 都不存在，则发送者可以使用 [源端点] 的内容来制定故障消息。如果发送方不能接收故障消息 (例如，是单向应用程序消息)，则可以不存在该属性。如果此属性存在，则需要 [message id] 属性。

- [操作]: URI (必需)

  唯一地 (并且不透明地) 标识由该消息暗示的语义的标识符。建议 [action] 属性的值为标识WSDL端口类型中的输入、输出或错误消息的URI。动作可以显式地或隐式地与对应的WSDL定义相关联。下面的3.3节描述了关联机制。最后，如果除了 [action] 属性之外，请求中还编码了SOAP操作URI，则SOAP操作的URI必须与 [Action] 属性指定的URI相同。

- [消息id]: URI (0..1)

  在时间和空间上唯一标识此消息的URI。没有两个具有不同应用程序意图的消息可以共享 [消息id] 属性。消息可以出于包括通信失败的任何目的而被重传，并且可以使用相同的 [消息id] 属性。此属性的值是一个不透明的URI，其超出等效性的解释未在此规范中定义。如果需要答复，则必须存在此属性。

- [关系]: (QName，URI) (0 .. 无界)

  指示此消息与另一消息的关系的一对值。关系的类型由QName标识。相关消息由对应于相关消息的 [消息id] 属性的URI标识。消息标识符URI可以指特定的消息，或者是以下众所周知的URI，表示 “未指定的消息”:`http://schemas.xmlsoap.org/ws/2004/08/addressing/id/unspecified`此规范有一个预定义的关系类型:QName描述wsa: 回复指示这是对URI标识的消息的回复。回复消息必须包含由wsa: reply和请求消息的消息id属性组成的 [Reply] 属性。

传入消息的调度基于两个消息属性。强制的 “目的地” 和 “动作” 字段标识目标处理位置和消息的动词或意图。

由于当前广泛使用的网络技术的范围 (例如，NAT、DHCP、防火墙)，许多部署不能向给定端点分配有意义的全局URI。为了允许这些 “匿名” 终结点启动消息交换模式并接收回复，ws-addressing定义了以下众所周知的URI，供无法具有稳定、可解析URI的终结点使用。

```
http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous
```

[reply endpoint] 、 [source endpoint] 和/或 [fault endpoint] 使用此地址的请求必须提供一些带外机制来传递回复或错误 (例如，在同一传输连接上返回回复)。该机制可以是简单的请求/回复传输协议 (例如，httpget或POST)。此URI可以用作回复消息的 [目的地]，并且在其他情况下不应用作 [目的地]。

### 3.1。消息信息头XML Infoset表示

消息信息报头块提供消息的端对端特性，其可以作为一个单元被容易地保护。这些标头中的信息是不可变的，并且不打算沿着消息路径进行修改。

下面介绍了邮件信息头块的内容:

```
  <wsa:MessageID> xs:anyURI </wsa:MessageID>
  <wsa:RelatesTo RelationshipType="..."?>xs:anyURI</wsa:RelatesTo>
  <wsa:To>xs:anyURI</wsa:To>
  <wsa:Action>xs:anyURI</wsa:Action>
  <wsa:From>endpoint-reference</wsa:From>
  <wsa:ReplyTo>endpoint-reference</wsa:ReplyTo>
  <wsa:FaultTo>endpoint-reference</wsa:FaultTo>
```

下面介绍了上面的架构概述中列出的属性和元素:

- */wsa:MessageID*

  此可选元素 (类型为xs:anyURI) 传达 [message id] 属性。如果存在wsa:ReplyTo或wsa:FaultTo，则此元素必须存在。

- */wsa: 关系*

  此可选 (重复) 元素信息项以 (URI，QName) 对的形式提供一个抽象 [relationship] 属性值。此元素 (类型为xs:anyURI) 的 [children] 属性传达相关消息的 [message id]。如果消息是回复，则此元素必须存在。

- */wsa:RelatesTo/@ RelationshipType*

  此可选属性 (类型为xs:QName) 将关系类型作为QName传递。当不存在时，此属性的隐含值是wsa:Reply。

- */wsa:ReplyTo*

  此可选元素 (类型为wsa:EndpointReferenceType) 为 [reply endpoint] 属性提供值。如果需要答复，则此元素必须存在。如果此元素存在，则必须存在wsa:MessageID。

- */wsa: 从*

  此可选元素 (类型为wsa:EndpointReferenceType) 为 [source endpoint] 属性提供值。

- */wsa:FaultTo*

  此可选元素 (类型为wsa:EndpointReferenceType) 为 [fault endpoint] 属性提供值。如果此元素存在，则必须存在wsa:MessageID。

- */wsa: 到*

  此必需元素 (类型为xs:anyURI) 为 [destination] 属性提供值。

- */wsa: 操作*

  xs:anyURI类型的必需元素传达 [action] 属性。此元素的 [children] 传达此属性的值。

### 3.2制定回复消息

对符合ws-addressing的请求消息的答复必须符合ws-addressing，并且必须根据本节中定义的规则进行构造。

下面的示例说明使用SOAP 1.2消息中的消息信息头块的请求消息:

```
<S:Envelope xmlns:S="http://www.w3.org/2003/05/soap-envelope"
  xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
  xmlns:f123="http://www.fabrikam123.example/svc53">
  <S:Header> 
  <wsa:MessageID>uuid:aaaabbbb-cccc-dddd-eeee-ffffffffffff
    </wsa:MessageID>
    <wsa:ReplyTo> 
    <wsa:Address>http://business456.example/client1</wsa:Address>
    </wsa:ReplyTo>
    <wsa:To S:mustUnderstand="1">mailto:joe@fabrikam123.example</wsa:To>
    <wsa:Action>http://fabrikam123.example/mail/Delete</wsa:Action>
  </S:Header>
  <S:Body>
    <f123:Delete>     
       <maxCount>42</maxCount>
    </f123:Delete>
  </S:Body>
</S:Envelope>
```

此消息将具有以下属性值:

[目标] URI mailto:joe@fabrikam123.example

[回复端点] 具有 [address] 的端点http:// business456.example/client1

[action] http:// fabrikam123.example/mail/Delete

[消息id] uuid:aaaabbbb-cccc-dddd-eeee-ffffffffffff

下面的示例说明使用SOAP 1.2消息中的消息信息头块的回复消息:

```
<S:Envelope
  xmlns:S="http://www.w3.org/2003/05/soap-envelope" 
  xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing"
  xmlns:f123="http://www.fabrikam123.example/svc53">
  <S:Header>
    <wsa:MessageID>
      uuid:aaaabbbb-cccc-dddd-eeee-wwwwwwwwwww
    </wsa:MessageID>
    <wsa:RelatesTo>
      uuid:aaaabbbb-cccc-dddd-eeee-ffffffffffff
    </wsa:RelatesTo>
    <wsa:To S:mustUnderstand="1">
      http://business456.example/client1
    </wsa:To>
    <wsa:Action>http://fabrikam123.example/mail/DeleteAck</wsa:Action>
  </S:Header>
  <S:Body>
    <f123:DeleteAck/>
  </S:Body>
</S:Envelope>
```

此消息将具有以下属性值:

[目标] http:// business456.example/client1

[action] http:// fabrikam123.example/mail/DeleteAck

[消息id] uuid:aaaabbbb-cccc-dddd-eeee-wwwwwww

[关系] (wsa: 回复，uuid:aaaabbbb-cccc-dddd-eeee-ffffffffffff)

### 3.3将操作与WSDL操作相关联

Ws-addressing定义了两种机制来将动作与WSDL端口类型中的输入、输出和故障元素相关联。

### 3.3.1显式关联

可以使用wsa: action属性来显式地关联该动作，或者在缺少该属性的情况下，由第3.3.2节中的规则来定义该动作。

例如，考虑以下WSDL摘录:

```
<definitions targetNamespace="http://example.com/stockquote" ...>
  ...
  <portType name="StockQuotePortType">
    <operation name="GetLastTradePrice">
      <input message="tns:GetTradePricesInput"
            wsa:Action="http://example.com/GetQuote"/>
      <output message="tns:GetTradePricesOutput"
            wsa:Action="http://example.com/Quote"/>
    </operation>
  </portType>
  ...
</definitions>
```

StockQuotePortType中GetLastTradePrice操作的输入的操作被显式定义为http://example.com/GetQuote.此相同操作的输出的操作是http://example.com/Quote. 的

### 3.3.2默认动作模式

在没有wsa:Action属性时，以下模式用于构造输入和输出的默认操作。动作URI的一般形式如下:

```
[target namespace]/[port type name]/[input|output name]
```

“/” 是要包含在动作中的文字字符。这些性质的值定义如下。

[target namespace] 是目标命名空间 (/definition/@ targetNamespace)。如果 [目标命名空间] 以 “/” 结尾，则不添加 “/”。

[端口类型名称] 是端口类型的名称 (/definition/portType/@ name)。

[input | output name] 是WSDL 1.1的2.4.5节中定义的元素的名称。

对于故障消息，不应用此模式。相反，以下URI是错误消息的默认操作URI:

```
http://schemas.xmlsoap.org/ws/2004/08/addressing/fault
```

例如，考虑以下WSDL摘录:

```
<definitions targetNamespace="http://example.com/stockquote" ...>
  ...
  <portType name="StockQuotePortType">
    <operation name="GetLastTradePrice">
      <input message="tns:GetTradePricesInput" name="GetQuote"/>
      <output message="tns:GetTradePricesOutput" name="Quote"/>
    </operation>
  </portType>
  ...
</definitions>
```

[targetNamespace] = http://example.com/stockquote

[端口类型名称] = StockQuotePortType

[输入名称] = GetQuote

[输出名称] = Quote

应用上面的模式与这些值，我们有:

输入操作 = http://example.com/stockquote/StockQuotePortType/GetQuote

输出操作 = http://example.com/stockquote/StockQuotePortType/Quote

如果不存在name属性，WSDL将为默认输入或输出名称定义规则。请考虑以下示例:

例如，考虑以下WSDL摘录:

```
<definitions targetNamespace="http://example.com/stockquote" ...>
  ...
  <portType name="StockQuotePortType">
    <operation name="GetLastTradePrice">
      <input message="tns:GetTradePricesInput"/>
      <output message="tns:GetTradePricesOutput"/>
    </operation>
  </portType>
  ...
</definitions>
```

[targetNamespace] = http://example.com/stockquote

[端口类型名称] = StockQuotePortType

根据WSDL 2.4.5中定义的规则，如果请求响应操作的输入缺少name属性，则默认值为附加的操作 “request” 的名称。

[输入名称] = GetLastTradePriceRequest

同样，输出默认为附加了 “Response” 的操作名称。

[输出名称] = GetLastTradePriceResponse

应用上面的模式与这些值，我们有:

输入操作 = http://example.com/stockquote/StockQuotePortType/GetLastTradePriceRequest

输出操作 = http://example.com/stockquote/StockQuotePortType/GetLastTradePriceResponse

## 4.故障

如果满足每个子部分的前导码中规定的条件，则会生成此部分中定义的故障。如果存在且有效，则将它们发送到 [故障端点]。否则，它们被发送到 [回复端点] (如果存在)。如果两者都不存在，则可以将故障发送到 [源端点]。

符合此规范的端点必须在所有错误消息中包含必需的消息信息标头。使用第3节中定义的 [reliationship] 属性将故障消息关联为回复。下面的 [action] 属性指定ws-addressing错误消息 (此URI也用作WSDL错误消息的默认操作值，如第3.3.2节所述):

```
http://schemas.xmlsoap.org/ws/2004/08/addressing/fault
```

故障的定义使用以下属性:

[代码] 故障代码。

[Subcode] 故障子代码。

[Reason] 英语语言原因元素。

[细节] 细节元素。如果不存在，则不为故障定义细节元素。

上述属性绑定到SOAP 1.2错误，如下所示:

```
<S:Envelope>
 <S:Header>
   <wsa:Action>
     http://schemas.xmlsoap.org/ws/2004/08/addressing/fault
   </wsa:Action>
   <!-- Headers elided for clarity.  -->
 </S:Header>
 <S:Body>
  <S:Fault>
   <S:Code>
    <S:Value>[Code]</S:Value>
     <S:Subcode>
    <S:Value>[Subcode]</S:Value>
     </S:Subcode>
   </S:Code>
   <S:Reason>
     <S:Text xml:lang="en">[Reason]</S:Text>
   </S:Reason>
   <S:Detail>
     [Detail]
  </S:Detail>   
  </S:Fault>
 </S:Body>
</S:Envelope>
```



SOAP 1.1错误的表现力较弱，只映射 [Subcode] 和 [Reason]。这些属性绑定到SOAP 1.1错误，如下所示:

```
<S11:Envelope>
 <S11:Body>
  <S11:Fault>
   <faultcode>[Subcode]</faultcode>
   <faultstring xml:lang="en">[Reason]</faultstring>
  </S11:Fault>
 </S11:Body>
</S11:Envelope>
```

### 4.1无效的邮件信息头

无法处理邮件信息头。

[代码] S:Sender

[Subcode] wsa:InvalidMessageInformationHeader

[原因] 消息信息头无效，无法处理该消息。有效性失败可以是结构的或语义的，例如不是URI的 [目的地] 或与从未发出的 [消息id] 的 [关系]。

[详细] [无效表头]

### 需要4.2消息信息头

缺少所需的消息信息头。

[代码] S:Sender

[Subcode] wsa:MessageInformationHeaderRequired

[原因] 不存在必需的消息信息头、To、MessageID或Action。

[详细] [缺少标题QName]

### 4.3目标无法访问

找不到能够充当 [destination] 属性角色的终结点。

[代码] S:Sender

[Subcode] wsa:DestinationUnreachable

[原因] 无法确定到达ws-addressing to定义的目标角色的路由。

[详细] 空

### 不支持4.4操作

此端点不支持消息中的 [action] 属性。

故障内容如下:

[代码] S:Sender

[子代码] wsa:ActionNotSupported

[原因] 无法在接收方处理 [操作]。

[详细] [行动]

### 4.5端点不可用

由于某些暂时性问题或永久性故障，端点此时无法处理消息。

端点可以可选地在细节中包括retryafer参数。在该持续时间过去之前，源不应重传该消息。

[代码] S: 接收器

[Subcode] wsa:EndpointUnavailable

[原因] 端点此时无法处理消息。

[详细] <wsa: retryaft...>[xs: 非负整数]</wsa: retryaftm>

下面介绍了上面列出的属性和元素:

- /wsa:RetryAfter

  此元素 (类型为xs:NonNegativeInteger) 是建议的在重新传输消息之前等待的最小持续时间 (以毫秒为单位)。如果从详细信息中省略此元素，则该值为无穷大。

- /wsa:RetryAfter/@{any}

  这些可选的扩展性属性不影响处理。

## 5.安全考虑

强烈建议使用ws-security [ws-security] 中描述的机制来保护服务之间的通信。为了正确地保护消息，主体和所有相关的报头需要被包括在签名中。具体地，本说明书中描述的消息信息头部 (例如 <wsa:To>) 需要用主体签名，以便将两者 “绑定” 在一起。应当注意，对于通过中介的消息，当消息到达最终接收者时，消息信息报头中的一些或全部可能具有多个签名。强烈建议初始发送者包括签名，以防止中间人的任何欺骗。

只要指定了地址 (例如 <wsa:From>，<wsa:ReplyTo>，<wsa:FaultTo>，...)，处理器应确保签名具有允许其代表指定目标的声明，以防止某些类别的攻击 (例如重定向)。同样，如果指定的端点包含资源属性或参数，则应注意，因为未经验证的端点引用可能会导致某些类别的标头插入攻击。

消息信息报头块可以使它们的内容被加密以便获得端到端隐私，但是应当注意确保中间处理器能够访问所需的信息 (例如 <wsa: to>)。

一些处理器可以使用消息标识符 (<wsa:MessageID>) 作为唯一性度量的一部分，以便检测消息的重放。应注意确保实际使用唯一标识符。例如，在一些场景中，将消息标识符与时间戳组合可能是适当的。

以下列表总结了适用于此协议的常见攻击类别，并确定了防止/缓解攻击的机制:

- 消息更改-通过使用ws-security包括消息信息的签名来防止更改。

- 消息泄露-通过使用ws-security加密敏感数据来保护机密性。

- 地址欺骗-通过确保所有地址都由授权代表 (或代表) 地址的一方签名来防止地址欺骗。

- 密钥完整性-通过使用可能的最强算法来维护密钥完整性 (通过比较安全策略-请参见ws-policy [ws-policy] 和ws-securitypolicy [ws-securitypolicy])。

- 身份验证-使用ws-security和ws-trust [ws-trust] 中描述的机制建立身份验证。使用ws-security中描述的机制对每个消息进行身份验证。

- 问责制-问责制是所使用的密钥和算法的类型和强度的函数。在许多情况下，强对称密钥提供足够的责任。但是，在某些环境中，需要强大的PKI签名。

- 可用性-所有可靠的消息传递服务都会受到各种可用性攻击。重播检测是一种常见的攻击，建议通过ws-security和/或消息标识符缓存中描述的机制来解决此问题。其他攻击 (例如网络级拒绝服务攻击) 更难避免，并且超出了本规范的范围。也就是说，应当注意确保在任何认证序列之前保存最小状态。

- 重放-可以出于各种原因重放消息。为了检测和消除这种攻击，应该使用一些机制来识别重放的消息，例如ws-security中概述的时间戳/nonce。可替换地，并且可选地，还可以使用诸如定序之类的其他技术来防止应用消息的重放。

## 6.致谢

Keith Ballinger, Microsoft; Michael Coulson, Microsoft; Giovanni Della-Libera, Microsoft; Christopher Ferris, IBM; Tom Freund, IBM; Steve Graham, IBM; Christoph Hofmann, SAP; Maryann Hondo, IBM; Efim Hudis, Microsoft; John Ibbotson, IBM; Gopal Kakivaya, Microsoft; Al Lee,microsoft; IBM的Anthony Nadalin; IBM的Bill Nagy; IBM的Martin Nally; Microsoft的Henrik Frystyk Nielsen; SAP的Vladimir Savchenko; Microsoft的Jeffrey Schlimmer; IBM的Chris Sharp; Microsoft的Keith Stobie; SAP的Vladimir Videlov；

## 7.参考文献

- **[RFC 2119]**

  S. Bradner，“RFC中用于指示需求级别的关键词”，RFC 2119，哈佛大学，1997 3月。

- **[RFC 2396]**

  T.Berners-lee等人，“统一资源标识符 (URI): 通用语法”，rfc2396bis，W3C/MIT，2004年7月。

- [XML 1.0]

  W3C推荐标准 “可扩展标记语言 (XML) 1.0 (第二版)”，Tim Bray，Jean Paoli，C.M。Sperberg-mcqueen，Eve Maler，2000年10月6日

- [XML命名空间]

  W3C Recommendation "Namespaces in XML"，Tim Bray，Dave Hollander，Andrew Layman，1999年1月14日

- [XML信息集]

  W3C Recommendation "XML Information Set"，John Cowan，Richard Tobin，2001年10月24日

- **[XML架构，第1部分]**

  H. Thompson等人，“XML模式第1部分: 结构”，2001年5月。

- **[XML架构，第2部分]**

  P. Biron等人，“XML模式第2部分: 数据类型”，2001年5月。

- [肥皂1.2]

  先生。Gudgin等,"SOAP版本1.2 Part 1: Messaging Framework" June 2003.

- **[WSDL 1.1]**

  E.Christensen, et al, "Web服务描述语言 (WSDL) 1.1," March 2001。

- **[WS-Security]**

  OASIS,“Web服务安全: SOAP消息安全”,2004年3月。

- **[WS-SecurityPolicy]**

  G.Della-Libera等,"Web服务安全政策语言 (WS-SecurityPolicy)," December 2002.

- **[WS-Trust]**

  S.Anderson等,"Web服务信托语言 (WS-Trust)," 2004年5月.

- [WS-Policy]

  D.Box, et al, "Web服务政策框架 (WS-Policy)," May 2003。

