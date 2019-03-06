//
//  FiveDetailViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2017/11/28.
//  Copyright © 2017年 ll. All rights reserved.
//

#import "FiveDetailViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "BookModel.h"

@interface FiveDetailViewController ()
@property (nonatomic, strong)NSMutableArray *linkManArray;

@end

@implementation FiveDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"通讯录";
    
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookBtn.frame = CGRectMake(0, 300, self.view.frame.size.width, 50);
    [bookBtn setTitle:@"获取通讯录" forState:UIControlStateNormal];
    bookBtn.backgroundColor = [UIColor grayColor];
    [bookBtn addTarget:self action:@selector(bookAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:bookBtn];

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
