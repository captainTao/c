
设置颜色十六进制的代码：
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0] // 宏定义16进制代码转rgb模式

#define COLOR1  UIColorFromHex(0xEEB422)  //格式为UIColor
#define COLOR2  UIColorFromHex(0xADFF2F)

self.loginbutton.backgroundColor = UIColorFromHex(0xC0FF3E);//用颜色的16进制设置颜色


-----------------------------------------------------------------
-----------------------------------------------------------------
///////////////////////////////////
UIColor的颜色#494949转rgb模式！

//
//  UIColor+ext.h
//  HFramework
//
//  Created by zhangchutian on 14-6-5.
//  Copyright (c) 2014年 zhangchutian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ext)

- (UIColor *)revertColor;

//formate : @"#f6ee34" or @"0x45fed2"
+ (UIColor *)colorWithString:(NSString *)colorStr alpha:(float)alpha;
+ (UIColor *)colorWithString:(NSString *)colorStr;

//formate : 0x9875a3
+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha;
+ (UIColor *)colorWithHex:(int)hex;

+ (UIColor *)random;
@end

/*---------------------------分割线---------------------------------*/
//
//  UIColor+ext.m
//  HFramework
//
//  Created by zhangchutian on 14-6-5.
//  Copyright (c) 2014年 zhangchutian. All rights reserved.
//

#import "UIColor+ext.h"

@implementation UIColor (ext)
- (UIColor *)revertColor
{
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    if (colorSpaceModel == kCGColorSpaceModelRGB)
    {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        return [UIColor colorWithRed:(1.0 - components[0]) green:(1.0 - components[1]) blue:(1.0 - components[2]) alpha:components[3]];
    }
    else return nil;
}

+ (UIColor *)colorWithString:(NSString *)colorStr
{
    return [self colorWithString:colorStr alpha:1.0];
}

+ (UIColor *)colorWithString:(NSString *)colorStr alpha:(float)alpha
{
    NSString *cString = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor clearColor];
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];

    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hex
{
    return [self colorWithHex:hex alpha:1.0];
}

+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha
{
    float r = ((float)((hex & 0xff0000) >> 16))/255.0;
    float g = ((float)((hex & 0xff00) >> 8))/255.0;
    float b = ((float)((hex & 0xff) >> 0))/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}
+ (UIColor *)random
{
    return [UIColor colorWithRed:(arc4random()%256)*1.0/256 green:(arc4random()%256)*1.0/256 blue:(arc4random()%256)*1.0/256 alpha:1];
}
@end


/************************************************************/