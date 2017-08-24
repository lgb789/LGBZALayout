//
//  Example11.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/23.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example11.h"
#import "ExampleView11.h"
#import "ExampleModel11.h"

@interface Example11 ()
@property (nonatomic, strong) ExampleView11 *exampleView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Example11

#pragma mark ------------------------------------------------- 生命周期 -------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------
-(void)addData
{
    NSArray *arr = [self createDataArrayCount:10];
    
    [self.data addObjectsFromArray:arr];
    
    [self.exampleView setupData:self.data];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];
    
    [self.view addSubview:self.exampleView];
    
    self.exampleView.lgb_Layout
    .spaceToViewLeft(self.view, 0)
    .spaceToViewTop(self.view, 64)
    .spaceToViewRight(self.view, 0)
    .spaceToViewBottom(self.view, 0);
    
    [self addData];
}

-(NSArray *)createDataArrayCount:(NSInteger)count
{
    NSArray *icons = @[
                       @"icon0.jpg",
                       @"icon1.jpg",
                       @"icon2.jpg",
                       @"icon3.jpg",
                       @"icon4.jpg",
                       @"pic0.jpg",
                       @"pic2.jpg",
                       ];
    NSArray *texts = @[
                       
                       @"在iOS设备中使用BLE时",
                       @"Core Bluetooth框架",
                       @"考虑到其它形式的无线通信也需要使用无线电，因此开发程序时应该尽量少使用无线电。另外，这对于设备电池的寿命及程序的性能也有所帮助。以此为出发点，我们将介绍一些使用BLE时的最佳实践，希望有所帮助。",
                       
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。下面我们将介绍一些Central端的最佳实践。",
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。",
                       ];
    
    NSArray *dates = @[
                       @"11:23",
                       @"星期二 11:23",
                       @"2017-08-12 11:23",
                       ];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        int dateIndex = arc4random_uniform((int)dates.count);
        int titleIndex = arc4random_uniform((int)texts.count);
        int detailIndex = arc4random_uniform((int)texts.count);
        int imgIndex = arc4random_uniform((int)icons.count);
        
        ExampleModel11 *model = [ExampleModel11 new];
        model.date = dates[dateIndex];
        model.title = texts[titleIndex];
        
        if (arc4random_uniform(100) < 50) {
            model.detail = texts[detailIndex];
        }
        
        if (arc4random_uniform(100) < 50) {
            model.image = icons[imgIndex];
        }
        
        
        [arr addObject:model];
    }
    
    return arr;
}

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView11 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView11 new];
    }
    return _exampleView;
}

-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

@end
