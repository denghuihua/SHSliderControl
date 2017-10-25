//
//  SHSliderControl.h
//  DemoHH
//
//  Created by huihuadeng on 2017/10/23.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHSliderControl : UIControl
-(id)initWithFrame:(CGRect)frame titles:(NSArray<NSString *>*)titles;
@property(nonatomic,assign)NSInteger selectedIndex;
@end
