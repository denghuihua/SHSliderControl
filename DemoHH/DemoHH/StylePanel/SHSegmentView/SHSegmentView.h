//
//  SHStyleSwitchView.h
//  DemoHH
//
//  Created by huihuadeng on 2017/10/26.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHSegmentView : UIControl

@property(nonatomic,assign)NSInteger selectedIndex;

-(id)initWithFrame:(CGRect)frame images:(NSArray *)buttonImages;
@end
