//
//  FYBaseCell.h
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYBaseCell : UITableViewCell

/**
 *  通过数据item更新UI
 *
 *  @param item 数据模型
 */
- (void)configureCellContentWithItem:(id)item;

/**
 *  获取某个cell的高度
 *
 *  @param item 数据模型
 *
 *  @return cell的高度
 */
- (CGFloat)configureCellHeightWithItem:(id)item;

/**
 *  cell点击事件,传入item
 *
 *  @param item 数据模型
 */
- (void)didSelectedWithItem:(id)item;

@end
