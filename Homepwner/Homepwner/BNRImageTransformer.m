//
//  BNRImageTransformer.m
//  Homepwner
//
//  Created by jiangchao on 15/9/17.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRImageTransformer.h"

@implementation BNRImageTransformer

+ (Class)transformedValueClass{
    return [NSData class];
}

- (id)transformedValue:(id)value{
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value{
    return [UIImage imageWithData:value];
}

@end
