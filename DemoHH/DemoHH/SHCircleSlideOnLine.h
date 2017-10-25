//
//  SHCircleSlideOnLine.h
//  DemoHH
//
//  Created by huihuadeng on 2017/10/24.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHCircleSlideOnLine : UIButton
{
    UIColor *_shapeColor;
}

@property(nonatomic,strong)UIColor *shapeColor;

-(id)initWithCircleStartX:(CGFloat)circle_start_x endX:(CGFloat)circle_end_x;

-(void)animationFromRightToLeft;
-(void)animationFromLeftToRight;

@end
