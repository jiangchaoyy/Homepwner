//
//  BNRItemStore.m
//  Homepwner
//
//  Created by jiangchao on 15/8/28.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore ()
//对内定义为可变数组
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

#pragma mark - Singleton
//单例模式
+ (instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

#pragma mark - init
- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        NSString *path = [self itemArchivePath];
        NSLog(@"Path = %@",path);
        
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

#pragma mark - property
//覆盖取方法，返回可变类型：此处虽然返回是可变类型，但在使用时，应遵循头文件中声明的类型。声明为不可变，即应该按照不可变类型操作，即使返回的是可变类型。否则容易混乱。
- (NSArray *)allItems{
    return self.privateItems;
}

#pragma mark - methods

- (BNRItem *)createItem{
    BNRItem *item = [[BNRItem alloc] init];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSInteger)fromIndex
                toIndex:(NSInteger)toIndex{
    if (fromIndex == toIndex) {
        return;
    }
    
    BNRItem *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:item
                            atIndex:toIndex];
}


- (NSString *)itemArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingString:@"items.archive"];
}

- (BOOL)saveChanges{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.privateItems
                                       toFile:path];
}

@end
