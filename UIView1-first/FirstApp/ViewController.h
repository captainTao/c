//
//  ViewController.h
//  FirstApp
//
//  Created by captain on 2018/2/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
// 通过拖拽定义的mybutton和对应点击的响应事件
@property (weak, nonatomic) IBOutlet UIButton *mybutton;
- (IBAction)myaction:(id)sender;

// 通过拖拽定义的loginbutton和对应点击的响应事件
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)loginAction:(UIButton *)sender;

@end

