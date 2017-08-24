//
//  Example9.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/21.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example9.h"

@interface Example9 ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *view0;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@end

@implementation Example9

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
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.view0];
    [self.scrollView addSubview:self.view1];
    [self.scrollView addSubview:self.view2];
    [self.scrollView addSubview:self.view3];
    
    self.scrollView.lgb_Layout
    .spaceToViewLeft(self.view, 0)
    .centerEqualToViewY(self.view, 0)
    .spaceToViewRight(self.view, 0)
    .heightRatioToView(self.view, 0.4)
    .contentAlignToViewRight(self.view3, 10);
    
    self.view0.lgb_Layout
    .spaceToViewLeft(self.scrollView, 10)
    .centerEqualToViewY(self.scrollView, 0)
    .widthRatioToView(self.scrollView, 0.3)
    .heightRatioToView(self.scrollView, 0.2);
    
    self.view1.lgb_Layout
    .spaceToViewLeft(self.view0, 10)
    .centerEqualToViewY(self.scrollView, 10)
    .widthRatioToView(self.scrollView, 0.5)
    .heightRatioToView(self.scrollView, 0.4);
    
    self.view2.lgb_Layout
    .spaceToViewLeft(self.view1, 10)
    .centerEqualToViewY(self.scrollView, 0)
    .widthRatioToView(self.scrollView, 0.5)
    .heightRatioToView(self.scrollView, 0.6);
    
    self.view3.lgb_Layout
    .spaceToViewLeft(self.view2, 10)
    .centerEqualToViewY(self.scrollView, -10)
    .widthRatioToView(self.scrollView, 0.5)
    .heightRatioToView(self.scrollView, 0.6);
    
    
    ZA_showDebugBorderForViewColor(self.scrollView, [UIColor redColor]);
    
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [UIScrollView new];
    }
    return _scrollView;
}

-(UIView *)view0
{
    if (_view0 == nil) {
        _view0 = [UIView new];
        _view0.backgroundColor = [UIColor redColor];
    }
    return _view0;
}

-(UIView *)view1
{
    if (_view1 == nil) {
        _view1 = [UIView new];
        _view1.backgroundColor = [UIColor grayColor];
    }
    return _view1;
}

-(UIView *)view2
{
    if (_view2 == nil) {
        _view2 = [UIView new];
        _view2.backgroundColor = [UIColor purpleColor];
    }
    return _view2;
}

-(UIView *)view3
{
    if (_view3 == nil) {
        _view3 = [UIView new];
        _view3.backgroundColor = [UIColor greenColor];
    }
    return _view3;
}
@end
