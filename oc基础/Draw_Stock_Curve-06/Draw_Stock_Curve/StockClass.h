//
//  StockClass.h
//  Draw_Stock_Curve
//
//  Created by captain on 2018/11/7.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockClass : NSObject
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)float beginPrice;
@property(nonatomic,assign)float endPrice;
@property(nonatomic,assign)float maxPrice;
@property(nonatomic,assign)float minPrice;
@property(nonatomic,assign)int tradeVolume;
@end
