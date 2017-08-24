//
//  Example7.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/21.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example7.h"
#import "ExampleModel7.h"
#import "ExampleView7.h"

@interface Example7 ()
@property (nonatomic, strong) ExampleView7 *exampleView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Example7

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
    NSArray *names = @[
                       @"name_01",
                       @"name_02",
                       @"name_03",
                       @"name_04",
                       ];
    NSArray *texts = @[
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。",
                       @"在iOS设备中使用BLE时，无论是将其作为central端还是peripheral端，其在通信时都会使用设备自身的无线电来发送信号。",
                       @"考虑到其它形式的无线通信也需要使用无线电，因此开发程序时应该尽量少使用无线电。另外，这对于设备电池的寿命及程序的性能也有所帮助。以此为出发点，我们将介绍一些使用BLE时的最佳实践，希望有所帮助。",
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。",
                       @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。下面我们将介绍一些Central端的最佳实践。",
                       
                       ];
    NSArray *icons = @[
                       @"icon0.jpg",
                       @"icon1.jpg",
                       @"icon2.jpg",
                       @"icon3.jpg",
                       @"icon4.jpg",
                       ];
    
    NSArray *images = @[
                        @"pic0.jpg",
                        @"pic1.jpg",
                        @"pic2.jpg",
                        @"pic3.jpg",
                        @"pic4.jpg",
                        ];
    
    NSMutableArray *data = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        int nameIndex = arc4random_uniform((int)names.count);
        int iconIndex = arc4random_uniform((int)icons.count);
        int textIndex = arc4random_uniform((int)texts.count);
        int imageIndex = arc4random_uniform((int)images.count);
        ExampleModel7 *model = [ExampleModel7 new];
        model.name = names[nameIndex];
        model.photo = icons[iconIndex];
        model.text = texts[textIndex];
        if (arc4random_uniform(100) < 80) {
            model.image = images[imageIndex];
        }
        
        [data addObject:model];
    }
    return data;
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView7 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView7 new];
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
