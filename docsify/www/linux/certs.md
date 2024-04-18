# 自签证书创建和安装



## 自签名脚本

```shell
#!/bin/bash
# author: liuning 
# create self-signed server certificate:

# 算法编程API OpenSSL介绍   https://zhuanlan.zhihu.com/p/635297515
# OpenSSL 自签证书详解      https://zhuanlan.zhihu.com/p/449630806
# 
# 这个详细讲解了证书链和验证
# 原文链接：https://blog.csdn.net/baidu_34881991/article/details/129888830

# read -p "Enter your IP [eg:192.168.0.1]: " IP
# read -p "Enter your domain [eg:liuning.fit2cloud.com]: " DOMAIN
# read -p "Enter your country [eg:CN 注:控制在2个字符以内]: " COUNTRY
# read -p "Enter your province [eg:shandong]: " PROVINCE
# read -p "Enter your city [eg:jinan]: " CITY
# read -p "Enter your company [eg:fit2cloud]: " COMPANY
# read -p "Enter your ORG [eg:shouqian]: " ORG

SSL_NAME="Leojay-CA"
EMAIL="crazyleojay@163.com"

IP="10.3.3.10"
DOMAIN="leojay.site"
COUNTRY="CN"
PROVINCE="zhejiang"
CITY="hangzhou"
COMPANY="leojay.site"
ORG="leojay.site"

# 程序配置
SSL_CONF="ext/openssl.cnf"
PWD_PATH=$(pwd)
days=36500
SUB_J="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=$COMPANY/OU=$ORG/CN=$DOMAIN"
PASS="pass:leojay"


rm -rf certs crl csr newcerts private install ext

mkdir certs crl csr newcerts private ext
echo 1000 > crlnumber && echo 1000 > serial && touch index.txt

# 创建openssl配置文件 openssl.cnf
# 基础配置文件
echo "[ ca ]"                                                                                           > $SSL_CONF
echo "default_ca = myca"                                                                                >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ myca ]"                                                                                         >> $SSL_CONF
echo "dir           = $PWD_PATH"                                                                        >> $SSL_CONF
echo "certificate   = \$dir/cacert.pem"                                                                 >> $SSL_CONF
echo "database      = \$dir/index.txt"                                                                  >> $SSL_CONF
echo "new_certs_dir = \$dir/certs"                                                                      >> $SSL_CONF
echo "private_key   = \$dir/private/cakey.pem"                                                          >> $SSL_CONF
echo "serial        = \$dir/serial"                                                                     >> $SSL_CONF
echo "crlnumber     = \$dir/crlnumber"                                                                  >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "default_crl_days  = $days"                                                                        >> $SSL_CONF
echo "default_days      = $days"                                                                        >> $SSL_CONF
echo "default_md        = sha256"                                                                       >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "policy            = myca_policy"                                                                  >> $SSL_CONF
echo "x509_extensions   = certificate_extensions"                                                       >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ myca_policy ]"                                                                                  >> $SSL_CONF
echo "commonName                = $SSL_NAME"                                                            >> $SSL_CONF
echo "stateOrProvinceName       = $PROVINCE"                                                            >> $SSL_CONF
echo "countryName               = $COUNTRY"                                                             >> $SSL_CONF
echo "emailAddress              = $EMAIL"                                                               >> $SSL_CONF
echo "organizationName          = $ORG"                                                                 >> $SSL_CONF
# echo "organizationalUnitName    = optional"                                                             >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ certificate_extensions ]"                                                                       >> $SSL_CONF
echo "basicConstraints = CA:false"                                                                      >> $SSL_CONF

# 添加根证书配置
echo ""                                                                                                 >> $SSL_CONF
echo "[ req ]"                                                                                          >> $SSL_CONF
echo "default_bits          = 4096"                                                                     >> $SSL_CONF
echo "default_keyfile       = $PWD_PATH/private/cakey.pem"                                              >> $SSL_CONF
echo "default_md            = sha256"                                                                   >> $SSL_CONF
echo "prompt                = no"                                                                       >> $SSL_CONF
echo "distinguished_name    = root_ca_distinguished_name"                                               >> $SSL_CONF
echo "input_password        = $PASS"                                                                    >> $SSL_CONF
echo "output_password       = $PASS"                                                                    >> $SSL_CONF
echo "x509_extensions       = root_ca_extensions"                                                       >> $SSL_CONF
# echo "req_extensions        = SAN"                                                                      >> $SSL_CONF
# echo "extensions            = SAN"                                                                      >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ root_ca_distinguished_name ]"                                                                   >> $SSL_CONF
echo "commonName            = $SSL_NAME"                                                                >> $SSL_CONF    # 证书名称
echo "countryName           = $COUNTRY"                                                                 >> $SSL_CONF     # 国家代码
echo "stateOrProvinceName   = $PROVINCE"                                                                >> $SSL_CONF    # 州或者代码
echo "localcityName         = $CITY"                                                                    >> $SSL_CONF
echo "emailAddress          = $EMAIL"                                                                   >> $SSL_CONF       # 邮箱
echo "organizationName      = $ORG"                                                                     >> $SSL_CONF         # 组织名称
echo ""                                                                                                 >> $SSL_CONF
echo "[SAN]"                                                                                            >> $SSL_CONF
echo "authorityKeyIdentifier=keyid:always,issuer"                                                       >> $SSL_CONF
echo "basicConstraints      = critical,CA:true"                                                         >> $SSL_CONF
echo "keyUsage              = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment"      >> $SSL_CONF
echo "subjectAltName        = @alt_names"                                                               >> $SSL_CONF
echo "subjectKeyIdentifier  = hash"                                                                     >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ v3_ca ]"                                                                                        >> $SSL_CONF                
echo "subjectKeyIdentifier      =hash"                                                                  >> $SSL_CONF                                      
echo "authorityKeyIdentifier    =keyid:always,issuer"                                                   >> $SSL_CONF                                                    
echo "basicConstraints          = critical,CA:true"                                                     >> $SSL_CONF                                                                                                                                
echo ""                                                                                                 >> $SSL_CONF
echo "[ v3_server ]"                                                                                    >> $SSL_CONF
echo "basicConstraints          = CA:FALSE"                                                             >> $SSL_CONF
echo "keyUsage                  = nonRepudiation, digitalSignature, keyEncipherment"                    >> $SSL_CONF
echo "subjectAltName            = @alt_names"                                                           >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[alt_names]"                                                                                      >> $SSL_CONF
echo "DNS.1 = *.leojay.site"                                                                            >> $SSL_CONF
echo "DNS.2 = leojay.synology.me"                                                                       >> $SSL_CONF
echo "IP.1  = $IP"                                                                                      >> $SSL_CONF
echo ""                                                                                                 >> $SSL_CONF
echo "[ root_ca_extensions ]"                                                                           >> $SSL_CONF
echo "basicConstraints = CA:true"                                                                       >> $SSL_CONF


echo "开始生成根证书"
# SUB_J="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=$COMPANY/OU=$ORG/CN=$DOMAIN"
SUB_J_ROOT="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=Leojay-Group/OU=Leojay-Group/CN=root.$DOMAIN"

# 生成CA根证书私钥：为保证安全，生成一个4096位的私钥，
openssl genrsa -aes256 -passout $PASS -out private/rootca.key 4096  

# 生成自签名的CA根证书
openssl req -config $SSL_CONF -new -x509 -days $days -sha256 -extensions v3_ca -key private/rootca.key -passin $PASS -out certs/rootca.cer -subj $SUB_J_ROOT


# 查看证书内容, 以确保证书生成正确
openssl x509 -noout -text -in certs/rootca.cer



echo ""
echo "开始生成中间代理证书  intermediateca"
# SUB_J_INTER="/C=CN/L=shanghai/O=kubesre/OU=ACS/CN=Pty Intermediateca CA"
SUB_J_INTER="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=Leojay-Group-middle/OU=Leojay-Group-middle/CN=Pty-Intermediateca-$DOMAIN-CA"

MIDDLE_EXT="ext/ca_intermediate.ext"
echo "[ v3_intermediate_ca ]"                                                                           > $MIDDLE_EXT                        
echo "subjectKeyIdentifier      = hash"                                                                 >> $MIDDLE_EXT                                     
echo "authorityKeyIdentifier    = keyid:always,issuer"                                                  >> $MIDDLE_EXT                                                   
echo "basicConstraints          = critical, CA:true, pathlen:0"                                         >> $MIDDLE_EXT                                                             
echo "keyUsage                  = critical, digitalSignature, cRLSign, keyCertSign"                     >> $MIDDLE_EXT  

# 制作代理CA证书(中间CA)
# 在生成代理CA证书私钥: 同样适用4096位, 不加密了
openssl genrsa -out private/intermediateca.key 4096   
# 在生成签发请求
openssl req -new -key private/intermediateca.key -out csr/intermediateca.csr -subj $SUB_J_INTER
# 用CA根证书签发该代理CA证书请求
openssl x509 -req -extfile $MIDDLE_EXT -extensions v3_intermediate_ca -days $days -sha256 -CA certs/rootca.cer -CAkey private/rootca.key -passin $PASS -CAcreateserial -CAserial serial -in csr/intermediateca.csr -out certs/intermediateca.cer 

# 查看代理CA证书内容, 以确保证书生成正确
# 需要找到以下内容（CA:TRUE）
# X509v3 Basic Constraints: critical
#                CA:TRUE, pathlen:0
openssl x509 -noout -text -in certs/intermediateca.cer

# echo "验证证书是否通过"
# 用根证书校验代理CA证书, 确认是否通过
openssl verify -CAfile certs/rootca.cer certs/intermediateca.cer  

# 合并证书链, 在校验代理CA签发的证书时需要使用证书链验证
cat certs/intermediateca.cer certs/rootca.cer > certs/intermediateca-chain.cer


# 创建服务端证书
# 创建基于域名的文件夹， 暂且放在newcerts目录下吧
# 重点：使用中间证书生成服务端证书
CERT_OUT_DIR=newcerts/$DOMAIN
# SUB_J_2="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=$COMPANY/OU=$ORG/CN=$DOMAIN"
SUB_J_2="/C=$COUNTRY/ST=$PROVINCE/L=$CITY/O=$COMPANY/OU=$ORG/CN=*.$DOMAIN"

# 生成服务端配置文件 server.ext

SERVER_EXT="ext/server.ext"

echo "[ v3_server ]"                                                                                    > $SERVER_EXT
echo "basicConstraints          = CA:FALSE"                                                             >> $SERVER_EXT
echo "keyUsage                  = nonRepudiation, digitalSignature, keyEncipherment"                    >> $SERVER_EXT
echo "subjectAltName            = @alt_names"                                                           >> $SERVER_EXT
echo ""                                                                                                 >> $SERVER_EXT
echo "[alt_names]"                                                                                      >> $SERVER_EXT
echo "DNS.1 = *.leojay.site"                                                                            >> $SERVER_EXT
echo "DNS.2 = leojay.synology.me"                                                                       >> $SERVER_EXT
echo "IP.1  = $IP"                                                                                      >> $SERVER_EXT
echo ""                                                                                                 >> $SERVER_EXT



echo "开始生成服务端证书"
mkdir $CERT_OUT_DIR
# 生成服务端证书私钥: 期限相对较短, 所以用2048位足以
openssl genrsa -out $CERT_OUT_DIR/server.key 2048
# 生成签发请求
openssl req -new -key $CERT_OUT_DIR/server.key -out $CERT_OUT_DIR/server.csr -subj $SUB_J_2
# 用CA证书签发证书
openssl x509 -req -extfile $SERVER_EXT -extensions v3_server -days $days -sha256 -CA certs/intermediateca.cer -CAkey private/intermediateca.key -passin $PASS -CAserial serial -in $CERT_OUT_DIR/server.csr -out $CERT_OUT_DIR/server.cer

# 查看生成的证书内容
# openssl x509 -noout -text -in $CERT_OUT_DIR/server.cer

echo "验证服务器证书是否正确："
# 使用 根证书链校验生成的服务端证书的正确性 (这个无法验证成功，必须使用复合型)
# echo "使用中间证书验证"
# openssl verify -CAfile certs/intermediateca.cer $CERT_OUT_DIR/server.cer
echo "使用中间-root复合证书验证"
openssl verify -CAfile certs/intermediateca-chain.cer $CERT_OUT_DIR/server.cer

# 将root.crt导入windows可信根证书区域，middle.crt导入可信中间证书区域，即可验证server.crt有效性


# 继续合并证书链, 当然你也可以选择不合并
# 在服务端配置server端的证书时使用改证书链, 可以避免浏览器提示 `Windows没有足够信息, 不能验证该证书`
# 但即便获取到完整的证书链, 依然会提示 `无法将这个证书验证到一个受信任的证书颁发机构`
cat $CERT_OUT_DIR/server.cer certs/intermediateca-chain.cer > $CERT_OUT_DIR/server-chain.cer

# 尝试生成一个客户端证书安装器，也就是说代码只要使用中间证书，就可以验证
openssl pkcs12 -export -clcerts -in certs/intermediateca-chain.cer -inkey private/intermediateca.key -out $CERT_OUT_DIR/win-install.p12 -passout $PASS


# Nginx 配置
# server {
#     listen 443 ssl;
#     server_name www.kubesre.com;
#     charset utf-8;
# 
#     ssl_certificate     /root/ssl/newcerts/www.kubesre.com/server.cer;   # 服务端证书
#     ssl_certificate_key /root/ssl/newcerts/www.kubesre.com/server.key;    # 服务端私钥
#     ssl_session_timeout 5m;
#     ssl_ciphers ECDHE-RSA-CNS128-GCM-SHA256:ECDHE:ECDH:CNS:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
#     ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
#     ssl_prefer_server_ciphers on;
#     ssl_verify_client on;
#     ssl_client_certificate /root/ssl/certs/rootca.cer;     # CA根证书
#     ssl_verify_depth 2;
# 
# 
#    location / {
# 
#   }
# }
# 
```



