# Android Ndk 笔记



## NDK与其他构建系统构建时标记

### 不同操作系统标记

| NDK 操作系统变体 | 主机标记         |
| :--------------- | :--------------- |
| macOS            | `darwin-x86_64`  |
| Linux            | `linux-x86_64`   |
| 64 位 Windows    | `windows-x86_64` |



### Android 支持的目标三元组

| ABI         | 三元组                     |
| :---------- | :------------------------- |
| armeabi-v7a | `armv7a-linux-androideabi` |
| arm64-v8a   | `aarch64-linux-android`    |
| x86         | `i686-linux-android`       |
| x86-64      | `x86_64-linux-android`     |

