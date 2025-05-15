# X264库 configure --help 记录

```sh
Usage: ./configure [options]

Help:
  -h, --help               print this message

Standard options:
  --prefix=PREFIX          install architecture-independent files in PREFIX
                           [/usr/local]
  --exec-prefix=EPREFIX    install architecture-dependent files in EPREFIX
                           [PREFIX]
  --bindir=DIR             install binaries in DIR [EPREFIX/bin]
  --libdir=DIR             install libs in DIR [EPREFIX/lib]
  --includedir=DIR         install includes in DIR [PREFIX/include]
  --extra-asflags=EASFLAGS add EASFLAGS to ASFLAGS
  --extra-cflags=ECFLAGS   add ECFLAGS to CFLAGS
  --extra-ldflags=ELDFLAGS add ELDFLAGS to LDFLAGS
  --extra-rcflags=ERCFLAGS add ERCFLAGS to RCFLAGS

Configuration options:
  --disable-cli            disable cli
  --system-libx264         use system libx264 instead of internal
  --enable-shared          build shared library
  --enable-static          build static library
  --disable-bashcompletion disable installation of bash-completion script
  --enable-bashcompletion  force installation of bash-completion script
  --bashcompletionsdir=DIR install bash-completion script in DIR [auto]
  --disable-opencl         disable OpenCL features
  --disable-gpl            disable GPL-only features
  --disable-thread         disable multithreaded encoding
  --disable-win32thread    disable win32threads (windows only)
  --disable-interlaced     disable interlaced encoding support
  --bit-depth=BIT_DEPTH    set output bit depth (8, 10, all) [all]
  --chroma-format=FORMAT   output chroma format (400, 420, 422, 444, all) [all]

Advanced options:
  --disable-asm            disable platform-specific assembly optimizations
  --enable-lto             enable link-time optimization
  --enable-debug           add -g
  --enable-gprof           add -pg
  --enable-strip           add -s
  --enable-pic             build position-independent code

Cross-compilation:
  --host=HOST              build programs to run on HOST
  --cross-prefix=PREFIX    use PREFIX for compilation tools
  --sysroot=SYSROOT        root of cross-build tree

External library support:
  --disable-avs            disable avisynth support
  --disable-swscale        disable swscale support
  --disable-lavf           disable libavformat support
  --disable-ffms           disable ffmpegsource support
  --disable-gpac           disable gpac support
  --disable-lsmash         disable lsmash support

```



## 标准选项(Standard options)

| options | 描述 |
| ------- | ---- |
|--prefix=PREFIX          | 可以通过这个选项配置安装目录，默认是 [/usr/local]<br />会生成类似于 [/usr/local/bin] 、[/usr/local/lib] 、[/usr/local/include] 等目录 |
|--exec-prefix=EPREFIX    | 与'--prefix'选项类似,但是他是用来设置结构倚赖的文件的安装位置。<br />可以指定编译好的二进制文件在什么位置 |
|--bindir=DIR             | 指定二进制文件的安装位置.这里的二进制文件定义为可以被用户直接执行的程序. |
|--libdir=DIR             | 指定库文件存放位置 |
|--includedir=DIR         | 指定include文件存放位置 |
|--extra-asflags=EASFLAGS | 指定汇编器(assembler)参数； |
|--extra-cflags=ECFLAGS   | 指定编译器(compiler)参数。一般指定include目录 |
|--extra-ldflags=ELDFLAGS | 指定链接器参数。一般指定lib目录，即打包的动态或者静态库地址 |
|--extra-rcflags=ERCFLAGS | 指定运行相关的参数； |



## 配置参数（Configuration options）

| options | 描述 |
| ---- | ---- |
|--disable-cli           |不生成x264命令行工具；|
|--system-libx264        |指定使用系统的libx264库而非内部库|
|--enable-shared         |生成共享库；|
|--enable-static         |生成静态库；|
|--disable-bashcompletion||
|--enable-bashcompletion ||
|--bashcompletionsdir=DIR||
|--disable-opencl        |禁用opencl；|
|--disable-gpl           |禁用gpl协议相关的功能；|
|--disable-thread        |禁用多线程编码；|
|--disable-win32thread   |在Windows下禁用win32线程；|
|--disable-interlaced    |禁用交错编码功能；|
|--bit-depth=BIT_DEPTH   |指定编码比特深度，默认支持 8 bit 和 10 bit；|
|--chroma-format=FORMAT  |指定支持的颜色空间，默认支持400/420/422/444格式；|



## 高级参数（Advanced options）

| options | 描述 |
| ---- | ---- |
|--disable-asm           |禁用汇编优化；|
|--enable-lto            |启用链接时优化；|
|--enable-debug          |启用调试模式；|
|--enable-gprof          |启用性能测试工具gprof；|
|--enable-strip          |启用精简模式；|
|--enable-pic            |生成位置无关代码；|



## 交叉编译选项(Cross-compilation)

| options | 描述 |
| ---- | ---- |
|--host=HOST             |指定目标操作系统；|
|--cross-prefix=PREFIX   |指定交叉编译工具前缀|
|--sysroot=SYSROOT       |指定编译的逻辑目录根目录；|



## 第三方库支持(External library support)

| options | 描述 |
| ---- | ---- |
|--disable-avs          |禁用avisynth；|
|--disable-swscale      |禁用libswscale;|
|--disable-lavf         |禁用libavformat库；|
|--disable-ffms         |禁用FFMpeg相关；|
|--disable-gpac         |禁用gpac；|
|--disable-lsmash       |禁用lsmash；|





