//
//  FYDataSource.h
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, kFYCellType){
    kFYCellTypeDefault = 0,
};

@protocol FYDataSourceDelegate <NSObject>

@optional
/**
 *  点击cell的代理方法,传出对应的item模型以及对应的tablview
 *
 *  @param item      对应的item
 *  @param tableView 对应的tablview
 */
- (void)didSelectedCellWithItem:(id)item tableView:(UITableView *)tableView;

- (CGFloat)heightForHeaderInSection:(NSInteger)section tableView:(UITableView *)tableView;
- (UIView *)viewForHeaderInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (CGFloat)heightForFooterInSection:(NSInteger)section tableView:(UITableView *)tableView;
- (UIView *)viewForFooterInSection:(NSInteger)section tableView:(UITableView *)tableView;

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView;

@end

@interface FYDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)       NSArray *items;
@property (nonatomic, assign) id<FYDataSourceDelegate>  delegate;

/**
 *  创建一个FYDataSource对象
 *
 *  @param items          模型数组
 *  @param cellIdentifier cell的缓存标识符
 *  @param cellType       cell类型
 *
 *  @return 实例好的FYDataSource对象
 */
- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier cellType:(kFYCellType)cellType;

@end
