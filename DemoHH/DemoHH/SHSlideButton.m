//
//  SHSlideButton.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/24.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHSlideButton.h"
#define PROGRESS_CLOLOR  [UIColor colorWithRed:255/255.0 green:155/255.0 blue:155/255.0 alpha:1.0f]  //滑杆颜色
#define DefaultCircleDiameter 10

@implementation SHSlideButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, PROGRESS_CLOLOR.CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(rect.size.width/2.0 -DefaultCircleDiameter/2.0, rect.size.height/2.0-DefaultCircleDiameter/2.0, DefaultCircleDiameter, DefaultCircleDiameter));
}

@end
