//
//  ExampleView1.m
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/17.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import "ExampleView1.h"

@interface ExampleView1 ()
@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) UIView *v2;
@property (nonatomic, strong) UIView *v3;
@end

@implementation ExampleView1

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
    self.backgroundColor = [UIColor blackColor];
    
    [self lgb_AddSubviews:@[
                            self.v1,
                            self.v2,
                            self.v3]];
    
    self.v1.lgb_Layout
    .spaceToViewLeft(self, 0)
    .spaceToViewTop(self, 0)
    .widthRatioToView(self, 0.7)
    .spaceToViewBottom(self, 0);

    self.v2.lgb_Layout
    .spaceToViewLeft(self.v1, 0)
    .alignToViewTop(self, 0)
    .spaceToViewRight(self, 0)
    .heightEqualToWidth(1.0);//高等于宽，即使self的高等于0，也可以看到v2，设置self.clipsToBounds = YES后就看不到了
    
    self.v3.lgb_Layout
    .alignToViewLeft(self.v2, 0)
    .spaceToViewTop(self.v2, 0)
    .spaceToViewRight(self, 0)
    .spaceToViewBottom(self, 0);
}
#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UIView *)v1
{
    if (_v1 == nil) {
        _v1 = [UIView new];
        _v1.backgroundColor = [UIColor blueColor];
    }
    return _v1;
}

-(UIView *)v2
{
    if (_v2 == nil) {
        _v2 = [UIView new];
        _v2.backgroundColor = [UIColor greenColor];
    }
    return _v2;
}

-(UIView *)v3
{
    if (_v3 == nil) {
        _v3 = [UIView new];
        _v3.backgroundColor = [UIColor clearColor];
    }
    return _v3;
}
@end
