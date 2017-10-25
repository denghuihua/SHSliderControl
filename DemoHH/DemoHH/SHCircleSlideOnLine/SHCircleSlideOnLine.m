//
//  SHCircleSlideOnLine.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/24.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHCircleSlideOnLine.h"
#define LFET_OFFSET 0
#define RIGHT_OFFSET 0
#define LINE_WIDTH 1.5
#define DefaultCircleDiameter 5
#define DISTANCE_LINE_TO_CENTER 5

@interface SHCircleSlideOnLine()
{
    BOOL _is_slide_from_left_To_right;
    
}
@property(nonatomic,assign)CGFloat circle_x;
@property(nonatomic,assign)CGFloat animation_start_x;
@property(nonatomic,assign)CGFloat animation_end_x;
@property(nonatomic,strong)NSTimer *timer;
@end


@implementation SHCircleSlideOnLine

-(id)initWithCircleStartX:(CGFloat)circle_start_x endX:(CGFloat)circle_end_x
{
   if  (self = [super init])
   {
       self.animation_start_x = circle_start_x;
       self.animation_end_x = circle_end_x;
       self.circle_x = _animation_start_x;
       _is_slide_from_left_To_right = YES;
       [self addTarget:self action:@selector(butttonClicked:) forControlEvents:UIControlEventTouchUpInside];
   }
    return self;  
}


-(void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
  
    CGContextRef context = UIGraphicsGetCurrentContext();
  //非动画部分
    CGContextSetFillColorWithColor(context, self.shapeColor.CGColor);
    CGContextFillRect(context, CGRectMake(LFET_OFFSET,(rect.size.height - LINE_WIDTH)/2.0 - DISTANCE_LINE_TO_CENTER, self.animation_start_x - LFET_OFFSET, LINE_WIDTH));
    CGContextSaveGState(context);
    
    //源码为(context, CGRectMake(LEFT_OFFSET, rect.size.height-35, rect.size.width-RIGHT_OFFSET-LEFT_OFFSET, 10))
    CGContextFillRect(context, CGRectMake(self.animation_start_x + DefaultCircleDiameter,(rect.size.height - LINE_WIDTH)/2.0 - DISTANCE_LINE_TO_CENTER, rect.size.width - self.animation_start_x + DefaultCircleDiameter, LINE_WIDTH));
    CGContextSaveGState(context);
    
    //Draw Black Top Shadow  小圆圈的上半部分圆弧
    CGContextSetStrokeColorWithColor(context, self.shapeColor.CGColor);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextAddArc(context,self.animation_start_x + DefaultCircleDiameter/2.0,rect.size.height/2.0 - DISTANCE_LINE_TO_CENTER,(180 - 8)*3.14*(DefaultCircleDiameter - LINE_WIDTH)/2.0/360.0f,4*M_PI/180,176*M_PI/180,0);
    CGContextDrawPath(context,kCGPathStroke);
    
    //Draw Black Top Shadow  小圆圈的下半部分圆弧
    CGContextSetStrokeColorWithColor(context, self.shapeColor.CGColor);
    CGContextAddArc(context,self.animation_start_x + DefaultCircleDiameter/2.0,rect.size.height/2.0 - DISTANCE_LINE_TO_CENTER,(180 - 8)*3.14*(DefaultCircleDiameter - LINE_WIDTH)/2.0/360.0f,-4*M_PI/180,-176*M_PI/180,1);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextDrawPath(context,kCGPathStroke);
    
    //动画部分
    CGContextSetFillColorWithColor(context, self.shapeColor.CGColor);
    CGContextFillRect(context, CGRectMake(LFET_OFFSET,(rect.size.height - LINE_WIDTH)/2.0 + DISTANCE_LINE_TO_CENTER, self.circle_x - LFET_OFFSET, LINE_WIDTH));
    CGContextSaveGState(context);
    
    //源码为(context, CGRectMake(LEFT_OFFSET, rect.size.height-35, rect.size.width-RIGHT_OFFSET-LEFT_OFFSET, 10))
    CGContextFillRect(context, CGRectMake(self.circle_x + DefaultCircleDiameter,(rect.size.height - LINE_WIDTH)/2.0 + DISTANCE_LINE_TO_CENTER, rect.size.width - self.circle_x + DefaultCircleDiameter, LINE_WIDTH));
    CGContextSaveGState(context);
    
    //Draw Black Top Shadow  小圆圈的上半部分圆弧
    CGContextSetStrokeColorWithColor(context, self.shapeColor.CGColor);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextAddArc(context,self.circle_x + DefaultCircleDiameter/2.0,rect.size.height/2.0 + DISTANCE_LINE_TO_CENTER,(180 - 8)*3.14*(DefaultCircleDiameter - LINE_WIDTH)/2.0/360.0f,4*M_PI/180,176*M_PI/180,0);
    CGContextDrawPath(context,kCGPathStroke);
    
    //Draw Black Top Shadow  小圆圈的下半部分圆弧
    CGContextSetStrokeColorWithColor(context, self.shapeColor.CGColor);
    CGContextAddArc(context,self.circle_x + DefaultCircleDiameter/2.0,rect.size.height/2.0 + DISTANCE_LINE_TO_CENTER,(180 - 8)*3.14*(DefaultCircleDiameter - LINE_WIDTH)/2.0/360.0f,-4*M_PI/180,-176*M_PI/180,1);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextDrawPath(context,kCGPathStroke);
}

-(void)butttonClicked:(UIButton *)button
{
    if (_is_slide_from_left_To_right) {
        [self animationFromLeftToRight];
    }else
    {
        [self animationFromRightToLeft];
    }
//    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

-(void)timerAction:(NSTimer *)timer
{
    if (_is_slide_from_left_To_right) {
        if (self.circle_x > self.animation_start_x || self.circle_x == self.animation_start_x) {
            self.circle_x = self.circle_x + .5;
            if (self.circle_x == self.animation_end_x ||self.circle_x > self.animation_end_x) {
                _is_slide_from_left_To_right = NO;
                [self.timer invalidate];
                self.userInteractionEnabled = YES;
            }
        }    
    }else
    {
        if (self.circle_x < self.animation_end_x || self.circle_x == self.animation_end_x) {
            self.circle_x = self.circle_x - .5;
            if (self.circle_x == self.animation_start_x || self.circle_x < self.animation_start_x) {
                _is_slide_from_left_To_right = YES;
                self.userInteractionEnabled = YES;
                [self.timer invalidate];
            }
        }
    }
    [self setNeedsDisplay];   
}

-(void)animationFromRightToLeft
{
    self.userInteractionEnabled = NO;
    _is_slide_from_left_To_right = NO;
    [self.timer invalidate];
    self.circle_x = self.animation_end_x;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
} 

-(void)animationFromLeftToRight
{
    self.userInteractionEnabled = NO;
    _is_slide_from_left_To_right = YES;
    [self.timer invalidate];
    self.circle_x  = self.animation_start_x;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

-(void)setShapeColor:(UIColor *)shapeColor
{
    _shapeColor = shapeColor;
    [self setNeedsDisplay];
}

-(UIColor *)shapeColor
{
    if (!_shapeColor) {
        _shapeColor = [UIColor blackColor];
    }
    return _shapeColor;
}
@end
