//
//  JSWebImageManager.m
//  YJSuperStore
//
//  Created by 鲁朋远 on 2019/3/29.
//  Copyright © 2019 WQ. All rights reserved.
//

#import "JSWebImageManager.h"

@implementation JSWebImageManager


- (id)downloadImageWithURL:(NSURL *)URL callbackQueue:(dispatch_queue_t)callbackQueue downloadProgress:(ASImageDownloaderProgress)downloadProgress completion:(ASImageDownloaderCompletion)completion{
    @autoreleasepool {
        YYWebImageManager *manager = [YYWebImageManager sharedManager];
        __weak YYWebImageOperation *operation = nil;
        operation = [manager requestImageWithURL:URL
                                         options:YYWebImageOptionSetImageWithFadeAnimation
                                        progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                            
                                        }
                                       transform:nil
                                      completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                                          completion(image, error, operation, nil);
                                      }];
        return operation;
    }
}

- (void)cancelImageDownloadForIdentifier:(id)downloadIdentifier {
    if (![downloadIdentifier isKindOfClass:[YYWebImageOperation class]]) {
        return;
    }
    [(YYWebImageOperation *)downloadIdentifier cancel];
}

- (void)cachedImageWithURL:(NSURL *)URL callbackQueue:(dispatch_queue_t)callbackQueue completion:(ASImageCacherCompletion)completion {
    [self.cache getImageForKey:[self cacheKeyForURL:URL] withType:(YYImageCacheTypeAll) withBlock:^(UIImage * _Nullable image, YYImageCacheType type) {
        completion(image, ASImageCacheTypeAsynchronous);
        if (image) {
            dispatch_async(callbackQueue, ^{
                completion(image, ASImageCacheTypeAsynchronous);
            });
        } else {
            dispatch_async(callbackQueue, ^{
//                [self downloadImageWithURL:URL callbackQueue:callbackQueue downloadProgress:^(CGFloat progress) {
//
//                } completion:^(id<ASImageContainerProtocol>  _Nullable image, NSError * _Nullable error, id  _Nullable downloadIdentifier) {
//                    if (image) {
//                        completion(image);
//                    }
//                }];
                
                [self downloadImageWithURL:URL callbackQueue:callbackQueue downloadProgress:^(CGFloat progress) {
                    
                                } completion:^(id<ASImageContainerProtocol>  _Nullable image, NSError * _Nullable error, id  _Nullable downloadIdentifier, id  _Nullable userInfo) {
                                    if (image) {
                                        completion(image, ASImageCacheTypeAsynchronous);
                                    }
                                }];
                
//                [self downloadImageWithURL:URL callbackQueue:callbackQueue downloadProgress:^(CGFloat progress) {
//
//                } completion:^(id<ASImageContainerProtocol>  _Nullable image, NSError * _Nullable error, id  _Nullable downloadIdentifier, id  _Nullable userInfo) {
//                    if (image) {
//                        completion(image);
//                    }
//                }];
            });
        }
    }];
}


@end
