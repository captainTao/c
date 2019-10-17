/*
 作者：MJ
 描述：
 时间：
 文件名：Person.h
 */
#import <Foundation/Foundation.h>
#import "Card.h"
// @class仅仅是告诉编译器，Card是一个类
//@class Card;

@interface Person : NSObject

@property (nonatomic, retain) Card *card;

@end
