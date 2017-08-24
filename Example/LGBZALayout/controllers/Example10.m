//
//  Example10.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/21.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example10.h"
#import "ExampleView10.h"
#import "ExampleModel10.h"

@interface Example10 ()
@property (nonatomic, strong) ExampleView10 *exampleView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Example10

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
    NSArray *data = [self createDataCount:10];
    
    [self.data addObjectsFromArray:data];
    
    [self.exampleView setupData:self.data];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];
    
    [self.view addSubview:self.exampleView];
    
    self.exampleView.lgb_Layout
    .spaceToViewLeft(self.view, 0)
    .spaceToViewTop(self.view, 0)
    .spaceToViewRight(self.view, 0)
    .spaceToViewBottom(self.view, 0);
    
    [self addData];
}

-(NSArray *)createDataCount:(NSInteger)count
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
                       
                       @"在iOS设备中使用BLE时，无论是将其作为central端还是peripheral端，其在通信时都会使用设备自身的无线电来发送信号。",
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。",
                       @"考虑到其它形式的无线通信也需要使用无线电，因此开发程序时应该尽量少使用无线电。另外，这对于设备电池的寿命及程序的性能也有所帮助。以此为出发点，我们将介绍一些使用BLE时的最佳实践，希望有所帮助。",
                       
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。下面我们将介绍一些Central端的最佳实践。",
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。",
                       ];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        int iconIndex1 = arc4random_uniform((int)icons.count);
        int iconIndex2 = arc4random_uniform((int)icons.count);
        int iconIndex3 = arc4random_uniform((int)icons.count);
        int textIndex = arc4random_uniform((int)texts.count);
        ExampleModel10 *model = [ExampleModel10 new];
        model.txt = texts[textIndex];
        model.img = icons[iconIndex1];
        if (arc4random_uniform(100) < 30) {
            model.imgs = @[icons[iconIndex1],icons[iconIndex2],icons[iconIndex3]];
        }
        [array addObject:model];
    }
    return array;
}

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView10 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView10 new];
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
