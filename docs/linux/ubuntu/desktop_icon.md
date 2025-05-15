# 创建ubuntu桌面图标

创建一个的desktop为文件

```
[Desktop Entry]
Name=Name
Comment=Comment
Exec=/path/to/executable
Icon=/path/to/icon
Terminal=false
Type=Application
Categories=Category
```

- Name: 应用程序的名称
- Comment: 应用程序的描述
- Exec: 应用程序的执行命令
- Icon: 应用程序的图标路径
- Terminal: 是否在终端中运行，true表示在终端中运行，false表示在图形界面中运行

将文件保存为.desktop文件，并将其放入/usr/share/applications/目录下，即可在ubuntu的菜单栏中找到该应用程序。


或者，使用 ln 命令

```
ln -s /path/to/your/application.desktop /usr/share/applications/
```
    
`