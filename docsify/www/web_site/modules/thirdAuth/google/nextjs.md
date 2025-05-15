# React NextJs SSR 接入

由于nextjsSSR需要区分客户端和服务端，所以接入时不能用官方的方式直接填入。

这里使用开源项目 **`@react-oauth/google`** 

## 预处理

需要先官网配置。



## 库 **`@react-oauth/google`** 

- [github](https://github.com/MomenSherif/react-oauth)
- [npm package：React OAuth2 | Google](https://www.npmjs.com/package/@react-oauth/google)

- [Github react-oauth README 原文](react-oauth-readme.md) 



## 接入代码

> OneTap 登录是指直接一键登录

### 在 React 组件中使用在页面中调用

```tsx
// src/app/page.tsx
'use client'
import { GoogleLogin, GoogleOAuthProvider } from "@react-oauth/google"

export default function Page() {
    const token = "google cloud auth ClientId"
    return (
        <div>
            <GoogleOAuthProvider clientId={token} >
                <GoogleLogin
                    onSuccess={(credentialResponse) => {
                        console.log('登录成功:', credentialResponse);
                    }}
                    onError={() => {
                        console.error('登录失败');
                    }}
                    useOneTap
                    width="300"
                    use_fedcm_for_button
                    use_fedcm_for_prompt
                />
            </GoogleOAuthProvider>
        </div >
    )
}

```



### GoogleLogin

| Required | Prop                               | Type                                                         | Description                                                  |
| :------: | ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
|    ✓     | onSuccess                          | `(response: CredentialResponse) => void`                     | 成功登录后使用凭据响应触发回调                               |
|          | onError                            | `function`                                                   | 登录失败后触发回调                                           |
|          | type                               | `standard` \| `icon`                                         | Button type [type](https://developers.google.com/identity/gsi/web/reference/js-reference#type) |
|          | theme                              | `outline` \| `filled_blue` \| `filled_black`                 | Button [theme](https://developers.google.com/identity/gsi/web/reference/js-reference#theme) |
|          | size                               | `large` \| `medium` \| `small`                               | Button [size](https://developers.google.com/identity/gsi/web/reference/js-reference#size) |
|          | text                               | `signin_with` \| `signup_with` \| `continue_with` \| `signin` | Button [text](https://developers.google.com/identity/gsi/web/reference/js-reference#text). For example, "Sign in with Google", "Sign up with Google" or "Sign in" |
|          | shape                              | `rectangular` \| `pill` \| `circle` \| `square`              | Button [shape](https://developers.google.com/identity/gsi/web/reference/js-reference#shape) |
|          | logo_alignment                     | `left` \| `center`                                           | Google [logo alignment](https://developers.google.com/identity/gsi/web/reference/js-reference#logo_alignment) |
|          | width                              | `string`                                                     | button [width](https://developers.google.com/identity/gsi/web/reference/js-reference#width), in pixels |
|          | locale                             | `string`                                                     | If set, then the button [language](https://developers.google.com/identity/gsi/web/reference/js-reference#locale) is rendered |
|          | useOneTap                          | `boolean`                                                    | Activate One-tap sign-up or not                              |
|          | promptMomentNotification           | `(notification: PromptMomentNotification) => void`           | [PromptMomentNotification](https://developers.google.com/identity/gsi/web/reference/js-reference) methods and description |
|          | cancel_on_tap_outside              | `boolean`                                                    | Controls whether to cancel the prompt if the user clicks outside of the prompt |
|          | auto_select                        | `boolean`                                                    | Enables automatic selection on Google One Tap                |
|          | ux_mode                            | `popup` \| `redirect`                                        | The Sign In With Google button UX flow                       |
|          | login_uri                          | `string`                                                     | The URL of your login endpoint                               |
|          | native_login_uri                   | `string`                                                     | The URL of your password credential handler endpoint         |
|          | native_callback                    | `(response: { id: string; password: string }) => void`       | The JavaScript password credential handler function name     |
|          | prompt_parent_id                   | `string`                                                     | The DOM ID of the One Tap prompt container element           |
|          | nonce                              | `string`                                                     | A random string for ID tokens                                |
|          | context                            | `signin` \| `signup` \| `use`                                | The title and words in the One Tap prompt                    |
|          | state_cookie_domain                | `string`                                                     | If you need to call One Tap in the parent domain and its subdomains, pass the parent domain to this attribute so that a single shared cookie is used |
|          | allowed_parent_origin              | `string` \| `string[]`                                       | The origins that are allowed to embed the intermediate iframe. One Tap will run in the intermediate iframe mode if this attribute presents |
|          | intermediate_iframe_close_callback | `function`                                                   | Overrides the default intermediate iframe behavior when users manually close One Tap |
|          | itp_support                        | `boolean`                                                    | Enables upgraded One Tap UX on ITP browsers                  |
|          | hosted_domain                      | `string`                                                     | If your application knows the Workspace domain the user belongs to, use this to provide a hint to Google. For more information, see the [hd](https://developers.google.com/identity/protocols/oauth2/openid-connect#authenticationuriparameters) field in the OpenID Connect docs |
|          | use_fedcm_for_prompt               | `boolean`                                                    | Allow the browser to control user sign-in prompts and mediate the sign-in flow between your website and Google. |
|          | use_fedcm_for_button               | `boolean`                                                    | Enable FedCM Button flow.                                    |



