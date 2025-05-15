# Nodejs项目初始化





## 国内镜像配置





### 使用淘宝npm镜像（cnpm）

```bash
npm install -g cnpm --registry=https://registry.npmmirror.com
```

之后，你可以使用 `cnpm` 命令来代替 `npm` 命令进行包的安装和管理。



### 手动配置npm镜像

你也可以直接修改 npm 的配置，使其默认使用国内镜像源。以下是修改方法：

1. **临时使用**

   在使用 `npm install` 命令时，可以指定 `--registry` 参数：

   bash

   复制

   ```
   npm install --registry=https://registry.npmmirror.com
   ```

2. **永久修改**

   你可以使用以下命令将 registry 配置为国内源：

   bash

   复制

   ```
   npm config set registry https://registry.npmmirror.com
   ```

   这样配置后，npm 会默认使用你设置的源。

3. **通过配置文件修改**

   打开或创建 `~/.npmrc` 文件（Windows 用户在 `C:\Users\你的用户名\.npmrc`），然后添加以下内容：

   复制

   ```
   registry=https://registry.npmmirror.com
   ```

### 使用nrm管理镜像源

nrm（npm registry manager）是npm的镜像源管理工具，可以让你快速切换不同的npm源。

1. 安装 nrm：

   bash

   复制

   ```
   npm install -g nrm
   ```

2. 使用 nrm 添加国内镜像源：

   bash

   复制

   ```
   nrm add taobao https://registry.npmmirror.com
   ```

3. 使用 nrm 切换到淘宝源：

   bash

   复制

   ```
   nrm use taobao
   ```

4. 查看当前使用的源：

   bash

   复制

   ```
   nrm current
   ```

使用以上方法之一，你就可以配置 Node.js 使用国内的 npm 镜像源，从而提高包下载的速度。

