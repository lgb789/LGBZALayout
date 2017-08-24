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
@property (nonatomic, copy) BView spaceToViewLeft_0;
@property (nonatomic, copy) BView spaceToViewLeft_5;
@property (nonatomic, copy) BView spaceToViewLeft_8;
@property (nonatomic, copy) BView spaceToViewLeft_10;
@property (nonatomic, copy) BView spaceToViewLeft_15;

@property (nonatomic, copy) BView spaceToViewTop_0;
@property (nonatomic, copy) BView spaceToViewTop_5;
@property (nonatomic, copy) BView spaceToViewTop_8;
@property (nonatomic, copy) BView spaceToViewTop_10;
@property (nonatomic, copy) BView spaceToViewTop_15;

@property (nonatomic, copy) BView spaceToViewRight_0;
@property (nonatomic, copy) BView spaceToViewRight_5;
@property (nonatomic, copy) BView spaceToViewRight_8;
@property (nonatomic, copy) BView spaceToViewRight_10;
@property (nonatomic, copy) BView spaceToViewRight_15;

@property (nonatomic, copy) BView spaceToViewBottom_0;
@property (nonatomic, copy) BView spaceToViewBottom_5;
@property (nonatomic, copy) BView spaceToViewBottom_8;
@property (nonatomic, copy) BView spaceToViewBottom_10;
@property (nonatomic, copy) BView spaceToViewBottom_15;

@property (nonatomic, copy) BView spaceToViewDown_0;
@property (nonatomic, copy) BView spaceToViewDown_5;
@property (nonatomic, copy) BView spaceToViewDown_8;
@property (nonatomic, copy) BView spaceToViewDown_10;
@property (nonatomic, copy) BView spaceToViewDown_15;

@property (nonatomic, copy) BView alignToViewLeft_0;
@property (nonatomic, copy) BView alignToViewLeft_5;
@property (nonatomic, copy) BView alignToViewLeft_8;
@property (nonatomic, copy) BView alignToViewLeft_10;
@property (nonatomic, copy) BView alignToViewLeft_15;

@property (nonatomic, copy) BView alignToViewTop_0;
@property (nonatomic, copy) BView alignToViewTop_5;
@property (nonatomic, copy) BView alignToViewTop_8;
@property (nonatomic, copy) BView alignToViewTop_10;
@property (nonatomic, copy) BView alignToViewTop_15;

@property (nonatomic, copy) BView alignToViewRight_0;
@property (nonatomic, copy) BView alignToViewRight_5;
@property (nonatomic, copy) BView alignToViewRight_8;
@property (nonatomic, copy) BView alignToViewRight_10;
@property (nonatomic, copy) BView alignToViewRight_15;

@property (nonatomic, copy) BView alignToViewBottom_0;
@property (nonatomic, copy) BView alignToViewBottom_5;
@property (nonatomic, copy) BView alignToViewBottom_8;
@property (nonatomic, copy) BView alignToViewBottom_10;
@property (nonatomic, copy) BView alignToViewBottom_15;

@property (nonatomic, copy) BView alignToViewDown_0;
@property (nonatomic, copy) BView alignToViewDown_5;
@property (nonatomic, copy) BView alignToViewDown_8;
@property (nonatomic, copy) BView alignToViewDown_10;
@property (nonatomic, copy) BView alignToViewDown_15;

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
