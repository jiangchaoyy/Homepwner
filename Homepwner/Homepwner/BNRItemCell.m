//
//  BNRItemCell.m
//  Homepwner
//
//  Created by jiangchao on 15/9/13.
//  Copyright (c) 2015年 jiangchao. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showImage:(id)sender{
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end
