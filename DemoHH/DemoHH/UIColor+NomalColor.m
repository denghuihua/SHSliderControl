//
//  UIColor+NomalColor.m
//  Cosmetology
//
//  Created by betty on 14-1-21.
//  Copyright (c) 2014年 ndtech. All rights reserved.
//

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#import "UIColor+NomalColor.h"

@implementation UIColor (NomalColor)

+(UIColor *)borderNomalColor
{
    return RGBA(232, 233, 232, 1.0);
}

+(UIColor *)maskingColor
{
    return RGBA(44, 44, 44, 0.5);
}

+(UIColor *)deepGrayColor
{
    return RGBA(14,14,2,0.4);
}

+(UIColor *)moreDeepGrayColor
{
    return RGBA(148,152,151,1);
}

//161 43 175
+(UIColor *)appStyleColor
{
    return RGBA(124, 187, 155, 1.0);
}

+(UIColor *)grayFontColor
{
  return RGBA(84, 84, 84, 1.0);
}

+(UIColor *)moreLightGrayColor
{
    return RGBA(234, 234, 234, 1.0);
}

+(UIColor *)navBackgroudColor
{
    return [UIColor whiteColor];
}

+(UIColor *)tableViewLineColor
{
    return RGBA(188, 187, 193, 1.0);
}

+(UIColor *)tableViewBackgroudColor
{
    return RGBA(245, 245, 245, 1.0);
}

+(UIColor *)navBarButtonNomalColor
{
    return RGBA(12, 95, 254, 1.0);
}

+(UIColor *)buttonTouchDownHightLightedColor
{
    return RGBA(12, 95, 254, 1.0);
}


+(UIColor *)buttonColor
{
    return [UIColor colorWithHex:0x5ecf75];
}

+(UIColor *)alertInfoTextColor
{
    return [UIColor colorWithHex:0x929292];
}


@end
