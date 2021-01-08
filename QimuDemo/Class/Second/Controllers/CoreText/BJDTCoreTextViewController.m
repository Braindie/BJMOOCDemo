//
//  BJDTCoreTextViewController.m
//  QimuDemo
//
//  Created by 张文军 on 2021/1/8.
//  Copyright © 2021 ll. All rights reserved.
//

#import "BJDTCoreTextViewController.h"
#import <DTCoreText/DTCoreText.h>

@interface BJDTCoreTextViewController ()

@end

@implementation BJDTCoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSAttributedString *)attributedString:(NSString *)htmlString {
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];

    CGSize maxImageSize = CGSizeMake(self.view.bounds.size.width - 50.0, self.view.bounds.size.height - 20.0);

    void (^callBackBlock)(DTHTMLElement *element) = ^(DTHTMLElement *element) {
        [self ergodicWithElememt:element];
    };

    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:1.0], NSTextSizeMultiplierDocumentOption, [NSValue valueWithCGSize:maxImageSize], DTMaxImageSize,
                                    @"Times New Roman", DTDefaultFontFamily,  @"purple", DTDefaultLinkColor, @"red", DTDefaultLinkHighlightColor, callBackBlock, DTWillFlushBlockCallBack, nil];

    NSAttributedString *string = [[NSAttributedString alloc] initWithHTMLData:data options:options documentAttributes:NULL];

    return string;
}

- (void)ergodicWithElememt:(DTHTMLElement *)element {
    if ([element.name isEqualToString:@"img"]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:element.attributes];
        [dict setObject:@"middle" forKey:@"vertical-align"];
        NSString *url = [dict objectForKey:@"src"];
        NSArray * array = [url componentsSeparatedByString:@"?"];
        if (array.count==2) {
            NSString * realURL = array[0];
            realURL = [realURL stringByReplacingOccurrencesOfString:@"" withString:@""];
            [dict setObject:realURL forKey:@"src"];
            NSString * sizeStr = array[1];
            NSArray * frameArray = [sizeStr componentsSeparatedByString:@"|"];
            if (frameArray.count==2) {
                float width = [frameArray[0] floatValue]/2;
                float height = [frameArray[1] floatValue]/2;
                [dict setObject:[NSString stringWithFormat:@"%f", width] forKey:@"width"];
                [dict setObject:[NSString stringWithFormat:@"%f", height] forKey:@"height"];
            }
        }
        element.attributes = dict;
        element.textAttachment = [[DTImageTextAttachment alloc] initWithElement:element options:nil];
        [element applyStyleDictionary:dict];
        NSLog(@"%@", dict);
    }
    if (element.childNodes.count) {
        for (DTHTMLElement *oneChildElement in element.childNodes) {
            [self ergodicWithElememt:oneChildElement];
        }
    } else {
        return;
    }
}


@end
