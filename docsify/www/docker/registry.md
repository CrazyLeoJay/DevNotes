# Docker Registry 搭建

[sonatype nexus3 Docker Registry 介绍](https://help.sonatype.com/en/docker-registry.html)

[Registry 官方搭建文档](https://distribution.github.io/distribution/about/deploying/)

请参阅[运行不安全的注册表](https://distribution.github.io/distribution/about/insecure/)。

- 在nexus3端创建 host 
- 设置中需要设置 Realms -> Docker bearer Token Realm 为 active

# 使用Nginx+Nexus3搭建

### 在nexus3中构建 docker hosted 仓库

- 由于使用另外的域名在Nginx中反向代理，所以不需要配置额外端口



### 在nginx中配置

> server host:port; 的 host:port 替换成Nexus3的地址和端口

```nginx
#  这个配置是在同时使用jenkins时使用
#
# 官方文档 https://help.sonatype.com/repomanager3/nexus-repository-administration/formats/docker-registry/docker-repository-reverse-proxy-strategies
#
# # https://maven.leojay.site/repository/docker-local/
upstream nexus3-registry {
    server host:port;
}

server {
    listen 443 ssl;
    server_name hub.leojay.site;

    # Docker /v2 and /v1 (for search) requests
    location /v2 {
        proxy_set_header Host $host:$server_port;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto "https";
        proxy_pass http://nexus3-registry/repository/docker-local/$request_uri;
    }
    location /v1 {
        proxy_set_header Host $host:$server_port;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto "https";
        proxy_pass http://nexus3-registry/repository/docker-local/$request_uri;
    }

    # Regular Nexus requests
    location / {
        proxy_set_header Host $host:$server_port;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto "https";
        proxy_pass http://nexus3-registry;
    }
}

```





# 使用Nginx+registry镜像搭建

### registry 部署

[Registry 部署](https://distribution.github.io/distribution/about/deploying/)

Docker compose Yml示例:

```yml
version: "3.9"

# https://distribution.github.io/distribution/about/deploying/
services:
  # 单独registgry节点
  registry:
    restart: always
    image: registry:2
    ports:
      - 5000:5000
    volumes:
      - /path/data:/var/lib/registry

  # registry 单独站点使用，配置证书和账号密码
  registry-self-site:
    restart: always
    image: registry:2
    ports:
      - 5000:5000
    environment:
      REGISTRY_HTTP_TLS_CERTIFICATE: /certs/domain.crt
      REGISTRY_HTTP_TLS_KEY: /certs/domain.key
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
    volumes:
      - /path/data:/var/lib/registry
      - /path/certs:/certs
      - /path/auth:/auth
```





## 使用Nginx做ssl和账号验证

生成账号密码文件：

```sh
$ docker run --rm --entrypoint htpasswd httpd -Bbn testuser testpassword > auth/nginx.htpasswd
```

配置。在server中：

```nginx
server {
    listen 443 ssl;
    ...
    location / {
    	...
        auth_basic "Registry realm";
        auth_basic_user_file /etc/nginx/conf.d/registry.htpasswd;
        ...
        
    }
}

```







# 拓展

## 离线使用

> 如果需要离线使用仓库，在制作镜像的服务器上，`/etc/docker/daemon.json`种配置以下内容，配置需要离线使用的Registry服务，docker会把相关的images都上传上去

```json
{
  "insecure-registries" : ["myregistrydomain.com:5000"]
}
```



# 访问证书问题

Nginx配置证书：

> 可以配置在 http下或者 server下

```nginx
ssl_certificate /cert/my-ca-middle/newcerts/leojay.site/server-chain.cer;
ssl_certificate_key /cert/my-ca-middle/newcerts/leojay.site/server.key;
ssl_protocols TLSv1.2 TLSv1.3 SSLv2 SSLv3 TLSv1 TLSv1.1 ; #就是这行配置造成的问题。
ssl_session_timeout 5m;
ssl_client_certificate /cert/my-ca-middle/certs/rootca.cer; # CA根证书
ssl_verify_depth 2;
```



在Docker服务中配置参考文档： [证书：docker 证书配置](..\linux\certs.md#docker 证书配置) 

并且服务器也需要配置证书

在cert.d 目录下修改证书，不需要重启docker





















