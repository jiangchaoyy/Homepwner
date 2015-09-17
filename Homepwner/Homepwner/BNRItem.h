//
//  BNRItem.h
//  Homepwner
//
//  Created by jiangchao on 15/9/17.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@class NSManagedObject;

@interface BNRItem : NSManagedObject

@property (nonatomic, strong) NSString * itemName;
@property (nonatomic, strong) NSString * serialNumber;
@property (nonatomic, strong) NSDate * dateCreated;
@property (nonatomic, strong) NSString * itemKey;
@property (nonatomic, strong) UIImage * thumbnail;
@property (nonatomic, strong) NSData * thumbnailData;
@property (nonatomic, strong) NSManagedObject *assetType;
@property (nonatomic) int valueInDollars;
@property (nonatomic) double orderingValue;

- (void)setThumbnailFromImage:(UIImage *)image;

@end
