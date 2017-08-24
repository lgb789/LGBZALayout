//
//  UIView+ZALayout.h
//  Pods
//
//  Created by mac_256 on 2017/8/17.
//
//

#import <UIKit/UIKit.h>

@class ZALayoutManager;

typedef ZALayoutManager* (^BViewValue)(UIView *refView, CGFloat value);
typedef ZALayoutManager* (^BValue)(CGFloat value);
typedef ZALayoutManager* (^BView)(UIView *refView);
typedef ZALayoutManager* (^BViewArrayValue)(NSArray *viewArray, CGFloat value);

@interface ZALayoutManager : NSObject

@property (nonatomic, copy) BViewValue spaceToViewLeft;

@property (nonatomic, copy) BViewValue spaceToViewRight;

@property (nonatomic, copy) BViewValue spaceToViewTop;

@property (nonatomic, copy) BViewValue spaceToViewBottom;

@property (nonatomic, copy) BViewValue alignToViewLeft;

@property (nonatomic, copy) BViewValue alignToViewRight;

@property (nonatomic, copy) BViewValue alignToViewTop;

@property (nonatomic, copy) BViewValue alignToViewBottom;

@property (nonatomic, copy) BValue isX;

@property (nonatomic, copy) BValue isY;

@property (nonatomic, copy) BValue isWidth;

@property (nonatomic, copy) BValue isHeight;

@property (nonatomic, copy) BValue isMaxWidth;

@property (nonatomic, copy) BValue isMaxHeight;

@property (nonatomic, copy) BViewValue centerEqualToViewX;

@property (nonatomic, copy) BViewValue centerEqualToViewY;

@property (nonatomic, copy) BView centerEqualToView;

@property (nonatomic, copy) BViewValue widthRatioToView;

@property (nonatomic, copy) BViewValue heightRatioToView;

@property (nonatomic, copy) BValue widthEqualToHeight;

@property (nonatomic, copy) BValue heightEqualToWidth;

@property (nonatomic, copy) BViewValue contentAlignToViewBottom;

@property (nonatomic, copy) BViewValue contentAlignToViewRight;

@property (nonatomic, copy) BViewArrayValue alignToViewArrayBottom;

-(void)updateLayout;

@end

@interface UIView (ZALayout)

-(void)lgb_AddSubviews:(NSArray *)subviews;

-(ZALayoutManager *)lgb_Layout;

-(CGFloat)lgb_getHeight;

-(CGFloat)lgb_getWidth;

-(CGFloat)heightFromView:(UIView *)fromView;

-(void)lgb_setWidthEqualForSubviews:(NSArray *)subviews;

@end
