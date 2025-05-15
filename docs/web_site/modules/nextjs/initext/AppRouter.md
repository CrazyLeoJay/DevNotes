**(本回答由 AI 生成，内容仅供参考，请仔细甄别。)**

Next.js 的 **App Router**（应用路由）是 Next.js 13 版本引入的全新路由架构，旨在提供更灵活、高效的路由管理方式，同时支持 React 18 的最新特性（如 Server Components、流式渲染等）。以下是它的核心概念和用法详解：

---

### **App Router vs Pages Router**
| 特性         | App Router (v13+)                   | Pages Router (传统)                   |
| ------------ | ----------------------------------- | ------------------------------------- |
| **文件结构** | `/app` 目录                         | `/pages` 目录                         |
| **路由定义** | 文件夹路径即路由（支持嵌套路由）    | 文件路径即路由（如 `pages/about.js`） |
| **布局系统** | 支持嵌套布局（Layouts）             | 需手动通过高阶组件实现                |
| **数据获取** | 直接在组件中使用 `async/await`      | 依赖 `getServerSideProps` 等方法      |
| **渲染模式** | 默认服务端优先（Server Components） | 客户端优先                            |
| **动态路由** | 更灵活的 `[param]` 文件夹命名       | 通过文件名约定（如 `[id].js`）        |

---

### **App Router 核心功能**

#### 1. **基于文件系统的路由**
- 在项目根目录创建 `/app` 文件夹
- 子文件夹路径即路由路径（如 `/app/dashboard/settings/page.js` → `/dashboard/settings`）

#### 2. **布局系统 (Layouts)**
- 使用 `layout.js` 定义共享布局（自动嵌套）
- 支持根布局 (`/app/layout.js`) 和嵌套布局
```jsx
// /app/layout.js
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
```

#### 3. **服务端组件 (Server Components)**
- 默认所有组件为服务端组件（无需手动标记）
- 直接访问后端资源（数据库、API 密钥等）
- 在组件中使用 `async/await` 获取数据：
```jsx
// /app/page.js
export default async function Page() {
  const data = await fetch('https://api.example.com/data')
  return <div>{data}</div>
}
```

#### 4. **客户端组件 (Client Components)**
- 需要在文件顶部添加 `'use client'` 指令
- 用于交互性功能（如 `useState`, `useEffect`）
```jsx
// /app/components/Counter.js
'use client'
import { useState } from 'react'

export default function Counter() {
  const [count, setCount] = useState(0)
  return <button onClick={() => setCount(count + 1)}>点击 {count}</button>
}
```

#### 5. **流式渲染 (Streaming)**
- 使用 `<Suspense>` 实现部分内容优先加载
```jsx
import { Suspense } from 'react'

function Page() {
  return (
    <div>
      <Suspense fallback={<p>Loading...</p>}>
        <SlowComponent />
      </Suspense>
    </div>
  )
}
```

#### 6. **动态路由**
- 使用 `[param]` 文件夹命名（如 `/app/blog/[slug]/page.js`）
- 通过 `params` 属性获取参数：
```jsx
// /app/blog/[slug]/page.js
export default function Page({ params }) {
  return <div>当前文章: {params.slug}</div>
}
```

#### 7. **元数据 (Metadata)**
- 通过 `metadata` 对象或 `generateMetadata` 函数定义 SEO 信息
```jsx
// /app/page.js
export const metadata = {
  title: '首页',
  description: 'Next.js App Router 示例',
}

export default function Page() { ... }
```

---

### **如何启用 App Router？**
1. **新建项目**（推荐）：
   ```bash
   npx create-next-app@latest --experimental-app
   ```

2. **现有项目迁移**：
   - 创建 `/app` 目录
   - 在 `next.config.js` 中启用：
     ```js
     module.exports = {
       experimental: {
         appDir: true, // Next.js 13.4+ 后已稳定，无需此配置
       }
     }
     ```

---

### **最佳实践**
1. **混合路由模式**  
   - App Router 与 Pages Router 可以共存（但建议逐步迁移）

2. **数据获取策略**  
   - 优先在服务端组件获取数据
   - 使用 `fetch` 时默认自动缓存（可配置 `revalidate`）

3. **性能优化**  
   - 使用 `loading.js` 定义加载状态
   - 通过 `error.js` 处理错误边界

---

### **示例项目结构**
```
/app
├── layout.js           # 根布局
├── page.js             # 首页路由 (/)
├── dashboard
│   ├── layout.js      # 嵌套布局
│   ├── page.js        # /dashboard
│   └── settings
│       └── page.js    # /dashboard/settings
└── blog
    └── [slug]
        └── page.js    # 动态路由 /blog/xxx
```

---

### **学习资源**
- 官方文档: [Next.js App Router](https://nextjs.org/docs/app)
- 迁移指南: [从 Pages 迁移到 App](https://nextjs.org/docs/app/building-your-application/upgrading/app-router-migration)
- 示例模板: [Next.js App Router Examples](https://github.com/vercel/next.js/tree/canary/examples/app-dir)

---

App Router 代表了 Next.js 的未来发展方向，特别适合需要复杂路由、服务端优先渲染和现代 React 特性的项目。建议新项目直接使用 App Router 架构。