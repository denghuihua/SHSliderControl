//
//  SHSliderControl.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/23.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHSliderControl.h"

#define TOP_OFFSET 20
#define BOTTOM_OFFSET 20
#define LFET_OFFSET 20
#define RIGHT_OFFSET 20
#define SLIDER_WITTH 1 // 滑杆宽度
#define PROGRESS_CLOLOR  [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0f]  //滑杆颜色
#define DefaultCircleDiameter 5

@interface SHSliderControl()
@property(nonatomic,strong)NSArray *titles;

@end


@implementation SHSliderControl

-(id)initWithFrame:(CGRect)frame titles:(NSArray<NSString *>*)titles
{
    if (self = [super initWithFrame:frame]) {
        self.titles = titles;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, PROGRESS_CLOLOR.CGColor);
    CGContextSetLineWidth(context, 2);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,rect.size.width/2.0 ,TOP_OFFSET);
    CGContextAddLineToPoint(context, rect.size.width/2.0 , rect.size.height - BOTTOM_OFFSET);
    CGContextStrokePath(context);
    
//    CGContextRestoreGState(context);
    CGContextSaveGState(context);
    
    CGPoint centerPoint;
    
    for (int i = 0; i < self.titles.count; i++) {
        centerPoint = [self getCenterPointForIndex:i];
        CGContextSetFillColorWithColor(context, PROGRESS_CLOLOR.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(rect.size.width/2.0 -DefaultCircleDiameter/2.0, centerPoint.y-DefaultCircleDiameter/2.0, DefaultCircleDiameter, DefaultCircleDiameter));
        
        //小圆圈左半部分圆弧
        CGContextSetStrokeColorWithColor(context, PROGRESS_CLOLOR.CGColor);
        CGContextSetLineWidth(context, .4);
        CGContextAddArc(context,rect.size.width - 30.f, centerPoint.y -2.0 ,7.0 , (-90+18)*M_PI/180, (165 - 90)*M_PI/180, 0);
        CGContextDrawPath(context, kCGPathStroke);
        
        //小圆圈右半部分圆弧
        CGContextSetStrokeColorWithColor(context, PROGRESS_CLOLOR.CGColor);
        CGContextSetLineWidth(context, .4);
        CGContextAddArc(context,rect.size.width - 30.f, centerPoint.y -2.0 ,7.0 , (18)*M_PI/180, (165 )*M_PI/180, 0);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

//计算存在疑问？ 为啥减20
-(CGPoint)getCenterPointForIndex:(int) i{
    CGPoint point = CGPointMake(self.frame.size.width/2,i/(float)(self.titles.count-1) * (self.frame.size.height-BOTTOM_OFFSET-TOP_OFFSET - DefaultCircleDiameter) + TOP_OFFSET + DefaultCircleDiameter/2);
    NSLog(@"getCenterPointForIndex:%f,%f",point.x,point.y);
    return point;
}
@end
