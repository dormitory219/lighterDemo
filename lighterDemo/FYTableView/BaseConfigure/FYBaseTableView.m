//
//  FYBaseTableView.m
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "FYBaseTableView.h"

@interface FYBaseTableView ()

@property (nonatomic, strong) FYDataSource *defaultDataSource;

@end

@implementation FYBaseTableView

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier cellType:(kFYCellType)cellType{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultDataSource = [[FYDataSource alloc] initWithItems:items cellIdentifier:cellIdentifier cellType:cellType];
        self.dataSource = _defaultDataSource;
    }
    return self;
}

@end
