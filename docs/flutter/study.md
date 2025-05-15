# 学习笔记



## 动画

### `SlideTransition` 滑动事件

> Flutter有一组扩展AnimatedWidget的小部件，当动画的值改变时，它们会自我重建。例如，slidetran接受动画 <Offset>，并在动画的值发生变化时转换其子级 (使用FractionalTranslation小部件)。

#### docs

- [设置页面路由过渡的动画](https://docs.flutter.dev/cookbook/animation/page-route-animation#1-set-up-a-pageroutebuilder)



### `DragUpdateDetails` 类

> 用于响应结果



参数：

| name              | type     | desc                                                         |
| ----------------- | -------- | ------------------------------------------------------------ |
| `delta`           | Offset   | 表示自上次拖动更新以来，拖动指针在水平和垂直方向上的移动量。通常用于计算拖动过程中对象的位置变化 |
| `primaryDelta`    | double   | 表示自上次拖动更新以来，拖动指针在水平和垂直方向上的移动量。通常用于计算拖动过程中对象的位置变化 |
| `globalPosition`  | Offset   | 表示当前拖动事件发生时的全局位置（相对于屏幕）。这可以用来确定拖动事件在全局坐标系中的位置 |
| `localPosition`   | Offset   | 表示当前拖动事件发生时的本地位置（相对于被拖动组件的坐标系）。这可以用来确定拖动事件在本地坐标系中的位置。 |
| `sourceTimeStamp` | DateTime | 表示拖动事件在底层设备上发生的时间戳。                       |

> `Offset(_dx, _dy)`