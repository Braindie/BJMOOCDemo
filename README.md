# QimuDemo


## First

### 界面布局
首页有个UICollectionView基本布局</br>
详情有个UICollectionViewLeftAlignedLayout左布局</br>

### 蓝牙通讯
左侧按钮有蓝牙通讯的代码，蓝牙中心设备</br>



## Second
### 波浪图
使用Layer实现波浪图</br>

### 柱状图，折线图
使用CoreGraphics实现柱状图，折线图</br>

### Toast
1、自定义实现Alert</br>
2、系统实现Alert</br>
3、UILabel分类实现Toast</br>
4、Layer层实现Toast（switch case中初始化对象要用放入大括号里面，否则会报错）</br>

### Loading
使用Layer实现`Loading`的加载效果</br>

### Refresh
BJRefresh仿照MJRefresh实现动画的刷新效果</br>


### FMDB的封装ZDModel
1、封装FMDB获取model中的属性；
获取model的属性作为本地数据库表中的key。



## Third
### AFN和NSURLSession
- AFN
注释在源码中
- NSURLSession
注释在代码中

###  YYModel
使用YYModel把json转换成Model

### MBProgressHUD

### UITableView-FDTemplateLayoutCell
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



## Fourth
### MVVM
```
1、FourthSevice：将UITableView的代理对象指给FourthSevice，在控制器中初始化VM，并把VM设置为UITableView的代理对象。
2、FourthVM：将数据获取和转换（网络请求呢）的逻辑配到另外一个类中。
```
![MVVM文件结构](https://github.com/Braindie/BJMOOCDemo/blob/master/%E5%9B%BE%E7%89%87/MVVM.png)



## Fifth
### 图片选择器 
### OCR（光学字符识别）文字识别（由于不支持模拟器，已删除）



