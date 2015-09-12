//
//  BNRItem.h
//  RandomItems
//
//  Created by jiangchao on 15/8/11.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject <NSCoding>

@property (nonatomic,copy) NSString *itemName;
@property (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) NSInteger valueInDollars;
@property (nonatomic,readonly) NSDate *dateCreated;
@property (nonatomic,copy) NSString *itemKey;

+ (instancetype)randomItem;

//BNRItem类的制定初始化方法
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@end
