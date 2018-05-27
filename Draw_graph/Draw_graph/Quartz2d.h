//
//  Quartz2d.h
//  Draw_graph
//
//  Created by captain on 2018/5/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]

#define COLOR1  UIColorFromHex(0x9400D3)
#define COLOR2  UIColorFromHex(0xFFFF00)
#define COLOR3  UIColorFromHex(0xFFBBFF)
#define COLOR4  UIColorFromHex(0xCAE1FF)
#define COLOR5  UIColorFromHex(0xADFF2F)
#define COLOR6  UIColorFromHex(0xCAFF70)

//#define COLOR1 [UIColor colorWithRed:0.30 green:0.73 blue:0.49 alpha:1.0]
//#define COLOR2 [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
//#define COLOR3 [UIColor colorWithRed:0.65 green:0.43 blue:0.87 alpha:1.0]
//#define COLOR4 [UIColor colorWithRed:0.28 green:0.77 blue:0.30 alpha:1.0]
//#define COLOR5 [UIColor colorWithRed:0.97 green:0.55 blue:0.62 alpha:1.0]

@interface Quartz2d : UIView

@end
