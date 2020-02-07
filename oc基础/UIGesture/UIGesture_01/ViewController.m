//
//  ViewController.m
//  UIGesture_01
//
//  Created by captain on 2018/4/2.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *myblue;
@property (weak, nonatomic) IBOutlet UIView *myorange;

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
 
 UIScreenEdgePanGestureRecongnizer继承直接的父类UIPanGesutreRecongnizer;
 
 如果是ImageView，需要做以下处理：
 [imageView setUserInteractionEnabled:YES];  或者 imageView.userInteractionEnabled = YES; //打开用户交互
 [imageView setMultipleTouchEnabled:YES]; // 打开多手势
 
 
 旋转：
 CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation); 这个方法可以叠加其他效果
 CGAffineTransformMakeRotation(sender.rotation);  这个方法不改变中心点
 缩放：
 CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
 CGAffineTransformMakeScale(sender.scale, sender.scale);
 
 上面两种方法的区别是，长的那种可以叠加其他手势效果；make方法的不能叠加其他效果；
 
 https://www.jianshu.com/p/5ccbe616030c
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.myblue setCenter:(CGPoint){self.view.center.x, self.view.center.y}]; // 设置myblue居中
//    self.myblue.center = self.view.center;
//    [self.myblue setCenter:CGPointMake(self.view.center.x, self.view.center.y)]; // 设置myblue居中

//    [self rotationGesture]; // 单手势
    [self addGestureRecognizerToView:self.myblue];// 多手势
    [self addGestureRecognizerToView:self.myorange];
    

}


# pragma mark 旋转和缩放手势,或者多手势：
 // 思考：如何定义一个view支持旋转和缩放两个手势或者以上手势?  <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer   // 这个是UIGestureRecognizerDelegate里面的一个委托方法
{
//    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
//        return YES;  // 只需要执行缩放和旋转手势!
//    }else{  return NO;}
    return YES;  // 叠加所有手势
}


- (void) addGestureRecognizerToView:(UIView *)view // 叠加手势,需要使用上面delegete的方法返回YES....
{
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    rotationGestureRecognizer.delegate = self; // 下面两个手势不需要delegate?
    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [view addGestureRecognizer:panGestureRecognizer];
}

// 处理旋转手势
- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    UIView *view = rotationGestureRecognizer.view;
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
//        view.transform = CGAffineTransformMakeRotation(rotationGestureRecognizer.rotation); // this method can not overlays other effect.
        [rotationGestureRecognizer setRotation:0];  // 这句是连续旋转？需要一个作为基准
    } else if (rotationGestureRecognizer.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
            view.transform = CGAffineTransformIdentity;
        }];
    }
}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;  // 这句是连续缩放？每一次有一个基准值
    } else if (pinchGestureRecognizer.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
            view.transform = CGAffineTransformIdentity;
        }];
    }
}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [_myblue setCenter:(CGPoint){_myblue.center.x + translation.x, _myblue.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview]; // 设置拖动的0点的基准值
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
//            [view setCenter:(CGPoint){self.view.center.x, self.view.center.y}]; // 设置为self.view的点
        }];
    }
}

/*****************************************************/

# pragma mark 旋转手势 Rotation：
- (void)rotationGesture{
    UIRotationGestureRecognizer *rotationgesutre = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    [self.myblue addGestureRecognizer:rotationgesutre];
}
- (void)rotationAction:(UIRotationGestureRecognizer *)sender{
    NSLog(@"rotation angle = %f", sender.rotation);// 输出旋转角度
    if (sender.state == UIGestureRecognizerStateChanged){
        self.myblue.transform = CGAffineTransformMakeRotation(sender.rotation); //图像变化角度
    } else if(sender.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{  // 调用动画block, 时间设置为0.5比较合适
            self.myblue.transform = CGAffineTransformIdentity; // 取消一切形变
        }];
    }
}
# pragma mark 缩放手势 Pinch：
- (void)pinchGesture{
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [self.myblue addGestureRecognizer:pinchGesture];
}
- (void)pinchAction:(UIPinchGestureRecognizer *)sender{
    NSLog(@"scale = %f", sender.scale); // 输出缩放比例
    if (sender.state == UIGestureRecognizerStateChanged){
        self.myblue.transform = CGAffineTransformMakeScale(sender.scale, sender.scale); //图像缩小
    } else if(sender.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:1 animations:^{  // 调用动画block
            self.myblue.transform = CGAffineTransformIdentity; // 取消一切形变
        }];
    }
}
# pragma mark 屏幕边缘滑动手势 ScreenEdgePan：
- (void)ScreenEdgeGesture{
    UIScreenEdgePanGestureRecognizer *edgeGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgeAction:)];
    // 指定屏幕边缘
    edgeGesture.edges = UIRectEdgeRight;
     // self.view添加手势
    [self.view addGestureRecognizer:edgeGesture];
}
- (void)edgeAction:(UIScreenEdgePanGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan && sender.edges == UIRectEdgeRight) {
        NSLog(@"从右边缘开始滑动！");
    }
    else if(sender.state == UIGestureRecognizerStateEnded && sender.edges != UIRectEdgeLeft){
        NSLog(@"不是从左边缘滑动结束的！");
    }
}
# pragma mark 滑动手势 Pan：
- (void)panGesture{
    UIPanGestureRecognizer *pangesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self.myblue addGestureRecognizer:pangesture];
}

- (void)panAction:(UIPanGestureRecognizer *)sender{
    // 获取滑动点的位置：
    CGPoint point = [sender locationInView:self.myblue];
    // 获取滑动的速度：
    CGPoint speed = [sender velocityInView:self.myblue];
    NSLog(@"point = %@, speed = %@", NSStringFromCGPoint(point),NSStringFromCGPoint(speed));
}

# pragma mark 轻扫 Swipe:
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
# pragma mark 长按 LongPress
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

# pragma mark 短按 Tap
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
