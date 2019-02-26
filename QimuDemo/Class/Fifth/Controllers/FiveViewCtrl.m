//
//  FiveViewCtrl.m
//  QimuDemo
//
//  Created by zhangwenjun on 16/7/4.
//  Copyright © 2016年 ll. All rights reserved.
//

#import "FiveViewCtrl.h"
#import "PhotoSelectView.h"
#import "UIImageView+WebCache.h"
#import "FiveDetailViewController.h"
#import "FirstTableViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "BookModel.h"


@interface FiveViewCtrl ()
@property (nonatomic, strong) PhotoSelectView *photoView;
/**
 *    图片
 */
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong)NSMutableArray *linkManArray;

@end

@implementation FiveViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isNavCtrlSetLeft = YES;
    self.isNavCtrlSetRight = NO;
    self.navigationItem.title = @"功能";
    [self.leftButton setTitle:@"蓝牙" forState:UIControlStateNormal];
    
    
    
#pragma mark - 获取通讯录
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookBtn.frame = CGRectMake(0, 300, self.view.frame.size.width, 50);
    [bookBtn setTitle:@"获取通讯录" forState:UIControlStateNormal];
    bookBtn.backgroundColor = [UIColor grayColor];
    [bookBtn addTarget:self action:@selector(bookAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bookBtn];

    
    [self creatView];

    [self creatPhotoView];

    [self creatImageView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://picture.youth.cn/qtdb/201705/W020170509396200729137.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"%@",error);
    }];
}

- (void)leftButtonAction:(UIButton *)button{
    FirstTableViewController *vc = [[FirstTableViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)creatView{
    self.photoView = [[PhotoSelectView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)  withIsOnlyPreview:NO] ;

    self.photoView.delegate = self ;

    //刷新图片回调
    self.photoView.onRefreshImage = ^(PhotoSelectView *photoView){

    };
    //删除图片回调
    self.photoView.onDeleteImage = ^(PhotoSelectView *photoView,NSInteger index, PhotoModel *photoModel){
        
        [photoView removeImageFromList:index];
    };
    [self.view addSubview:self.photoView];
}

- (void)creatPhotoView{
//    self.b1PhotoView = [[BunnyPhotoView alloc] initWithFrame:CGRectMake(20, 264, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    self.b1PhotoView.VCdelegate = self;
//    [self.view addSubview:self.b1PhotoView];
//
//    self.b2PhotoView = [[BunnyPhotoView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-60)/2 + 40, 264, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    [self.view addSubview:self.b2PhotoView];
    
    
    
    
    self.b1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 380, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    self.b1ImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.b1ImageView setImage:[UIImage imageNamed:@"headerView"]];
    [self.view addSubview:self.b1ImageView];
    
    self.b2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-60)/2 + 40, 380, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    self.b1ImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.b2ImageView setImage:[UIImage imageNamed:@"headerView"]];
    [self.view addSubview:self.b2ImageView];
}

- (void)creatImageView {
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 500, (self.view.frame.size.width-60)/2, (self.view.frame.size.width-60)/2*540/856)];
//    [self.view addSubview:self.imageView];
//    [image sd_setImageWithURL:[NSURL URLWithString:@"http://img5.imgtn.bdimg.com/it/u=49366202,632101467&fm=27&gp=0.jpg"] placeholderImage:[UIImage imageNamed:@""]];
    
    
//
//    [SDWebImageDownloader.sharedDownloader setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
//                                 forHTTPHeaderField:@"Accept"];
//    //这个图片报Error Domain=NSURLErrorDomain Code=403 "(null)"，，，应该是图片链接有问题，，，上面的那句没用
//    [image sd_setImageWithURL:[NSURL URLWithString:@"http://img5.imgtn.bdimg.com/it/u=49366202,632101467&fm=27&gp=0.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        NSLog(@"%@",error);
//    }];
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake((self.view.frame.size.width-60)/2+50, 500, 120, 30);
//    btn.backgroundColor = [UIColor orangeColor];
//    btn.titleLabel.textColor = [UIColor blueColor];
//    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTitle:@"跳一下" forState:UIControlStateNormal];
//    [self.view addSubview:btn];
    


}

- (void)btnAction{
    
    FiveDetailViewController *vc = [[FiveDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - 获取通讯录方法

- (void)bookAction:(UIButton *)sender{
    
    ABAddressBookRef addressBookref = ABAddressBookCreateWithOptions(NULL, NULL);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookref, ^(bool granted, CFErrorRef error) {
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        });
    }else if(ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        CFErrorRef *error1 = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
        [self copyAddressBook:addressBook];
        
    }else{
        UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有获取通讯录权限" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        alert.delegate = self;
        [alert show];
    }
}


- (void)copyAddressBook:(ABAddressBookRef)addressBook{
    //获取联系人个数
    CFIndex numberOfPeoples = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef peoples = ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSLog(@"有%ld个联系人", numberOfPeoples);
    //循环获取联系人
    for (int i = 0; i < numberOfPeoples; i++) {
        
        ABRecordRef person = CFArrayGetValueAtIndex(peoples, i);
        BookModel *bookModel = [[BookModel alloc] init];
        bookModel.firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        bookModel.lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        bookModel.nickName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonNicknameProperty);
        bookModel.organiztion = (__bridge NSString*)ABRecordCopyValue(person, kABPersonOrganizationProperty);
        bookModel.headImage = (__bridge NSData*)ABPersonCopyImageData(person);
        
        
        if (bookModel.firstName && bookModel.lastName) {
            bookModel.name = [NSString stringWithFormat:@"%@%@",bookModel.lastName, bookModel.firstName];
        }else if(!bookModel.firstName){
            bookModel.name = bookModel.lastName;
        }else{
            bookModel.name = bookModel.firstName;
        }
        if (!bookModel.name) {
            bookModel.name = bookModel.organiztion;
        }
        if (bookModel.nickName) {
            bookModel.name =[NSString stringWithFormat:@"%@", bookModel.nickName];
        }
        
        //读取电话多值
        NSMutableArray *phoneArray = [[NSMutableArray alloc] init];
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
        {
            //获取电话Label
            NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phone, k));
            //获取該Label下的电话值
            NSString * tempstr = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
            NSArray *array = [NSArray arrayWithObjects:personPhoneLabel, tempstr, nil];
            [phoneArray addObject:array];
        }
        bookModel.phones = phoneArray;
        [self.linkManArray addObject:bookModel];
    }
    //    NSDictionary *dict = [ICPinyinGroup group:self.linkManArray  key:@"name"];
    //
    //    self.tableHeaderArray = [dict objectForKey:LEOPinyinGroupCharKey];
    //    self.sortedArrForArrays = [dict objectForKey:LEOPinyinGroupResultKey];
    //    [self performSelectorOnMainThread:@selector(reloadTable) withObject:nil waitUntilDone:YES];
    NSLog(@"%@",self.linkManArray);
}
@end
