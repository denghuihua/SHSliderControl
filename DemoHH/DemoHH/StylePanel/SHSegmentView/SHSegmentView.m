//
//  SHStyleSwitchView.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/26.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHSegmentView.h"
#define LEFT_OFFSET 16
#define BUTTON_START_TAG 40

@interface SHSegmentView()
{
    NSArray *_buttonImages;
}

@end

@implementation SHSegmentView

-(id)initWithFrame:(CGRect)frame images:(NSArray *)buttonImages
{
    if (self = [super initWithFrame:frame]) {
        _buttonImages = buttonImages;
        CGFloat btnWidth = 20;
        CGFloat btnSpace = (frame.size.width  - LEFT_OFFSET *2)/[buttonImages count];
        CGFloat y = 5;
        CGFloat x = LEFT_OFFSET ;
        for (int i  = 0; i<[buttonImages count]; i++) {
            x = LEFT_OFFSET  + btnSpace *i;
            NSDictionary *imgDic = [buttonImages objectAtIndex:i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"0"]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"1"]] forState:UIControlStateHighlighted];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"3"]] forState:UIControlStateSelected];
            [self addSubview:btn];
            btn.tag = BUTTON_START_TAG + i;
            btn.frame = CGRectMake(x, y, btnWidth, btnWidth);
            [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
        }
    }
    return self;
}

-(void)buttonAction:(UIButton *)button
{
    NSLog(@"buttonAction:%zd",button.tag - BUTTON_START_TAG);
    for (int i  = 0; i < [_buttonImages count]; i++) {
        UIButton *button =  (UIButton *)[self viewWithTag:BUTTON_START_TAG + i];
        button.selected = NO;
    }
    
    button.selected = YES;
    _selectedIndex = button.tag - BUTTON_START_TAG;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)setSelectedIndex:(NSInteger )btnIndex
{
    UIButton *button =  (UIButton *)[self viewWithTag:BUTTON_START_TAG + btnIndex];
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
