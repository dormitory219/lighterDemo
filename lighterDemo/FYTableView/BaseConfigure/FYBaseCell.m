//
//  FYBaseCell.m
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "FYBaseCell.h"

#define kBaseCellHeight 44.0f

@implementation FYBaseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)configureCellContentWithItem:(id)item{
    
}

- (CGFloat)configureCellHeightWithItem:(id)item{
    return kBaseCellHeight;
}

- (void)didSelectedWithItem:(id)item{
    NSLog(@"******点击了cell--item:%@******",item);
}

@end
