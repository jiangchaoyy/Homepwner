//
//  BNRItemStore.h
//  Homepwner
//
//  Created by jiangchao on 15/8/28.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
//对外公开的是不可变数组，防止外部修改
@property (nonatomic,readonly) NSArray *allItems;

+ (instancetype)sharedStore;

- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex;

- (BOOL)saveChanges;

- (NSArray *)allAssetTypes;
@end
