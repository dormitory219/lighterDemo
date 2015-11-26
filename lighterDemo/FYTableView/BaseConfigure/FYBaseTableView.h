//
//  FYBaseTableView.h
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYDataSource.h"

@interface FYBaseTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame
                        items:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
                     cellType:(kFYCellType)cellType;
@end
