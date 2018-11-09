//
//  QuartzClass.h
//  Draw_Stock_Curve
//
//  Created by captain on 2018/11/8.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockClass.h"
@interface QuartzClass : UIView

- (instancetype) initWithFrame:(CGRect)frame stockData:(NSMutableArray *)normalizationStockData;
@end
