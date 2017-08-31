# QimuDemo


## First
首页有个UICollectionView基本布局
详情有个UICollectionViewLeftAlignedLayout左布局



## Second
### 界面布局
视频筛选列表界面</br>
视频播放详情界面

### FMDB的封装ZDModel
1、封装FMDB获取model中的属性；
获取model的属性作为本地数据库表中的key。



## Third
### 直播
使用AFN请求映客直播列表</br>
使用YYModel把json转换成Model</br>

使用FFMpeg实现拉流</br>
使用kxmovie进行视频播放</br>
使用MBProgressHUD作为加载提示框



## Fourth
### MVVM
```
1、FourthSevice：将UITableView的代理对象指给FourthSevice，在控制器中初始化VM，并把VM设置为UITableView的代理对象。
2、FourthVM：将数据获取和转换（网络请求呢）的逻辑配到另外一个类中。
```
![MVVM文件结构](https://github.com/Braindie/BJMOOCDemo/blob/master/%E5%9B%BE%E7%89%87/MVVM.png)



## Fifth
### 图片选择器 
### OCR（光学字符识别）文字识别


