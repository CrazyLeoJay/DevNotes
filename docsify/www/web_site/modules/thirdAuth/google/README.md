# Google身份验证（三方登录）

> [主页](https://developers.google.com/identity?utm_medium=in-product&utm_source&utm_campaign=siwg%20website&hl=zh-cn)
>
> [sign-in-with-google](https://www.google.com/intl/zh-CN/account/about/sign-in-with-google/)





## Google Cloud 配置

- 登录 【[Google Cloud](https://console.cloud.google.com/)】
- 选中或者创建项目。（参考博客：[Google登录最新版本接入，保姆级对接流程](https://blog.csdn.net/qq_34111411/article/details/144879460) )
- 选择API和服务
- 选择OAuth权限请求
- 选择客户端  [Google Cloud 云后台 Auth 客户端](https://console.cloud.google.com/auth/clients)
- 创建或者选择客户端项目
- 需要在 "已获授权的 JavaScript 来源" 中填写以下内容，否则会有验证错误问题
  - http://localhost:3000 
  - http://localhost
  - 线上URL
- 可以在界面上获取到 客户端 ID



## 接入

### [Google Web 一键登录代码接入](js.md) 

- [【Google 一键登录 官方文档】](https://developers.google.com/identity/gsi/web/guides/display-google-one-tap?hl=zh-cn)
- [Html 代码生成器](https://developers.google.com/identity/gsi/web/tools/configurator?hl=zh-cn)
- **[Google要求 迁移到FedCM](https://developers.google.com/identity/gsi/web/guides/fedcm-migration?hl=zh-cn)**



###  [React NextJs项目中接入](nextjs.md) 

> 无法直接使用Google原生代码

- 需要使用开源库 [@react-oauth/google](https://github.com/MomenSherif/react-oauth)
- 注意需要开启 FedCM 登录