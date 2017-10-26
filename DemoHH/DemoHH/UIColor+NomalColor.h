//
//  UIColor+NomalColor.h
//  Cosmetology
//
//  Created by betty on 14-1-21.
//  Copyright (c) 2014年 ndtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NomalColor)
//边框的颜色
+(UIColor *)borderNomalColor;

//app颜色风格
+(UIColor *)appStyleColor;

//蒙版颜色
+(UIColor *)maskingColor;

//深灰色 有透明度
+(UIColor *)deepGrayColor;

//深灰色 有透明度
+(UIColor *)moreDeepGrayColor;

+(UIColor *)grayFontColor;

+(UIColor *)moreLightGrayColor;

+(UIColor *)tableViewLineColor;

+(UIColor *)tableViewBackgroudColor;

+(UIColor *)navBarButtonNomalColor;

+(UIColor *)navBackgroudColor;

+(UIColor *)buttonTouchDownHightLightedColor;

//操作按钮颜色
+(UIColor *)buttonColor;

//说明提示，信息小字
+(UIColor *)alertInfoTextColor;
@end



