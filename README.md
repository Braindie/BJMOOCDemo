# QimuDemo


## 一、布局

### 界面布局

1. 首页有个UICollectionView基本布局
    * `UICollectionViewFlowLayout`是系统提供给我们一个封装好的流布局设置类
    
    
### 筛选条

1. 左对齐布局
`UICollectionViewLeftAlignedLayout`
    * 自定义`UICollectionViewFlowLayout`，重载了UICollectionViewLayout的两个方法，代码中有注释

2. banner
* 自定义`UICollectionViewFlowLayout`，实现特殊效果

3. 筛选列表
    * 列表弹框使用了属性`transform`动画、`alpha`动画
    
4. 筛选条
    * `CALayer`的子类了解一下


### Masonry

Masonry布局`UIScrollView`


### Toast

1. 自定义实现Alert
2. 系统实现Alert
3. UILabel分类实现Toast
4. Layer层实现Toast（switch case中初始化对象要用放入大括号里面，否则会报错）


### 事件响应者链
1. 事件响应者链

2. 触摸事件与手势



## 二、动画

### 2.1、属性动画 UIViewAnimation

#### 2.1.1、类方法动画，所以这些动画没有绑定任何视图
1. 大小动画（改变frame）
2. 拉伸动画（改变bounds）
3. 转移动画（改变center）
4. 平移、旋转、缩放动画（改变transform）
        * UIView有CGAffineTransform类型的属性transform，它是定义在二维空间上完成View的平移，旋转，缩放等效果的实现。
        * frame、bounds、position、anchorPoint
5. 透明度动画（改变alpha）
6. Keyframe
7. Spring
8. Transition

#### 2.1.2、交互动画 UIViewPropertyAnimator
通过动画绑定视图，该类实现的动画可以在结束前进行暂停、恢复、停止等操作。

#### 2.1.3、力学动画 UIDynamicAnimator

1. UIGravityBehavior：重力行为
2. UICollisionBehavior：碰撞行为
3. UISnapBehavior：甩行为
4. UIAttachmentBehavior：附着行为
5. UIPushBehavior：推行为



### 2.2、核心动画CoreAnimation

1. CABasicAnimation：单一动画，可以看做只有头尾的关键帧动画
2. CAKeyframeAnimation：关键帧动画，可以指定动画执行过程中每个阶段的动画
3. CATransition：视图切换动画，提供了动画渐变效果
4. CAAnimationGroup：同时播放多动画

###### 2.2.1、波浪图
`CAShapeLayer`
`CADisplayLink`就像是一个定时器，每隔几毫秒刷新一次屏幕。能让我们以和屏幕刷新频率相同的频率去刷新我们绘制到屏幕上的内容。

###### 2.2.1、波浪图注满动画
`CAShapeLayer`实现波浪动画
`CADisplayLink`定时器
`CABasicAnimation`实现注满动画

###### 2.2.2、旋转Loading
`CAShapeLayer`
`CAGradientLayer`实现颜色渐变
`CABasicAnimation`实现旋转动画

###### 2.2.3、复杂按钮动画
`CAShapeLayer`实现内容绘制
`CABasicAnimation`实现旋转动画

###### 2.2.3、膨胀按钮动画
`CAKeyframeAnimation`实现膨胀效果`transform.scale`

###### 2.2.4、折线图
折线图：
`CAShapeLayer`
`CATextLayer`
`CABasicAnimation`实现进度效果

平滑折线图：
`CAShapeLayer`
`CATextLayer`
`CAGradientLayer`颜色渐变
`CABasicAnimation`实现进度效果
`UIBezierPath`分类实现平滑效果

### 2.3、CoreGraphics、CoreText

###### 2.3.1、柱状图


###### 2.3.2、折线图
折线图、平滑折线图

###### 2.3.3、CoreText
`YYAsyncLayer`绘制

###### 2.3.4、图片绘制、图片切圆角




#### 2.4 Refresh
BJRefresh仿照MJRefresh实现动画的刷新效果</br>


#### 2.5 UIColor+BJColor
使用分类（类方法重写get方法）来设置颜色和系统的设置颜色保持了一致，好处可能就是看着舒服，实际的实现原理还是一样的
``` objc
//RGB颜色值
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//十六进制颜色码
#define UIColorFromRGBWithAlpha(rgbValue, a) [UIColor \ colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \ green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \ blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
```

#### 2.6 MBProgressHUD与SVProgressHUD




## 三、网络
#### 1.AFN和NSURLSession
- AFN
注释在源码中
- NSURLSession
注释在代码中

- 延迟加载

#### 2.数据持久化——FMDB的二次封装`ZDBModel`
1. 封装FMDB获取model中的属性；获取model的属性作为本地数据库表中的key。
2. 增删改查

#### 3.数据解析——YYModel
使用YYModel把json转换成Model


#### 4.数据加密
MD5加密

#### 5.优化——图片加载问题
图片问题是个大问题

#### 6.优化——UITableView中Cell的高度缓存问题
`UITableView-FDTemplateLayoutCell`

- Use `-registerNib:forCellReuseIdentifier:` 
- Use `-registerClass:forCellReuseIdentifier:`

#### 7.优化——离屏渲染问题
代码在1中


## 四、架构
#### MVP

#### MVVM
```
1、FourthSevice：将UITableView的代理对象指给FourthSevice，在控制器中初始化VM，并把VM设置为UITableView的代理对象。
2、FourthVM：将数据获取和转换（网络请求呢）的逻辑配到另外一个类中。
```
![MVVM文件结构](https://github.com/Braindie/BJMOOCDemo/blob/master/%E5%9B%BE%E7%89%87/MVVM.png)





## 五、功能
#### 1.获取通讯录

#### 2.图片选择器 

#### 3.蓝牙通讯
蓝牙中心设备

#### 4.OCR（光学字符识别）文字识别（由于不支持模拟器，已删除）



