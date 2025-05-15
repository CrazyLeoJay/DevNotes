# 使用 Google SDK-Web登录

官方文档

## 1、接入GoogleIdentityServices（GIS） 库

你需要接入的库是 **Google Identity Services (GIS)** 库。这是一个 JavaScript 库，用于在你的网站上集成 Google 登录功能，包括一键式登录（One Tap）和按钮登录（Sign In With Google Button）。

- **库的地址：**

  你不需要下载这个库，而是通过在你的 HTML 页面中添加一个 `<script>` 标签来直接引用它。以下是引用 GIS 库的地址：

```html
<script src="https://accounts.google.com/gsi/client" async defer></script>
```


  *   **`src="https://accounts.google.com/gsi/client":** 这是 GIS 库的 CDN 地址。
  *   **`async`:**  表示脚本将异步加载，不会阻塞页面的渲染。
  *   **`defer`:** 表示脚本将在 HTML 解析完成后执行。

## 2、在界面上生成按钮

> 如需显示“一键式登录”提示，请将以下代码段放置在您希望显示 Google 一键式登录的任何网页中：

```html
<div id="g_id_onload"
     data-client_id="YOUR_GOOGLE_CLIENT_ID"
     data-login_uri="https://your.domain/your_login_endpoint"
     data-your_own_param_1_to_login="any_value"
     data-your_own_param_2_to_login="any_value">
</div>
```

`data-login_uri` 属性是您自己的 Web 应用的登录端点的 URI。您可以添加自定义数据属性，这些属性会随从 Google 检索到的 ID 令牌一起发送到登录端点。

如需查看数据属性的完整列表，请参阅 [`g_id_onload` 参考文档](https://developers.google.com/identity/gsi/web/reference/html-reference?hl=zh-cn#element_with_id_g_id_onload)页面。

[代码生成器](https://developers.google.com/identity/gsi/web/tools/configurator?hl=zh-cn)开发者工具可帮助您以互动方式自定义 Google One Tap 并生成代码。



## 3、在服务端确定令牌是否正确

当用户通过 Google 登录你的网站后，Google 会向你的网站返回一个 **ID 令牌 (ID Token)**。这个 ID 令牌是一个 JSON Web Token (JWT)，它包含了关于已登录用户的各种信息，并且经过了 Google 的数字签名。

你的服务端需要做以下几步来验证用户身份：

*   **接收 ID 令牌：**  当用户成功登录后，GIS 库会通过你配置的回调函数将 ID 令牌传递给你的前端代码。你需要将这个 ID 令牌发送到你的服务端。
*   **验证 ID 令牌：**  你的服务端需要验证这个 ID 令牌的真实性和有效性。这通常包括以下几个步骤：
    *   **验证签名：**  使用 Google 提供的公钥来验证 ID 令牌的数字签名。这可以确保 ID 令牌是由 Google 签发的，而不是伪造的。
    *   **验证 `iss` (issuer) 声明：**  确保 `iss` 声明的值为 `[https://accounts.google.com`](https://accounts.google.com`) 或 `accounts.google.com`。这表示 ID 令牌是由 Google 签发的。
    *   **验证 `aud` (audience) 声明：**  确保 `aud` 声明的值与你的 Google Cloud 项目的客户端 ID (Client ID) 相匹配。这表示 ID 令牌是针对你的应用的。
    *   **验证 `exp` (expiration time) 声明：**  确保 ID 令牌尚未过期。
    *   **验证 `iat` (issued at) 声明：** 确保 ID 令牌是在合理的时间内签发的。
    *   **可选验证 `nonce` (number once) 声明：** 如果你在前端配置了 `nonce`，那么你需要在服务端验证 `nonce` 的值是否与你之前生成并发送到前端的值一致。这可以防止重放攻击。
*   **提取用户信息：**  如果 ID 令牌验证成功，你可以从 ID 令牌的 payload 中提取用户信息，例如用户的 Google ID、电子邮件地址、姓名、头像等。
*   **创建或查找用户：**  根据提取到的用户信息，你可以在你的数据库中创建新的用户记录，或者查找已有的用户记录。
*   **建立会话：**  在你的服务端建立一个会话，将用户标记为已登录状态。

## **3. 服务端验证 ID 令牌的常用方法：**

*   **使用 Google API 客户端库：**  Google 提供了各种语言的 API 客户端库，这些库通常包含了验证 ID 令牌的功能。例如，在 Python 中，你可以使用 `google-auth` 库。
*   **手动验证：**  你也可以手动验证 ID 令牌。这需要你下载 Google 的公钥，并使用 JWT 库来验证签名和声明。
*   **使用第三方 JWT 库：**  许多编程语言都有第三方 JWT 库，你可以使用这些库来验证 ID 令牌。

## **4. 总结：**

*   **前端：**  使用 `[https://accounts.google.com/gsi/client`](https://accounts.google.com/gsi/client`) 地址引入 Google Identity Services (GIS) 库。
*   **服务端：**  接收前端发送的 ID 令牌，并使用 Google API 客户端库、手动验证或第三方 JWT 库来验证 ID 令牌的真实性和有效性，然后提取用户信息并建立会话。





用户在设备或浏览器中登录 Google 后，在您的应用或网站上会获得快速身份验证。

回访用户会自动登录，也可以一键点击或一次点击登录。

您甚至可以选择让用户只需点按或点击一下即可创建新帐号。

[使用 Google 网页版登录（一键快捷功能）](https://developers.google.com/identity/gsi/web/guides/display-google-one-tap?hl=zh-cn)

[Android 版凭据管理器](https://developers.google.com/identity/android-credential-manager?hl=zh-cn)

[iOS 和 macOS 版 Google 登录功能](https://developers.google.com/identity/sign-in/ios/start?hl=zh-cn)

[支持请求研究](https://developers.google.com/identity/sign-in/case-studies?hl=zh-cn)

**Google Identity Services 即将迁移到 FedCM API。请按照[迁移指南](https://developers.google.com/identity/gsi/web/guides/fedcm-migration?hl=zh-cn)查看可能发生的更改，并避免对网站的登录产生负面影响。**



- [Google Identity OAuth 2.0](https://developers.google.com/identity/protocols/oauth2?hl=zh-cn)
- 



## 接入

> 这里建议使用 [FedCM 文档](https://developers.google.com/identity/gsi/web/guides/fedcm-migration?hl=zh-cn) 接入



#### 接入前检查

检查您的浏览器设置和版本是否[支持](https://developers.google.com/identity/gsi/web/guides/supported-browsers?hl=zh-cn) FedCM API，建议您更新到最新版本。

- FedCM API 适用于 Chrome 117 或更高版本。
- Chrome 中启用了[第三方登录](https://support.google.com/chrome/answer/14264742?hl=zh-cn)设置。此设置仅会影响一键式付款，不会影响 FedCM 按钮流程。
- 如果您的 Chrome 浏览器版本为 119 或更低版本，请打开 `chrome://flags` 并启用实验性 `FedCmWithoutThirdPartyCookies` 功能。如果使用的是 Chrome 浏览器 120 或更高版本，则无需执行此步骤。