## JVM 证书安装

```shell
keytool -importcert -alias 证书别名 -keystore "证书库路径" -storepass changeit -file 刚下载的证书地址

keytool -import -alias your_alias_name -keystore $JAVA_HOME/lib/security/cacerts  -file  your_cer_file

# 不建议使用环境变量，不容易识别，再powerShell中，再CMD中可以使用%JAVA_HOME%
keytool -import -alias leojay-maven-cer -keystore "C:\Program Files\Java\jdk-17.0.2\lib\security\cacerts"  -file "C:\Users\Leojay\Desktop\CA-maven.leojay.site.crt"

# 或者直接从keytool就指定路径，可以给各个版本的jvm设置证书

# 修改jvm证书文件密码（暂不需要）
C:\Program Files\Java\jdk-18.0.2\lib\security\keytool -storepasswd -v -new shanii_one -keystore cacerts

keytool -storepasswd -v -new leojay -keystore "%JAVA_HOME%/lib/security/cacerts"
```

### 默认密码

> https://www.cnblogs.com/wupher/archive/2012/08/05/2623561.html

```
changeit
```

有人说OS X中java的 `Keystore`密码被更改成了：`changeme`。所以如果你用上面那个访问失败，可以试试这个。

### 修改密码

> **https://www.jiyik.com/tm/xwzj/prolan_7170.html**





