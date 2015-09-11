//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by jiangchao on 15/8/30.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController

- (instancetype)initForNewItem:(BOOL)isNew;

@property (nonatomic,strong) BNRItem *item;
@property (nonatomic,copy) void (^dismissBlock)(void);

@end
