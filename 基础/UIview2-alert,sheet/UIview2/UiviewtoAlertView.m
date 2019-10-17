//
//  UiviewtoAlertView.m
//  UIview2
//
//  Created by captain on 2018/3/25.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "UiviewtoAlertView.h"

@implementation UiviewtoAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.8;
        
        // 自定义alertview为1个UIlabel +2个UIButton,其坐标都是相对于父视图来说；
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
        label.text = @"自定义AlertView";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        // OK button
        UIButton *btn_ok = [[UIButton alloc]initWithFrame:CGRectMake(0, frame.size.height-40, frame.size.width/2, 40)];
        [btn_ok setTitle:@"OK" forState:UIControlStateNormal]; // 这儿纵坐标是高度-button的高度
        btn_ok.layer.borderColor = [UIColor blueColor].CGColor;
        btn_ok.layer.borderWidth = 1.0;
        btn_ok.tag = 200;
        [btn_ok addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: btn_ok];
        
        // Cancel button
        UIButton *btn_cancel = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2, frame.size.height-40, frame.size.width/2, 40)];
        [btn_cancel setTitle:@"Cancle" forState:UIControlStateNormal];
        btn_cancel.layer.borderColor = [UIColor blueColor].CGColor;
        btn_cancel.layer.borderWidth = 1.0;
        btn_cancel.tag = 201;
        [btn_cancel addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: btn_cancel];
    }
    return self;
}

- (void)alertAction:(UIButton *)bt{
    if(bt.tag == 200){
        NSLog(@"OK");
    }else{
        NSLog(@"Cancle");
    }
}
@end
