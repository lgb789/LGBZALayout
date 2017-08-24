//
//  UIView+ZAFlame.h
//  Pods
//
//  Created by mac_256 on 2017/8/16.
//
//

#import <UIKit/UIKit.h>

@interface UIView (ZAFlame)

-(CGFloat)height;

-(void)setHeight:(CGFloat)height;

-(CGFloat)width;

-(void)setWidth:(CGFloat)width;

-(CGFloat)x;

-(void)setX:(CGFloat)x;

-(CGFloat)y;

-(void)setY:(CGFloat)y;

-(CGFloat)left;

-(void)setLeft:(CGFloat)left;

-(CGFloat)right;

-(void)setRight:(CGFloat)right;

-(CGFloat)top;

-(void)setTop:(CGFloat)top;

-(CGFloat)bottom;

-(void)setBottom:(CGFloat)bottom;

-(CGSize)size;

-(void)setSize:(CGSize)size;

-(void)sizeEqualToView:(UIView *)view;

-(CGPoint)origin;

-(void)setOrigin:(CGPoint)origin;

-(void)originEqualToView:(UIView *)view;

-(CGFloat)centerX;

-(void)setCenterX:(CGFloat)x;

-(CGFloat)centerY;

-(void)setCenterY:(CGFloat)y;

-(void)centerXEqualToView:(UIView *)view offset:(CGFloat)offset;

-(void)centerYEqualToView:(UIView *)view offset:(CGFloat)offset;

-(void)centerEqualToView:(UIView *)view;

-(void)topAlignToView:(UIView *)view offset:(CGFloat)offset;

-(void)leftAlignToView:(UIView *)view offset:(CGFloat)offset;

-(void)bottomAlignToView:(UIView *)view offset:(CGFloat)offset;

-(void)rightAlignToView:(UIView *)view offset:(CGFloat)offset;

-(void)topSpace:(CGFloat)space toView:(UIView *)view;

-(void)leftSpace:(CGFloat)space toView:(UIView *)view;

-(void)bottomSpace:(CGFloat)space toView:(UIView *)view;

-(void)rightSpace:(CGFloat)space toView:(UIView *)view;

-(UIView *)topSuperView;

@end
