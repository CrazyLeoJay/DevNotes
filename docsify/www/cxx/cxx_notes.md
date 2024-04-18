

# C++ 笔记

## 指针函数操作

| 函数名 |  | 解释 |
| ------ | ---- | ---- |
| `memchr` | `void *memchr(const void *buf，int c，sizet count);` | 查找 buf 的前 count 个字节中 c 的第一次出现，当找到 c 或已检查完 count 个字节时 |
| `memcmp` | `int memcmp( const void* lhs, const void* rhs, size_t count );` | `memcmp()` 函数采用三个参数：`lhs` , `rhs` 和 `count`。此函数首先将 `lhs` 和 `rhs` 指向的对象解释为 `unsigned char` 的数组。然后它按字典顺序比较`lhs` 和`rhs` 的前`count` 字符。 |
| `memcpy` | `void *memcpy(void *dest，const void *src，sizet count);` | 从 src 拷贝 count 个字节到 dest。如果源缓冲区和目的缓冲区重叠，这个函数不能保 |
| `mempcpy` | | |
| `memset` | `void *memset(void *dest，int c，sizet count);` | 设置 dest 的前 count 个字节为字符 c。 |
| `memccpy` | | |
| `memicmp` | `int memicmp(const void *buf1，const void *buf2，unsigned intcount);` | 比较两个缓冲区 bufl 和 buf2的前 count 个字符，比较过程是大小写无关的。 |
| `memmove` | `void *memmove(void *dest，const void *src，sizet count);` | 从 src 拷贝 count 个字节到 dest。如果源区域与目的区域有重叠，memmove 也能确 |

