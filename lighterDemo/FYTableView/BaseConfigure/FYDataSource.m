//
//  FYDataSource.m
//  FYMenuExample
//
//  Created by apple on 15/11/23.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYDataSource.h"
#import "FYBaseCell.h"

#import "DemoCell.h"

@interface FYDataSource()
{
    FYBaseCell * _baseCell;
}

@property (nonatomic, copy)         NSString *cellIdentifier;
@property (nonatomic, assign)       kFYCellType cellType;

@end

@implementation FYDataSource

- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier cellType:(kFYCellType)cellType{
    
    self = [super init];
    if (self) {
        self.items          = items;
        self.cellIdentifier = cellIdentifier;
        self.cellType       = cellType;
        
        if (cellType == kFYCellTypeDefault) {
            _baseCell = [[FYBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellIdentifier];
        }
        else if (cellType == kFYCellTypeDemo) {
            _baseCell = [[DemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
    }
    return self;
}

#pragma mark
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FYBaseCell *cell = (FYBaseCell *)[tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    
    if (_cellType == kFYCellTypeDefault) {
        if (!cell) {
            cell = [[FYBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellIdentifier];
        }
    }
    
    else if (_cellType == kFYCellTypeDemo){
        if (!cell) {
            cell = [[DemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellIdentifier];
        }
    }
    
    id item = [self itemAtIndexPath:indexPath];
    [cell  configureCellContentWithItem:item];
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sectionIndexTitlesForTableView:)]) {
        return [self.delegate sectionIndexTitlesForTableView:tableView];
    }
    
    return nil;
}

#pragma mark
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id item = [self itemAtIndexPath:indexPath];
    return [_baseCell configureCellHeightWithItem:item];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id item = [self itemAtIndexPath:indexPath];
    
    FYBaseCell *cell = (FYBaseCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell didSelectedWithItem:item];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedCellWithItem:tableView:)]) {
        [self.delegate didSelectedCellWithItem:item tableView:tableView];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForHeaderInSection:tableView:)]) {
        return [self.delegate heightForFooterInSection:section tableView:tableView];
    }
    
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForFooterInSection:tableView:)]) {
        return [self.delegate heightForFooterInSection:section tableView:tableView];
    }
    
    return 1.0f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewForHeaderInSection:tableView:)]) {
        return [self.delegate viewForHeaderInSection:section tableView:tableView];
    }
    
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewForFooterInSection:tableView:)]) {
        return [self.delegate viewForFooterInSection:section tableView:tableView];
    }
    
    return nil;
}



#pragma mark - getter
- (NSArray *)items{
    
    if (_items == nil) {
        NSArray *tempItems = [[NSArray alloc]init];
        _items = tempItems;
    }
    return _items;
}


#pragma mark - private
- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return _items[indexPath.row];
}

@end
