//
//  SHStyleSwitchView.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/26.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "SHSegmentView.h"
#define LEFT_OFFSET 13
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
        CGFloat btnWidth = frame.size.height;
        CGFloat btnSpace = (frame.size.width  - LEFT_OFFSET *2 - [buttonImages count ]*btnWidth)/([buttonImages count ]- 1);
        CGFloat y = 0;
        CGFloat x = LEFT_OFFSET ;
        for (int i  = 0; i<[buttonImages count]; i++) {
            x = LEFT_OFFSET  + (btnSpace + btnWidth )*i;
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

-(void)layoutSubviews
{
    NSLog(@"layoutSubviews:%@",NSStringFromCGRect(self.frame));
    CGFloat btnWidth = self.frame.size.height;
    CGFloat btnSpace = (self.frame.size.width  - LEFT_OFFSET *2 - [_buttonImages count ]*btnWidth)/([_buttonImages count ] - 1);
    CGFloat x = LEFT_OFFSET;
    for (int i  = 0; i < [_buttonImages count]; i++) {
        UIButton *button =  (UIButton *)[self viewWithTag:BUTTON_START_TAG + i];
         x = LEFT_OFFSET  + (btnSpace + btnWidth )*i;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
            make.left.mas_equalTo(x);
            make.width.mas_equalTo(btnWidth);
        }];
    }
}

-(id)initWithImages:(NSArray *)buttonImages
{
    if (self = [super init]) {
        _buttonImages = buttonImages;
        ;
        for (int i  = 0; i<[buttonImages count]; i++) {
           
            NSDictionary *imgDic = [buttonImages objectAtIndex:i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"0"]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"1"]] forState:UIControlStateHighlighted];
            [btn setImage:[UIImage imageNamed:[imgDic objectForKey:@"3"]] forState:UIControlStateSelected];
            [self addSubview:btn];
            btn.tag = BUTTON_START_TAG + i;
            [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

-(void)buttonAction:(UIButton *)button
{
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
