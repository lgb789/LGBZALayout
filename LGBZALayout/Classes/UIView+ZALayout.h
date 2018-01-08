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

@property (nonatomic, copy) BViewValue spaceToViewDown;

@property (nonatomic, copy) BViewValue alignToViewLeft;

@property (nonatomic, copy) BViewValue alignToViewRight;

@property (nonatomic, copy) BViewValue alignToViewTop;

@property (nonatomic, copy) BViewValue alignToViewBottom;

@property (nonatomic, copy) BViewValue alignToViewDown;

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

//constant
@property (nonatomic, copy) BView spaceToViewLeft_0p;
@property (nonatomic, copy) BView spaceToViewLeft_5p;
@property (nonatomic, copy) BView spaceToViewLeft_8p;
@property (nonatomic, copy) BView spaceToViewLeft_10p;
@property (nonatomic, copy) BView spaceToViewLeft_15p;

@property (nonatomic, copy) BView spaceToViewTop_0p;
@property (nonatomic, copy) BView spaceToViewTop_5p;
@property (nonatomic, copy) BView spaceToViewTop_8p;
@property (nonatomic, copy) BView spaceToViewTop_10p;
@property (nonatomic, copy) BView spaceToViewTop_15p;

@property (nonatomic, copy) BView spaceToViewRight_0p;
@property (nonatomic, copy) BView spaceToViewRight_5p;
@property (nonatomic, copy) BView spaceToViewRight_8p;
@property (nonatomic, copy) BView spaceToViewRight_10p;
@property (nonatomic, copy) BView spaceToViewRight_15p;

@property (nonatomic, copy) BView spaceToViewBottom_0p;
@property (nonatomic, copy) BView spaceToViewBottom_5p;
@property (nonatomic, copy) BView spaceToViewBottom_8p;
@property (nonatomic, copy) BView spaceToViewBottom_10p;
@property (nonatomic, copy) BView spaceToViewBottom_15p;

@property (nonatomic, copy) BView spaceToViewDown_0p;
@property (nonatomic, copy) BView spaceToViewDown_5p;
@property (nonatomic, copy) BView spaceToViewDown_8p;
@property (nonatomic, copy) BView spaceToViewDown_10p;
@property (nonatomic, copy) BView spaceToViewDown_15p;

@property (nonatomic, copy) BView alignToViewLeft_0p;
@property (nonatomic, copy) BView alignToViewLeft_5p;
@property (nonatomic, copy) BView alignToViewLeft_8p;
@property (nonatomic, copy) BView alignToViewLeft_10p;
@property (nonatomic, copy) BView alignToViewLeft_15p;

@property (nonatomic, copy) BView alignToViewTop_0p;
@property (nonatomic, copy) BView alignToViewTop_5p;
@property (nonatomic, copy) BView alignToViewTop_8p;
@property (nonatomic, copy) BView alignToViewTop_10p;
@property (nonatomic, copy) BView alignToViewTop_15p;

@property (nonatomic, copy) BView alignToViewRight_0p;
@property (nonatomic, copy) BView alignToViewRight_5p;
@property (nonatomic, copy) BView alignToViewRight_8p;
@property (nonatomic, copy) BView alignToViewRight_10p;
@property (nonatomic, copy) BView alignToViewRight_15p;

@property (nonatomic, copy) BView alignToViewBottom_0p;
@property (nonatomic, copy) BView alignToViewBottom_5p;
@property (nonatomic, copy) BView alignToViewBottom_8p;
@property (nonatomic, copy) BView alignToViewBottom_10p;
@property (nonatomic, copy) BView alignToViewBottom_15p;

@property (nonatomic, copy) BView alignToViewDown_0p;
@property (nonatomic, copy) BView alignToViewDown_5p;
@property (nonatomic, copy) BView alignToViewDown_8p;
@property (nonatomic, copy) BView alignToViewDown_10p;
@property (nonatomic, copy) BView alignToViewDown_15p;

-(void)updateLayout;

@end

@interface UIView (ZALayout)

-(void)lgb_AddSubviews:(NSArray *)subviews;

-(ZALayoutManager *)lgb_Layout;

-(CGFloat)lgb_getHeight;

-(CGFloat)lgb_getWidth;

-(CGFloat)lgb_heightFromView:(UIView *)fromView;

-(void)lgb_setWidthEqualForSubviews:(NSArray *)subviews;

@end
