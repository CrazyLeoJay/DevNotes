# Cmake指令记录

## 调用

使用Cmake命令有三种格式：

```sh
cmake [options] <path-to-source>
cmake [options] <path-to-existing-build>
cmake [options] -S <path-to-source> -B <path-to-build>
```

使用`cmake [options] <path-to-source>` 会直接编译，将生成的文件放入这个目录中。

使用`cmake [options] -S <path-to-source> -B <path-to-build>` 会编译`-S`指定的目录，将结果放入 `-B` 指定的目录中。

## 环境变量

可以在编译时指定环境变量，比如：

```sh
cmake.exe -DCMAKE_BUILD_TYPE=Debug -S ./ -B ./cmake-build-debug
```

这里指定的`DCMAKE_BUILD_TYPE` 可以在`CMakeList.txt`文件中直接使用。



## 指定编译器

- `-G`

> 不调用这个参数的话也可以编译，但是目前就不知道在系统上会使用哪个编译了，这个需要再研究文档。

例如：

```sh
cmake.exe -DCMAKE_BUILD_TYPE=Debug -G "MinGW Makefiles" -S ./ -B ./cmake-build-debug
```

这里就指定了cmake使用 `WinGw Makefiles` 进行编译.

使用帮助命令，可以在最后看到系统支持的编译器可以进行选填。

```sh
$cmake --help
# 例如在linux环境下会得到

Generators

The following generators are available on this platform:
  Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  KDevelop3                    = Generates KDevelop 3 project files.
  KDevelop3 - Unix Makefiles   = Generates KDevelop 3 project files.

```



## 构建项目

```sh
$cmake --build <dir>
```

构建目录

