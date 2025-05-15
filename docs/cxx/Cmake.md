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
>
> 

库添加规则：

```cmake
# 这个方法设置库所在的目录，后面才能通过这个目录找到静态或者动态文件所在
link_directories()
# 通过 link_libraries 这个方法检索获取库文件
link_libraries()

# 这个方法需要放在 add_executable 或者 add_library 之后，这样可以给指定配置添加指定的库
target_link_libraries()
# 例如下面这个配置给一个 主exe配置添加 SDL2的库
add_executable(${PROJECT_NAME} main.cpp ...)
target_link_libraries(${PROJECT_NAME} SDL2)
```

例如导入ffmpeg:（假设已经设置了FFMPEG_HOME）

```cmake
include_directories("${FFMPEG_HOME}/include")
link_directories("${FFMPEG_HOME}/lib")
# 通过 set 可以讲多个目标集合成一个参数
set(LINK_LIBRARY swscale swresample avcodec avutil avdevice avfilter avformat)
# 所有库都需要添加 ffmpeg
link_libraries(${LINK_LIBRARY})
```





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



# cmake_parse_arguments

> function 或者 macro 多参数传入
>
> 参考：https://blog.csdn.net/fengbingchun/article/details/127154655

密令格式：

```cmake

cmake_parse_arguments(<prefix> <options> <one_value_keywords> <multi_value_keywords> <args>...)
 
# 只能在function下使用。表示从第N个数据开始解析
cmake_parse_arguments(PARSE_ARGV <N> <prefix> <options> <one_value_keywords> <multi_value_keywords>)

```



```cmake
macro(FUN_NAME)
    set(prefix FUNC1)
    set(options CSDN GITHUB)
    set(one_value_keywords DESTINATION)
    set(multi_value_keywords FILES RES)

    # ARGN:包含命名参数和可选参数的变量列表
    cmake_parse_arguments(${prefix} "${options}" "${one_value_keywords}" "${multi_value_keywords}" ${ARGN})
endmacro()

function(FUN_NAME)
    set(prefix FUNC1)
    set(options CSDN GITHUB)
    set(one_value_keywords DESTINATION)
    set(multi_value_keywords FILES RES)

    # ARGN:包含命名参数和可选参数的变量列表
    cmake_parse_arguments(${prefix} "${options}" "${one_value_keywords}" "${multi_value_keywords}" ${ARGN})
endfunction()

FUN_NAME(FILES test.cpp main.cpp DESTINATION /usr/lib CSDN config DEBUG)
```



可以获取到参数：

- FUNC1_CSDN、FUNC1_GITHUB： 这些值类似于布尔值，判断参数中是否有 CSDN 和 GITHUB 这些值存在，返回TRUE和FALSE
- FUNC1_DESTINATION：获取DESTINATION标记下的值，单仅获取一个值，其余值
- FUNC!1_FILES、FUNC!1_RES：获取 FILES 或者 RES 后的所有值



## Function 使用记录

### 函数cmake_parse_arguments

> 通过这个函数，可以使方法传入一些特定参数

```cmake
function(my_parse_arguments)
    # 定义参数的名称和选项
    set(options BUILD_TESTS)
    set(oneValueArgs LIBRARY_DIRS)
    set(multiValueArgs INCLUDE_DIRS)

    # 解析命令行参数
    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}"${ARGN})
    
    ...
endfunction()
```

参数解析

- ARGS：在所有参数的前缀
- options：可选参数，判断函数入参中是否存在该函数
- oneValueArgs：单选参数，在方法中指定Key只能有一个值。
- multiValueArgs：多选参数，在方法中指定key，可以携带多个参数。

文档例子：

```cmake
macro(my_install)
    set(options OPTIONAL FAST)
    set(oneValueArgs DESTINATION RENAME)
    set(multiValueArgs TARGETS CONFIGURATIONS)
    cmake_parse_arguments(MY_INSTALL "${options}" "${oneValueArgs}"
                          "${multiValueArgs}" ${ARGN} )

    # ...
endmacro()

# use
my_install(TARGETS foo bar DESTINATION bin OPTIONAL blub CONFIGURATIONS)
```



会产生以下Key和这些Key的指代

- MY_INSTALL_OPTIONAL = TRUE
- MY_INSTALL_FAST = FALSE # was not used in call to my_install
- MY_INSTALL_DESTINATION = "bin"
- MY_INSTALL_RENAME <UNDEFINED> # was not used
- MY_INSTALL_TARGETS = "foo;bar"
- MY_INSTALL_CONFIGURATIONS <UNDEFINED> # was not used
- MY_INSTALL_UNPARSED_ARGUMENTS = "blub" # nothing expected after "OPTIONAL"
- MY_INSTALL_KEYWORDS_MISSING_VALUES = "CONFIGURATIONS"



         # No value for "CONFIGURATIONS" given



