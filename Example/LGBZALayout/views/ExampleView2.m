//
//  ExampleView2.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/18.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView2.h"

@interface ExampleView2 ()

@property (nonatomic, strong) UIView *v1;
@end

@implementation ExampleView2

#pragma mark ------------------------------------------------- 初始化 ---------------------------------------------------
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------
-(void)setupViews
{
    self.backgroundColor = [UIColor greenColor];
    
    [self lgb_AddSubviews:@[self.lb, self.v1]];
    
    self.lb.lgb_Layout
    .spaceToViewLeft(self, 0)
    .spaceToViewRight(self, 0)
    .spaceToViewTop(self, 20)
    .isHeight(0);
    
    self.v1.lgb_Layout
    .alignToViewLeft(self.lb, 0)
    .alignToViewRight(self.lb, 0)
    .spaceToViewTop(self.lb, 0)
    .alignToViewBottom(self, -20);
    
    ZA_showDebugBorderForViewColor(self.v1, [UIColor redColor]);
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UILabel *)lb
{
    if (_lb == nil) {
        _lb = [UILabel new];
        _lb.backgroundColor = [UIColor purpleColor];
        _lb.numberOfLines = 0;
        
        //_lb.text = @"电风扇等方法上独领风骚的快乐放假阿拉斯加分大煞风景是多福多寿份大煞风景方式德弗里斯";
    }
    return _lb;
}

-(UIView *)v1
{
    if (_v1 == nil) {
        _v1 = [UIView new];
        _v1.backgroundColor = [UIColor blueColor];
    }
    return _v1;
}

@end
