//
//  Example1.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/17.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "Example1.h"
#import "ExampleView1.h"

@interface Example1 ()
@property (nonatomic, strong) ExampleView1 *exampleView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat heightRatio;
@end

@implementation Example1

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
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------
-(void)startAnimation
{
    if (self.timer) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateViews) userInfo:nil repeats:NO]; //NO 没有循环
    [self.timer fire];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(startAnimation)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.exampleView];
    
//    self.exampleView.frame = CGRectMake(100, 100, 100, 200);
    
    self.heightRatio = 0.4;
    
    self.exampleView.lgb_Layout
    .centerEqualToViewX(self.view, 0)
    .spaceToViewTop(self.view, 80)
    .widthRatioToView(self.view, 0.4)
    .heightRatioToView(self.view, self.heightRatio);
    
    //self.exampleView.clipsToBounds = YES;
}

-(void)animateViews
{
    self.heightRatio = self.heightRatio == 0.4 ? 0 : 0.4;
    
    self.exampleView.lgb_Layout
    .heightRatioToView(self.view, self.heightRatio);
    
    [UIView animateWithDuration:1 animations:^{
        [self.exampleView.lgb_Layout updateLayout];
    }];
}

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(ExampleView1 *)exampleView
{
    if (_exampleView == nil) {
        _exampleView = [ExampleView1 new];
    }
    return _exampleView;
}
@end
