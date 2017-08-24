//
//  LGBMainView.h
//  LGBZALayout
//
//  Created by mac_256 on 2017/8/16.
//  Copyright © 2017年 lgb789@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGBMainView;

@protocol LGBMainViewDelegate <NSObject>

-(void)mainView:(LGBMainView *)mainView didSelectdRow:(NSInteger)row;

@end

@interface LGBMainView : UIView

@property (nonatomic, weak) id<LGBMainViewDelegate> delegate;

-(void)setupData:(NSArray *)data;

@end
