# C++ 中 signal 信号监听

signal函数定义：

```c++
extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     __THROW;
```

第一个参数 sig的参数有：

| 标记 | 解释 |
| ---- | ---- |
|SIGHUP |当控制终端关闭时，或者父进程终止时，子进程会收到此信号。|
|SIGINT |当用户希望中断进程时，通常是通过按 Ctrl+C，进程会收到此信号。|
|SIGQUIT |当用户希望终止进程并执行核心转储时，通常是通过按 Ctrl+\，进程会收到此信号。|
|SIGILL |当进程尝试执行非法的机器语言指令时，会收到此信号。|
|SIGABRT |当进程调用 abort() 函数时，会收到此信号。|
|SIGFPE |当进程执行了错误的算术操作（如除以零）时，会收到此信号。|
|SIGKILL |用于立即终止进程。此信号不能被捕获或忽略。|
|SIGSEGV |当进程尝试访问非法的内存地址时，会收到此信号。|
|SIGPIPE |当进程向一个已经关闭的管道写入数据时，会收到此信号。|
|SIGALRM |当设定的定时器超时时，会收到此信号。|
|SIGTERM |请求终止进程时，会收到此信号。这是终止进程的礼貌方式。|
|SIGUSR1 |和 SIGUSR2：用户定义的信号，可以用于应用程序特定的目的。|
|SIGCHLD |当子进程终止或停止时，父进程会收到此信号。|
|SIGCONT |当被停止的进程继续执行时，会收到此信号。|
|SIGSTOP |用于停止进程的执行。此信号不能被捕获或忽略。|
|SIGTSTP |当用户请求停止进程时，通常是通过按 Ctrl+Z，进程会收到此信号。|
|SIGTTIN 和 SIGTTOU|当后台进程尝试读取其控制终端或写入其控制终端时，会收到这些信号。|



## __sighandler_t 函数

```c++
typedef void (*__sighandler_t) (int);

// eg:
void SAMPLE_VIO_HandleSig(HI_S32 signo){}
```

signo 即响应的信号