//
//  Example6.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/18.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example6.h"
#import "ExampleView6.h"

@interface Example6 ()
@property (nonatomic, strong) ExampleView6 *exampleView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Example6

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
    NSArray *data = @[
                      
                      @"在iOS设备中使用BLE时，无论是将其作为central端还是peripheral端，其在通信时都会使用设备自身的无线电来发送信号。",
                      @"Core Bluetooth框架让程序的大部分Central端交互变得透明。",
                      @"考虑到其它形式的无线通信也需要使用无线电，因此开发程序时应该尽量少使用无线电。另外，这对于设备电池的寿命及程序的性能也有所帮助。以此为出发点，我们将介绍一些使用BLE时的最佳实践，希望有所帮助。",
                      
                      @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。下面我们将介绍一些Central端的最佳实践。",
                      @"Core Bluetooth框架让程序的大部分Central端交互变得透明。即程序能够控制且有责任实现大部分Central端的操作，如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。如设备搜索及连接，解析并与远程peripheral数据交互。",
                      ];
    
    NSString *constStr = @"最近在项目迭代版本时被拒，被拒描述Guideline 4.3 - Design - Spam问题，其实在被拒版本之前一个礼拜，本人同样提交了一个版本，那个版本已经审核通过，在刚刚审核通过后，因为项目因业务需求，新增一点需求，又发布了这个版本，结果被拒，很是纳闷，首先本项目已经上架有两年多了，一直在维护，迭代版本（妥妥的），其次是被拒版本前还发了一个版本（同样妥妥的），几乎在一个礼拜之内发生的，其结果截然相反 针对这个问题，我第一时间想到，难道是项目版本迭代（相邻两个版本）间隔时间太短了？我这面是上一个版本刚审核通过，就提交了被拒的这个版本，很快就被打回Guideline 4.3 - Design - Spam问题，所以这个时间也可能是一个因素，大家拿捏好这个度 查询了一下苹果审核指南，针对问题4.3是功能或者应用程序重复出现在App Store";
    
    for (int i = 0; i < 10; i++) {
        NSString *str = [constStr substringToIndex:arc4random_uniform(constStr.length)];//data[arc4random_uniform(4)];
        
        [self.data addObject:str];
    }
    
    [self.exampleView setupData:self.data];
    
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.exampleView];
    
    self.exampleView.frame = self.view.bounds;
    
    [self addData];
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView6 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView6 new];
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
