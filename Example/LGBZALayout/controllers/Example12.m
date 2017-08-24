//
//  Example12.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/23.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example12.h"

@interface Example12 ()

@end

@implementation Example12

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

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor redColor];
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor greenColor];
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor blueColor];
    
    [v1 addSubview:v2];
    
    [v2 addSubview:v3];
    
    [self.view addSubview:v1];
    
    v1.lgb_Layout
    .spaceToViewLeft(self.view, 50)
    .spaceToViewTop(self.view, 80)
    .spaceToViewRight(self.view, 50)
    .alignToViewBottom(v2, 0);
    
    v2.lgb_Layout
    .spaceToViewLeft(v1, 10)
    .spaceToViewTop(v1, 10)
    .spaceToViewRight(v1, 10)
    .alignToViewBottom(v3, 10);
    
    v3.lgb_Layout
    .spaceToViewLeft(v2, 10)
    .spaceToViewTop(v2, 10)
    .spaceToViewRight(v2, 10)
    .isHeight(60);
    
    v1.tag = 1001;
    v2.tag = 1002;
    v3.tag = 1003;
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
