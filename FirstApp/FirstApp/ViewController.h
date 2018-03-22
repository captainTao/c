//
//  ViewController.h
//  FirstApp
//
//  Created by captain on 2018/2/26.
//  Copyright © 2018年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *mybutton;
- (IBAction)myaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)loginAction:(UIButton *)sender;

@end

