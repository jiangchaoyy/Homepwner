//
//  BNRImageStore.h
//  Homepwner
//
//  Created by jiangchao on 15/9/3.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;
@end
