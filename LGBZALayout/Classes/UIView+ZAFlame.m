//
//  UIView+ZAFlame.m
//  Pods
//
//  Created by mac_256 on 2017/8/16.
//
//

#import "UIView+ZAFlame.h"

@implementation UIView (ZAFlame)

/******************************* frame *******************************/
-(CGFloat)height
{
    return CGRectGetHeight(self.bounds);
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)width
{
    return CGRectGetWidth(self.bounds);
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)x
{
    return CGRectGetMinX(self.frame);
}

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)y
{
    return CGRectGetMinY(self.frame);
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)left
{
    return self.x;
}

-(void)setLeft:(CGFloat)left
{
    self.x = left;
}

-(CGFloat)right
{
    return self.x + self.width;
}

-(void)setRight:(CGFloat)right
{
    self.width = right - self.x;
}

-(CGFloat)top
{
    return self.y;
}

-(void)setTop:(CGFloat)top
{
    self.y = top;
}

-(CGFloat)bottom
{
    return self.y + self.height;
}

-(void)setBottom:(CGFloat)bottom
{
    self.height = bottom - self.y;
}

-(CGSize)size
{
    return self.frame.size;
}

-(void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

-(void)sizeEqualToView:(UIView *)view
{
    self.size = view.size;
}

-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);

}

-(void)originEqualToView:(UIView *)view
{
    self.origin = view.origin;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)x
{
    self.center = CGPointMake(x, self.center.y);
}

-(CGFloat)centerY
{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)y
{
    self.center = CGPointMake(self.center.x, y);
}

/******************************* center *******************************/
-(void)centerXEqualToView:(UIView *)view offset:(CGFloat)offset
{
    self.centerX = [self handleConvertPoint:view.center fromView:view].x + offset;
}

-(void)centerYEqualToView:(UIView *)view offset:(CGFloat)offset
{
    self.centerY = [self handleConvertPoint:view.center fromView:view].y + offset;
}

-(void)centerEqualToView:(UIView *)view
{
    self.center = [self handleConvertPoint:view.center fromView:view];
}

/******************************* align *******************************/
-(void)topAlignToView:(UIView *)view offset:(CGFloat)offset
{
    self.top = [self handleConvertPoint:view.origin fromView:view].y + offset;
}

-(void)leftAlignToView:(UIView *)view offset:(CGFloat)offset
{
    self.left = [self handleConvertPoint:view.origin fromView:view].x + offset;
}

-(void)bottomAlignToView:(UIView *)view offset:(CGFloat)offset
{
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    
    self.bottom = origin.y + view.height + offset;
}

-(void)rightAlignToView:(UIView *)view offset:(CGFloat)offset
{
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    
    self.right = origin.x + view.width + offset;
}

/******************************* space *******************************/
-(void)topSpace:(CGFloat)space toView:(UIView *)view
{
    if (self.superview == view) {
        [self topAlignToView:view offset:space];
        return;
    }
    
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    self.top = origin.y + view.height + space;
}

-(void)leftSpace:(CGFloat)space toView:(UIView *)view
{
    if (self.superview == view) {
        [self leftAlignToView:view offset:space];
        return;
    }
    
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    self.left = origin.x + view.width + space;
}

-(void)bottomSpace:(CGFloat)space toView:(UIView *)view
{
    if (self.superview == view) {
        [self bottomAlignToView:view offset:-space];
        return;
    }
    
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    self.bottom = origin.y - space;
}

-(void)rightSpace:(CGFloat)space toView:(UIView *)view
{
    if (self.superview == view) {
        [self rightAlignToView:view offset:-space];
        return;
    }
    
    CGPoint origin = [self handleConvertPoint:view.origin fromView:view];
    self.right = origin.x - space;
}

/******************************* common *******************************/
-(CGPoint)handleConvertPoint:(CGPoint)point fromView:(UIView *)view
{
    if (self.superview == view) {
        return CGPointZero;
    }
    
    UIView *superView = view.superview ? view.superview : view;
    UIView *topView = self.topSuperView;
    CGPoint p = [superView convertPoint:point toView:topView];
    p = [topView convertPoint:p toView:self.superview];
    
    return p;
}

-(UIView *)topSuperView
{
    UIView *superView = self.superview;
    if (superView == nil) {
        return self;
    }
    
    while (superView.superview) {
        superView = superView.superview;
    }
    
    return superView;
}

@end
