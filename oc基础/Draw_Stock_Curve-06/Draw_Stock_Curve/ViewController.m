//
//  ViewController.m
//  Draw_Stock_Curve
//
//  Created by captain on 2018/11/1.
//  Copyright © 2018年 captain. All rights reserved.
//1.数据处理 2.图形绘制
//1.1加载数据 1.2数据解析 1.3数据归一化处理

#import "ViewController.h"
#import "StockClass.h"
#import "QuartzClass.h"
#define displayHeight 300 // 数据在屏幕展示的高度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *loadStock = [self loadStockData];
    NSMutableArray *parseStock = [self parseStockData:loadStock];
    NSMutableArray *normalizationStock = [self normalizationStockData:parseStock];
    QuartzClass *quartz = [[QuartzClass alloc]initWithFrame:self.view.bounds stockData:normalizationStock];
//    quartz.backgroundColor =[UIColor clearColor];
    [self.view addSubview:quartz];
    [quartz setNeedsDisplay];
}
// 加载数据
- (NSMutableArray *)loadStockData{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *stockListStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[stockListStr componentsSeparatedByString:@"\n"]];
    return array;
}
// 解析数据
- (NSMutableArray *)parseStockData:(NSMutableArray *)stockData{
    NSMutableArray *stockArray = [[NSMutableArray alloc]init];
    for (int i = 0; i<stockData.count; i++) {
        NSString *str = [stockData objectAtIndex:i];
        NSMutableArray *oneStock = [[NSMutableArray alloc]initWithArray:[str componentsSeparatedByString:@" "]];
        NSString *time = [oneStock objectAtIndex:0];
        NSString *beginPrice = [oneStock objectAtIndex:1];
        NSString *endPrice = [oneStock objectAtIndex:2];
        NSString *maxPrice = [oneStock objectAtIndex:3];
        NSString *minPrice = [oneStock objectAtIndex:4];
        NSString *tradeVolume = [oneStock objectAtIndex:5];
        
        StockClass *item = [[StockClass alloc]init];
        item.time = time;
        item.beginPrice = beginPrice.floatValue;
        item.endPrice = endPrice.floatValue;
        item.maxPrice = maxPrice.floatValue;
        item.minPrice = minPrice.floatValue;
        item.tradeVolume = tradeVolume.intValue;
        
        [stockArray addObject:item];
    }
    return stockArray;
}

//归一化处理数据
- (NSMutableArray *)normalizationStockData:(NSMutableArray *)parseStockData{
    float maxPriceAll=0;
    float minPriceAll=10000;
    float maxTradeVolume=0;
    float minTradeVolume=1000000000;
    for (StockClass *item in parseStockData) {
        float maxPrice = item.maxPrice;
        float minPrice = item.minPrice;
        int trade = item.tradeVolume;
        if (maxPrice > maxPriceAll) {
            maxPriceAll = maxPrice;
        }
        if (minPrice < minPriceAll) {
            minPriceAll = minPrice;
        }
        if (trade > maxTradeVolume) {
            maxTradeVolume = trade;
        }
        if (trade < minTradeVolume) {
            minTradeVolume = trade;
        }
    }
    //讲解析出来的数据处理到0-300px之间
    NSMutableArray *normalizationStock = [[NSMutableArray alloc]init];
    for (StockClass *item in parseStockData) {
        item.beginPrice = (item.beginPrice-minPriceAll)*displayHeight/(maxPriceAll-minPriceAll);
        item.endPrice = (item.endPrice-minPriceAll)*displayHeight/(maxPriceAll-minPriceAll);
        item.minPrice = (item.minPrice-minPriceAll)*displayHeight/(maxPriceAll-minPriceAll);
        item.maxPrice = (item.maxPrice -minPriceAll)*displayHeight/(maxPriceAll-minPriceAll);
        item.tradeVolume = (item.tradeVolume-minTradeVolume)*displayHeight/(maxTradeVolume-minTradeVolume);
        [normalizationStock addObject:item];
    }
    return normalizationStock;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

