//
//  BNRItem.m
//  Homepwner
//
//  Created by jiangchao on 15/9/17.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

@synthesize itemName,itemKey,serialNumber,thumbnail,thumbnailData,valueInDollars,orderingValue,dateCreated,assetType;

- (void)awakeFromInsert{
    [super awakeFromInsert];
    
    self.dateCreated = [NSDate date];
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    self.itemKey = key;
}

- (void)setThumbnailFromImage:(UIImage *)image{
    CGSize origImageSize = image.size;
    //缩略图的大小
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    //确定缩放倍数并保持宽高比不变
    float ratio = MAX(newRect.size.width / origImageSize.width, newRect.size.height / origImageSize.height);
    //根据当前设备的屏幕scaling factor创建透明的位图上下文
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    //创建表示圆角矩形的UIBezierPath对象
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect
                                                    cornerRadius:5.0];
    //根据UIBezierPath对象剪裁图形上下文
    [path addClip];
    //让图片在缩略图绘制范围内居中
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    //在上下文中绘制图片
    [image drawInRect:projectRect];
    //通过图形上下文得到UIImage对象，并将其赋给thumbnail属性
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.thumbnail = smallImage;
    //清理图形上下文
    UIGraphicsEndImageContext();
}

@end
