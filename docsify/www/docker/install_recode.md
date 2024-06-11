# docker 一些开发使用的库将安装记录

> 基于Ubuntu配置


## Cmake编译安装


```docker
ADD https://static.leojay.site/library/cmake/v3.29/cmake-3.29.0-rc4-linux-x86_64.sh .
RUN chmod +x cmake-3.29.0-rc4-linux-x86_64.sh && ./cmake-3.29.0-rc4-linux-x86_64.sh --skip-license --prefix=/usr/local
ENV PATH=$PATH:/usr/local/bin
```


## SDL2


```docker
ADD https://static.leojay.site/library/SDL_bin/SDL2.30.1/SDL2-2.30.1.tar.gz .
RUN tar -xf SDL2-2.30.1.tar.gz && rm -rf SDL2-2.30.1.tar.gz && mv SDL2-2.30.1 sdl2
ENV SDL2_HOME=/workspace/sdl2
```
