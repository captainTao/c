//
//  ViewController.m
//  UIGesture_01
//
//  Created by captain on 2018/4/2.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myblue;

@end

@implementation ViewController

/*
 常用手势：
 Tap:点击
 Long Press: 长按
 Swipe：轻扫
 
 Pan:滑动
 Screen Edge Pan:边缘滑动
 Pinch:放大缩小
 Rotation:旋转
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self SwipeGesture];

}

# pragma mark 轻扫:
- (void)SwipeGesture{
    UISwipeGestureRecognizer *swipeGesgureleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeAction:)];
    swipeGesgureleft.direction = UISwipeGestureRecognizerDirectionLeft; //默认的方向为向右
    [self.myblue addGestureRecognizer:swipeGesgureleft];
   
    UISwipeGestureRecognizer *swipeGesgurerUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeAction:)];
    swipeGesgurerUp.direction = UISwipeGestureRecognizerDirectionUp; //默认的方向为向右,两个手势需要设置两个手势
    [self.myblue addGestureRecognizer:swipeGesgurerUp];
}

- (void)SwipeAction:(UISwipeGestureRecognizer *)sender{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swiped to left!");
    }else if(sender.direction == UISwipeGestureRecognizerDirectionUp){
        NSLog(@"swiped to UP!");
    }
   
}
# pragma mark 长按
- (void)longTapGesture{
    UILongPressGestureRecognizer *longGesutre = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongTapAction:)];
    [self.myblue addGestureRecognizer:longGesutre];
}

- (void)LongTapAction:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan){
        /*
         UIGestureRecognizerStatePossible,
         UIGestureRecognizerStateBegan,
         UIGestureRecognizerStateChanged,
         UIGestureRecognizerStateEnded,
         UIGestureRecognizerStateCancelled,
         UIGestureRecognizerStateFailed,
         */

        NSLog(@"Long Press began!");
    }else
        NSLog(@"Long press ended!");
}

# pragma mark 短按
- (void)shortTapGesture{
    UITapGestureRecognizer *tapreconginzer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    tapreconginzer.numberOfTapsRequired =2; // 点击两次
    tapreconginzer.numberOfTouchesRequired = 2; // 两个手指触摸
    [self.myblue addGestureRecognizer:tapreconginzer]; // view绑定手势
}
- (void)tapGestureAction:(UITapGestureRecognizer *)gesture{
    NSLog(@"UIview has been tapped!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