## ubuntu 安装证书

```sh
$apt install ca-certificates -y

# 首先，复制pem格式的根证书，重命名为 .crt格式
# 然后，执行下边的命令
$sudo cp 证书路径.crt /usr/local/share/ca-certificates
$sudo update-ca-certificates

# update-ca-certificates命令将PEM格式的根证书内容附加到/etc/ssl/certs/ca-certificates.crt ，而/etc/ssl/certs/ca-certificates.crt 包含了系统自带的各种可信根证书.

# 删除证书：
$sudo rm -f /usr/local/share/ca-certificates/证书名称.crt
$sudo update-ca-certificates
```



## docker 证书配置

> 如果搭建docker register 使用自建证书，则需要在服务端和客户端都要配置

服务端：Ubuntu＋nexus3-docker

客户端：docker



### 服务端配置

- 首先服务器配置
- 然后Nexus3导入证书





### 客户端配置

[官文：Verify repository client with certificates](https://docs.docker.com/engine/security/certificates/#understand-the-configuration)

需要找到配置目录[Docker Daemon 配置](https://docs.docker.com/config/daemon/)，没有目录就创建一个

- linux：`/etc/docker/certs.d`
- win:  `C:\Users\{username}\.docker\certs.d` (未验证)
- mac：`~/.config/docker/certs.d` （未验证）

在目录　`certs.d`  下建立一个目录用来存放证书，这个目录的命名为 register服务器的域名全名，不支持通配符。

标准格式为：

```sh
 /etc/docker/certs.d/        <-- Certificate directory
    └── localhost:5000          <-- Hostname:port
       ├── client.cert          <-- Client certificate
       ├── client.key           <-- Client key
       └── ca.crt               <-- Root CA that signed
                                    the registry certificate, in PEM
```

假设仓库地址为`my-https.registry.example.com`，则：

```sh
/etc/docker/certs.d/
	└── my-https.registry.example.com          <-- Hostname without port
       ├── client.cert
       ├── client.key
       └── ca.crt
```

放入服务端证书和key，然后放入中间证书或者root证书。这里需要证书名字**必须为`crt`或者`cert`**















