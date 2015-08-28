//
//  BNRItemStore.m
//  Homepwner
//
//  Created by jiangchao on 15/8/28.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()
//对内定义为可变数组
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

#pragma make - Singleton
//单例模式
+ (instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

#pragma make - init
- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma make - property
//覆盖取方法，返回可变类型：此处虽然返回是可变类型，但在使用时，应遵循头文件中声明的类型。声明为不可变，即应该按照不可变类型操作，即使返回的是可变类型。否则容易混乱。
- (NSArray *)allItems{
    return self.privateItems;
}

#pragma make - methods

- (BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
