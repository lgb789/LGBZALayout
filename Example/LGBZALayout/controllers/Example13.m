//
//  Example13.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/24.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example13.h"

@interface Example13 ()

@end

@implementation Example13

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
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:v1];
    
    v1.lgb_Layout
    .spaceToViewLeft_15(self.view)
    .spaceToViewTop_15(self.view)
    .spaceToViewRight_15(self.view)
    .spaceToViewDown_15(self.view);
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor redColor];
    
    [v1 addSubview:v2];
    
    v2.lgb_Layout
    .spaceToViewTop(v1, 100)
    .centerEqualToViewX(v1, 0)
    .isWidth(200)
    .isHeight(200);
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor blackColor];
    
    [v1 addSubview:v3];
    
    v3.lgb_Layout
    .alignToViewLeft_15(v2)
    .alignToViewTop_15(v2)
    .isWidth(50)
    .isHeight(100);
    
    UIView *v4 = [UIView new];
    v4.backgroundColor = [UIColor blueColor];
    
    [v1 addSubview:v4];
    
    v4.lgb_Layout
    .spaceToViewLeft_10(v3)
    .alignToViewTop_0(v3)
    .alignToViewRight_8(v2)
    .alignToViewBottom_15(v2);
    
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
