# 网站搭建开发

>  这里记录搭建网站使用的技术栈和搭建方式





## 基本架构

### 前端

> 基本是基于`Node.js`



| 前端开发语言                                        | 部署                                                         |
| --------------------------------------------------- | ------------------------------------------------------------ |
| 原生Html+JavaScript+CSS                             | Apache service、Nginx                                        |
| [VUE](https://cn.vuejs.org/guide/introduction.html) | 静态：Apache、Niginx<br />服务类型：SSR、SSG<br />服务框架：[Vite](https://cn.vitejs.dev/guide/)、[Vite SSR](https://cn.vitejs.dev/guide/ssr.html)、 |
| [React](https://zh-hans.react.dev/)                 | 用于构建 Web 和原生交互界面的库                              |

> [Next.js](https://nextjs.frontendx.cn/): **Next.js** 是一个轻量级的 React 服务端渲染应用框架。
>
> 基本前端的开发语言都是基于Nextjs开发的





## 服务搭建

> 以下列举出服务提供商及文档

### AWS亚马逊

#### 文档记录

- [**什么是 Amazon EKS？**](https://docs.amazonaws.cn/eks/latest/userguide/what-is-eks.html)
- [计价器-全球](https://calculator.aws/#/addService)
  - [EKS](https://calculator.aws/#/createCalculator/EKS)
- [计价器-国内](https://calculator.amazonaws.cn/#/?nc2=h_ql_pr_calc)
  - [EKS](https://calculator.amazonaws.cn/#/createCalculator/EKS?nc2=h_ql_pr_calc)
- [EKS 服务界面](https://www.amazonaws.cn/eks/)
- 



## 多AZ部署

> 多AZ部署是指将应用或服务**跨多个可用区（Availability Zone，AZ）**进行部署，以提升系统的**高可用性、容灾能力**和**故障隔离性**。以下是其核心要点：

---

### **1. 什么是可用区（AZ）？**
- **定义**：可用区是云计算厂商在同一地理区域内（如北京、上海）建立的**独立物理数据中心**，每个AZ具备独立的电力、网络和冷却设施。
- **目的**：通过物理隔离降低单点故障风险，确保一个AZ故障时，其他AZ仍可正常运行。

---

### **2. 多AZ部署的核心目标**
- **高可用性（HA）**：避免单AZ故障导致服务中断，通过冗余设计实现故障自动转移。
- **容灾能力**：保障数据持久性（如跨AZ数据库备份）和业务连续性。
- **负载均衡**：将流量分摊到多个AZ，优化性能并减少延迟。

---

### **3. 典型应用场景**
- **无状态服务**（如Web服务器）：通过负载均衡将请求分发到不同AZ的实例。
- **有状态服务**（如数据库）：
  - **主从复制**：主库在一个AZ，从库在另一个AZ，故障时切换。
  - **多主架构**：多个AZ同时处理写入（需解决数据一致性）。
- **分布式存储**：数据跨AZ冗余存储（如AWS S3、阿里云OSS）。

---

### **4. 实现方式**
- **云服务商工具**：
  - AWS：多AZ RDS、EC2自动伸缩组跨AZ部署。
  - 阿里云：多可用区SLB、PolarDB多主集群。
  - 腾讯云：跨AZ CLB、CynosDB多可用区。
- **自建方案**：
  - 使用Kubernetes调度Pod到不同AZ。
  - 数据库中间件（如Vitess、TiDB）支持跨AZ部署。

---

### **5. 优势与挑战**
- **优势**：
  - **高可用性**：单AZ故障不影响全局服务。
  - **数据可靠性**：数据跨AZ备份，降低丢失风险。
  - **合规性**：满足某些行业对数据冗余的强制要求。
- **挑战**：
  - **成本增加**：跨AZ流量费用、冗余资源开销。
  - **网络延迟**：AZ间通信延迟高于AZ内（通常2~10ms）。
  - **数据一致性**：需权衡一致性协议（如RAFT）与性能。

---

### **6. 与跨区域（Multi-Region）部署的区别**
| **维度**     | **多AZ部署**             | **跨区域部署**                  |
| ------------ | ------------------------ | ------------------------------- |
| **范围**     | 同一区域内的不同可用区   | 不同地理区域（如北京 vs. 上海） |
| **延迟**     | 低（毫秒级）             | 高（几十到数百毫秒）            |
| **主要目标** | 高可用、容灾             | 低延迟、合规性、全球覆盖        |
| **成本**     | 较低（区域内流量费用低） | 较高（跨区域流量费用高）        |

---

### **7. 最佳实践**
- **关键业务**：强制多AZ部署（如支付系统）。
- **非关键业务**：按需选择单AZ以节省成本。
- **自动化故障转移**：结合健康检查与负载均衡实现无缝切换。
- **测试演练**：定期模拟AZ故障，验证容灾流程。

---

通过多AZ部署，企业能在云环境中构建健壮的基础设施，有效应对硬件故障、自然灾害等风险，平衡业务连续性与成本。



## 压力测试

> 常用的压力测试软件有：LoadRunner、Apache JMeter、NeoLoad、WebLOAD、Loadster、Load impact、CloudTest、Loadstorm、阿里云PTS等等，本文介绍的是使用Apache JMeter来进行压力测试。



