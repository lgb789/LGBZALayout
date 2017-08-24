//
//  LGBZAFrameTestController.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/16.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example0.h"

@interface Example0 ()

@end

@implementation Example0

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
    v1.frame = CGRectMake(60, 70, 100, 100);
    v1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:v1];
    
    ZA_logFloat(v1.x);
    ZA_logFloat(v1.y);
    ZA_logFloat(v1.width);
    ZA_logFloat(v1.height);
    ZA_logFloat(v1.top);
    ZA_logFloat(v1.left);
    ZA_logFloat(v1.bottom);
    ZA_logFloat(v1.right);
    ZA_logFloat(v1.centerX);
    ZA_logFloat(v1.centerY);
    ZA_logSize(v1.size);
    ZA_logPoint(v1.center);
    
    v1.x = 20;
    v1.y = 100;
    v1.width = 50;
    v1.height = 80;
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v2];
    
    [v2 leftSpace:50 toView:v1];
    [v2 topAlignToView:v1 offset:0];
    [v2 bottomAlignToView:v1 offset:10];
    [v2 rightSpace:100 toView:self.view];
    
    ZA_logFrame(v2);
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:v3];
    
    [v3 leftSpace:10 toView:self.view];
    [v3 topSpace:50 toView:v1];
    [v3 rightAlignToView:v2 offset:10];
    [v3 bottomSpace:200 toView:self.view];
    
    
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
