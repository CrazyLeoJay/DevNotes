# 初始化构建项目

## 环境

- Nodejs环境安装



## 开始

### 创建项目

```shell
$npx create-next-app@latest my-ssr-app
# 或者
$yarn create next-app my-ssr-app
```

### 命令选项

| 名称                                   | 建议 | 描述                                                         |
| -------------------------------------- | ---- | ------------------------------------------------------------ |
| TypeScript                             | yes  |                                                              |
| ESLint                                 | yes  |                                                              |
| [TailWind_CSS](initext\TailWindCss.md) | yes  | CSS 框架，用于简化开发                                       |
| code inside a src/                     | yes  | 将代码放入src目录下                                          |
| [AppRouter](initext\AppRouter.md)      |      |                                                              |
| [Turbopack](initext\Turbopack.md)      | yes  | **Turbopack** 是由 Vercel 公司（Next.js 的母公司）开发的一款基于 Rust 的**增量式 JavaScript/TypeScript 打包工具**，旨在替代 Webpack，解决大型项目构建速度慢的问题。它专为现代前端框架（如 Next.js）优化，目标是成为**最快的打包工具**，尤其在开发模式下的热更新（HMR）性能表现突出。<br />作为 Next.js 13+ 的默认开发服务器（通过 `next dev --turbo` 启用）。 |
| [import_alias](initext\importAlias.md) | no   | 是否自定义别名，这里一般选择no。默认使用 @/* 方式去引用库    |



### 项目结构

生成的主要目录结构：

```
├── pages/          # 页面目录（自动路由）
├── public/         # 静态资源
├── styles/         # 全局样式
├── next.config.js  # Next.js 配置
└── package.json
```

如果使用了AppRouter，则目录发生变化

> 在 Next.js 13+ 中使用 App Router（基于 `src/app` 目录）时，SSR（服务端渲染）的实现方式与传统 Pages Router 不同。

```
src/app/
├── (ssr-example)/       # 可选路由分组
│   └── page.tsx         # 页面组件
└── layout.tsx           # 布局文件
```





### 创建SSR

若不使用AppRouter

```tsx
// 服务端渲染的页面
export default function SSRPage({ serverTime }) {
  return (
    <div>
      <h1>SSR 示例页面</h1>
      <p>服务器时间: {serverTime}</p>
    </div>
  )
}

// 服务端数据获取
export async function getServerSideProps() {
  // 这里执行服务端逻辑（如API调用、数据库查询等）
  const serverTime = new Date().toISOString()
  
  return {
    props: { serverTime }, // 传递给页面的 props
  }
}
```

使用AppRouter

```tsx
// src/app/ssr/page.tsx
import ClientInteractiveComponent from "@/app/components/ClientInteractiveComponent";

export default async function SSRPage() {
    // 直接使用 async 获取数据（服务端执行）
    // const data = await fetchData();

    const time = await nowData();
  
    return (
      <div>
        <h1>SSR 页面示例</h1>
        {/* <p>服务端获取的数据: {data}</p> */}
        <p>获取当前时间: {time}</p>
        <ClientInteractiveComponent /> {/* 需要交互性的客户端组件 */}
      </div>
    )
  }
 

  async function nowData(){
    const serverTime = new Date().toISOString()
    return serverTime; 
  }
}
```

添加

```tsx
// src/app/components/ClientInteractiveComponent.tsx
'use client'; // 必须标记为客户端组件

import { useState } from 'react';

export default function ClientInteractiveComponent() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <button onClick={() => setCount(count + 1)}>
        点击次数: {count}
      </button>
    </div>
  )
}
```





### 运行项目

```sh
$npm run dev 
# 或者
$yarn dev
```







### 核心概念说明

#### SSR 实现方式：

- **`getServerSideProps`**：在每次请求时运行，返回数据作为页面 props
- **`getStaticProps`**（静态生成）：在构建时生成 HTML（SSG）
- **`getStaticPaths`**（动态路由静态生成）



### 部署生产环境

1. 构建项目：

```shell
$npm run build
# 或
$yarn build
```

1. 启动生产服务器：

```shell
$npm start
# 或
$yarn start
```

1. 推荐部署平台：

- [Vercel](https://vercel.com/)（Next.js 官方平台）
- Netlify
- AWS/GCP 等云服务

###  扩展功能

1. **自定义服务器**：通过 `server.js` 自定义 Express/Koa 服务
2. **API 路由**：在 `pages/api/` 目录下创建后端 API
3. **样式方案**：支持 CSS Modules、Styled-components、Tailwind CSS 等
4. **状态管理**：可集成 Redux、Zustand 等状态库



### 常用命令

| 命令            | 说明                    |
| :-------------- | :---------------------- |
| `npm run dev`   | 启动开发服务器 (热更新) |
| `npm run build` | 构建生产版本            |
| `npm start`     | 启动生产服务器          |
| `npm run lint`  | 运行代码检查            |

### 学习资源

- 官方文档: [nextjs.org/docs](https://nextjs.org/docs)
- 示例项目: [github.com/vercel/next.js/examples](https://github.com/vercel/next.js/tree/canary/examples)
- 社区资源: [Next.js Learn](https://nextjs.org/learn)