# CMake 学习记录

# 参考文档

 - [Cmake官网](https://cmake.org/)
 - [Cmake命令 api 文档 ](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html)
 - [全网最细的CMake教程！(强烈建议收藏)](https://zhuanlan.zhihu.com/p/534439206)
 - [CMake讲解](https://zhuanlan.zhihu.com/p/661282356)
 - [CmakeLists 配置](https://zhuanlan.zhihu.com/p/600740585?utm_id=0)
 - [Linux程序源码编译安装的configure配置详解](https://blog.csdn.net/duzhui2270/article/details/112246672)
 - [Makefile概念入门](https://zhuanlan.zhihu.com/p/29910215)
 - [W3CSchool  C++ 基本语法](https://www.w3cschool.cn/cpp/cpp-basic-syntax.html)
 - [cmake导入外部链接库](https://blog.csdn.net/jijun0817/article/details/40395273)





# 常用配置记录

```cmake
# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.26)
# 项目名称，后面可以通过环境变量 ${PROJECT_NAME} 获取
project(《项目名称》)
# C++ 最低支持得C++版本
set(CMAKE_CXX_STANDARD 17)


# 添加源代码文件
add_executable(${PROJECT_NAME} main.cpp)
```



# 添加依赖

> **下载外部库后**：得到.a或者.so文件（这都是linux环境下的，windows下应该是.lib文件）



## 动态库(.so)

> ​		.so文件是动态库，在编译的时候不会将动态库的代码嵌入到程序中，而是在运行时进行动态链接，这样可以减小程序的体积，但是需要保证动态库在运行时能够被找到并正确链接。
>
> 动态库的一般名称是libxxx.so



## 静态库(.a、.lib)

> ​		.a文件是静态库，在编译的时候会将静态库的代码直接嵌入到程序中，这样可以避免在运行时出现动态链接的问题，但是会增加程序的体积。
>
> 静态库的名称一般是libxxx.a
>
> .lib文件是Windows平台下的静态链接库文件



## 三方库添加方式

> 从github下载外部库后，里面应该会有include文件夹和lib文件夹。include文件夹中存放头文件，以.h结尾，里面是我们需要调用的API接口；lib文件夹存放链接库，一般是编译后的文件，以.a或.so结尾。
>
> **include_directories**用来指定编译器搜索头文件的路径。当你在代码中使用#include <header.h>的方式来包含头文件时，编译器会在include_directories指定的路径中查找头文件。也就是说，当我们将其设置为我们下载库的include文件夹后，在我们的项目中我们可以直接以头文件的名字include外部库的头文件，不需要以路径的形式引入了。
>
> **link_directories**用来指定编译器搜索库文件的路径。当你在代码中使用target_link_libraries()来链接库文件时，编译器会在link_directories指定的路径中查找库文件。也就是说，当我们将其设置为我们下载库的lib文件夹后，链接时就会在指定外部库的lib文件中寻找对于的.a静态库或者.so动态库。

```cmake
# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.26)
# 项目名称，后面可以通过环境变量 ${PROJECT_NAME} 获取
project(《项目名称》)
# C++ 最低支持得C++版本
set(CMAKE_CXX_STANDARD 17)


## 外部库的头文件
set(ZLIB_INCLUDE {{ include 目录，主要指 .h 文件所在目录 }})
## 外部库的lib文件（静态编译）
set(ZLIB_LIBRARIES {{ 动态库(.so)或者静态库(.a) 所在目录 }})

# 链接外部库
include_directories(${ZLIB_INCLUDE})
link_directories(${ZLIB_LIBRARIES})


# 添加源代码文件
# add_executable语句必须要在target_link_libraries语句的前面。
add_executable(${PROJECT_NAME} main.cpp)

#将第三方库链接在一起
target_link_libraries (${PROJECT_NAME} libxed.a ...)

```



## 导入线程库

```cmake
...

# 加载线程库
find_package (Threads)

#将第三方库链接在一起
target_link_libraries (${PROJECT_NAME} libxed.a Threads::Threads)
```





# 多个源文件

## 同一目录，多个源文件

 `aux_source_directory` 命令，该命令会查找指定目录下的所有源文件，然后将结果存进指定变量名。其语法如下：

```cmake
aux_source_directory(<dir> <variable>)
```

```cmake
# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.26)
# 项目名称，后面可以通过环境变量 ${PROJECT_NAME} 获取
project(《项目名称》)
# C++ 最低支持得C++版本
set(CMAKE_CXX_STANDARD 17)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 指定生成目标
add_executable(Demo ${DIR_SRCS})
```





## 多个目录，多个源文件



```cmake
# CMake 最低版本号要求
cmake_minimum_required(VERSION 3.26)
# 项目名称，后面可以通过环境变量 ${PROJECT_NAME} 获取
project(《项目名称》)
# C++ 最低支持得C++版本
set(CMAKE_CXX_STANDARD 17)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 添加 math 子目录 即根目录下的目录名称
add_subdirectory(math)

# 指定生成目标 加入主要类
add_executable(Demo main.cc)

# 添加链接库
target_link_libraries(Demo MathFunctions)
```

