//
//  BNRItem.m
//  RandomItems
//
//  Created by jiangchao on 15/8/11.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem{
    NSArray *randomAdjectiveList = @[@"Fluffy",@"Rusty",@"Shiny"];
    NSArray *randomNounlist = @[@"Bear",@"Spork",@"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounlist count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounlist[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}

- (instancetype)init{
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber{
    self = [super self];
    
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        _dateCreated = [NSDate date];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return self;
}

- (NSString *)description{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@d",self.itemName,self.serialNumber,self.valueInDollars,self.dateCreated];
    return descriptionString;
}

@end
