# Gradle.Properties 文件配置记录

 ```properties

# 配置文档
# https://docs.gradle.org/current/userguide/build_environment.html
# jvm 参数
org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
# 多线程并行
org.gradle.parallel=true
# 是否开启守护线程，默认是开启的
#org.gradle.daemon=true

# 配置用户目录，但貌似不生效，这里先记录下
#-DGRADLE_HOME=${GRADLE_USER_HOME}
systemProp.gradle.user.home=.gradle/build_user


# 是否使用缓存构建
org.gradle.caching=(true,false)

# 当设置为true时，将在控制台上记录每个任务的单个输入属性哈希和生成缓存键。
# 说实话没太看懂
org.gradle.caching.debug=(true,false)

# 控制台日志打印等级，调试时候比较有用
org.gradle.console=(auto,plain,rich,verbose)

# 任务失败时继续执行其他任务
# 感觉不是很有用
org.gradle.continue=(true,false)

# 守护进程在空闲若干毫秒后，自动停止，默认 10800000 (3 hours).
org.gradle.daemon.idletimeout=(# of idle millis)

# 这个就比较有用了
# 是否开启Debug模式
# 默认情况下，开启5005端口，挂起，等带Debug调试器介入后继续执行
# -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005
org.gradle.debug=(true,false)



# 启用项目隔离，从而启动缓存配置，
# 这个看着挺牛逼
org.gradle.unsafe.isolated-projects=(true,false)

 ```

