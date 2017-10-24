//
//  SHSliderControl.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/23.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHSliderControl.h"
#import "SHSlideButton.h"

#define TOP_OFFSET 20
#define BOTTOM_OFFSET 20
#define LFET_OFFSET 20
#define RIGHT_OFFSET 20
#define SLIDER_WITTH 1 // 滑杆宽度

#define LABLE_WIDTH 10

#define PROGRESS_CLOLOR  [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0f]  //滑杆颜色
#define DefaultCircleDiameter 5

#define TITLE_LABEL_START_TAG 50

@interface SHSliderControl()
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)SHSlideButton *slideBtn;
@end


@implementation SHSliderControl

-(id)initWithFrame:(CGRect)frame titles:(NSArray<NSString *>*)titles
{
    if (self = [super initWithFrame:frame]) {
        self.titles = titles;
        self.slideBtn = [[SHSlideButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        self.slideBtn.center = CGPointMake( frame.size.width/2,  frame.size.height/2);
        [self addSubview:self.slideBtn];
        
        [self.slideBtn addTarget:self action:@selector(touchUp:event:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchUpInside];
        [self.slideBtn addTarget:self action:@selector(touchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.slideBtn addTarget:self action:@selector(touchMove:event:) forControlEvents:UIControlEventTouchDragInside|UIControlEventTouchDragOutside];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGes];
        
        for (NSInteger i  = 0; i < [self.titles count]; i++) {
            CGPoint point = [self centerPointForIndex:i];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LFET_OFFSET - LABLE_WIDTH,  point.y - LABLE_WIDTH/2, LABLE_WIDTH, LABLE_WIDTH)];
            label.text = [self.titles objectAtIndex:i];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont systemFontOfSize:12];
            label.adjustsFontSizeToFitWidth = YES;
            label.textColor = PROGRESS_CLOLOR;
            label.tag = TITLE_LABEL_START_TAG + i;
            label.alpha = 0.0;
            [self addSubview:label];
        }
        self.selectedIndex = 0;
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
        centerPoint = [self centerPointForIndex:i];
        CGContextSetFillColorWithColor(context, PROGRESS_CLOLOR.CGColor);
        CGContextFillEllipseInRect(context, CGRectMake(rect.size.width/2.0 -DefaultCircleDiameter/2.0, centerPoint.y-DefaultCircleDiameter/2.0, DefaultCircleDiameter, DefaultCircleDiameter));
        
//        //小圆圈左半部分圆弧
//        CGContextSetStrokeColorWithColor(context, PROGRESS_CLOLOR.CGColor);
//        CGContextSetLineWidth(context, .4);
//        CGContextAddArc(context,rect.size.width - 30.f, centerPoint.y -2.0 ,7.0 , (-90+18)*M_PI/180, (165 - 90)*M_PI/180, 0);
//        CGContextDrawPath(context, kCGPathStroke);
//        
//        //小圆圈右半部分圆弧
//        CGContextSetStrokeColorWithColor(context, PROGRESS_CLOLOR.CGColor);
//        CGContextSetLineWidth(context, .4);
//        CGContextAddArc(context,rect.size.width - 30.f, centerPoint.y -2.0 ,7.0 , (18)*M_PI/180, (165 )*M_PI/180, 0);
//        CGContextDrawPath(context, kCGPathStroke);
    }
}

#pragma mark - action
- (void)tapAction:(UITapGestureRecognizer *)tapGes
{
    CGPoint currentTapPoint = [tapGes locationInView:self];
    //判断索引index
    NSInteger index = [self indexOfPoint:currentTapPoint];
    //slideBtn slide to index
    self.selectedIndex = index;
    
}

-(void)touchUp:(SHSlideButton *)button event:(UIEvent *)event
{
    NSLog(@"touchUp");
    //移动最后点
    CGPoint currPoint = [[[event allTouches] anyObject] locationInView:self];
    NSInteger index = [self indexOfPoint:currPoint];
    self.selectedIndex = index;
}

-(void)touchDown:(SHSlideButton *)button event:(UIEvent *)event
{
    NSLog(@"touchDown");
    //获取移动初始点
}

-(void)touchMove:(SHSlideButton *)button event:(UIEvent *)event
{
    NSLog(@"touchMove");
    //移动当前点
    CGPoint currPoint = [[[event allTouches] anyObject] locationInView:self];
    if (TOP_OFFSET<currPoint.y && currPoint.y < self.frame.size.height - BOTTOM_OFFSET) {
        self.slideBtn.center  = CGPointMake(self.slideBtn.center.x, currPoint.y);    
    }
}

#pragma mark - nomalMethods

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    [self slideSlideButtonToIndex:selectedIndex];
    [self animateTitleToIndex:selectedIndex];
    _selectedIndex = selectedIndex;
    NSLog(@"setSelectedIndex:%zd",selectedIndex);
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)slideSlideButtonToIndex:(NSInteger )index
{
    CGPoint selectPoint = [self centerPointForIndex:index];
    [UIView animateWithDuration:.3
                     animations:^{
                        self.slideBtn.center = selectPoint; 
                     }];
}

- (void)animateTitleToIndex:(NSInteger)index
{
    for (NSInteger i  = 0; i < [self.titles count]; i++) {
        UILabel *label = [self viewWithTag:(TITLE_LABEL_START_TAG + i)];
        [UIView animateWithDuration:0.2 animations:^{
            if (i == index) {
                label.alpha = 1.0;
            }
            else
            {
                label.alpha = 0.0;    
            }
        }]; 
    }
}

//计算存在疑问？ 为啥减20
-(CGPoint)centerPointForIndex:(NSInteger) i{
    CGPoint point = CGPointMake(self.frame.size.width/2,i/(float)(self.titles.count-1) * (self.frame.size.height-BOTTOM_OFFSET-TOP_OFFSET - DefaultCircleDiameter) + TOP_OFFSET + DefaultCircleDiameter/2);
    NSLog(@"getCenterPointForIndex:%f,%f",point.x,point.y);
    return point;
}

-(NSInteger)indexOfPoint:(CGPoint )point
{
    //边界值判断
    if (point.y < TOP_OFFSET + DefaultCircleDiameter/2.0) {
        point.y = TOP_OFFSET + DefaultCircleDiameter/2.0;
    }
    if (point.y > self.frame.size.height - (BOTTOM_OFFSET + DefaultCircleDiameter/2.0)) {
        point.y = self.frame.size.height - (BOTTOM_OFFSET + DefaultCircleDiameter/2.0);
    }
    NSInteger index = 0;
    //最近索引
    for (int i  = 0; i < [self.titles count]; i++) {
        CGPoint indexPoint = [self centerPointForIndex:i];
        if (fabs(point.y - indexPoint.y) <  [self distanceOfCircleCenter]/2) {
            index = i;
            break;
        }  
    }
    return index;
}

- (CGFloat)distanceOfCircleCenter
{
    CGFloat distance;
    distance = (self.frame.size.height-BOTTOM_OFFSET-TOP_OFFSET - DefaultCircleDiameter)/(float)(self.titles.count-1);
    return distance;
}

@end
