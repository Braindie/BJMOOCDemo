# QimuDemo


## 布局

### 界面布局
- 首页有个UICollectionView基本布局
- 左上角的UICollectionViewLeftAlignedLayout左布局
- 左上角的筛选列表
- 左上角的筛选条


#### Toast
1、自定义实现Alert</br>
2、系统实现Alert</br>
3、UILabel分类实现Toast</br>
4、Layer层实现Toast（switch case中初始化对象要用放入大括号里面，否则会报错）</br>



## 动画
#### 属性动画UIViewAnimation
1. 大小动画（改变frame）
2. 拉伸动画（改变bounds）
3. 转移动画（改变center）
4. 旋转动画（改变transform）
5. 透明度动画（改变alpha）
6. Keyframe
7. Spring
8. Transition


#### 核心动画CoreAnimation

* 使用Layer实现波浪图</br>

* 使用Layer实现`Loading`的加载效果</br>


#### CoreGraphics

* 使用CoreGraphics实现柱状图，折线图</br>



#### Refresh
BJRefresh仿照MJRefresh实现动画的刷新效果</br>

#### UIColor+BJColor
使用分类（类方法重写get方法）来设置颜色和系统的设置颜色保持了一致，好处可能就是看着舒服，实际的实现原理还是一样的
``` objc
//RGB颜色值
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
//十六进制颜色码
#define UIColorFromRGBWithAlpha(rgbValue, a) [UIColor \ colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \ green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \ blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
```

#### MBProgressHUD




## 网络
#### AFN和NSURLSession
- AFN
注释在源码中
- NSURLSession
注释在代码中

#### YYModel
使用YYModel把json转换成Model


#### FMDB的封装ZDModel
1、封装FMDB获取model中的属性；
获取model的属性作为本地数据库表中的key。


#### UITableView-FDTemplateLayoutCell
个人理解：提前把数据源放到Cell中计算高度
- A prototype cell of UITableView in storyboard.
- Use `-registerNib:forCellReuseIdentifier:` 
- Use `-registerClass:forCellReuseIdentifier:`

``` objc
#import "UITableView+FDTemplateLayoutCell.h"
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"reuse identifer" configuration:^(id cell) {
        // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
        // Like:
        //    cell.entity = self.feedEntities[indexPath.row];
    }];
}
```



## 架构
#### MVVM
```
1、FourthSevice：将UITableView的代理对象指给FourthSevice，在控制器中初始化VM，并把VM设置为UITableView的代理对象。
2、FourthVM：将数据获取和转换（网络请求呢）的逻辑配到另外一个类中。
```
![MVVM文件结构](https://github.com/Braindie/BJMOOCDemo/blob/master/%E5%9B%BE%E7%89%87/MVVM.png)



## 功能
#### 图片选择器 
#### OCR（光学字符识别）文字识别（由于不支持模拟器，已删除）

#### 蓝牙通讯
左侧按钮有蓝牙通讯的代码，蓝牙中心设备</br>

