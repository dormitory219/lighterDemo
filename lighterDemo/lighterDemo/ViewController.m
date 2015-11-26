//
//  ViewController.m
//  lighterDemo
//
//  Created by apple on 15/11/26.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "FYTableView.h"

@interface ViewController ()<FYDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, retain) FYDataSource *dataSource;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FYDataSource *dataSource = [[FYDataSource alloc] initWithItems:@[@"0",@"1",@"2",@"3",@"4"] cellIdentifier:@"testCell" cellType:kFYCellTypeDefault];
    dataSource.delegate = self;
    self.mTableView.dataSource = dataSource;
    self.mTableView.delegate = dataSource;
    self.dataSource = dataSource;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
