//
//  MyTextField.m
//  test
//
//  Created by captain on 2018/6/13.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 5.0;
        self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];// 设置左边距
        self.leftViewMode = UITextFieldViewModeAlways; //设置永远不显示
    }
    return self;
}

@end
