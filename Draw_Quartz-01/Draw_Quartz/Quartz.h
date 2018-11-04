//
//  Quartz.h
//  Draw_Quartz
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]
#define COLOR1  UIColorFromHex(0xEEB422)
#define COLOR2  UIColorFromHex(0xADFF2F)
/*
 #define COLOR1  [UIColor colorWithRed:0.8 green:0.8 blue:0.31 alpha:1.0]
 #define COLOR2  [UIColor colorWithRed:0.54 green:0.5 blue:0.31 alpha:1.0]
 */
/*宏定义句子后面不需要分号*/

@interface Quartz : UIView

@end
