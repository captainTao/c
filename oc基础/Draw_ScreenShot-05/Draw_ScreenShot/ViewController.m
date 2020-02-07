//
//  ViewController.m
//  Draw_ScreenShot
//
//  Created by captain on 2018/6/4.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"
# import "UIView+ScreenShot.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [self.view imageScreenShot];
    
    // 保存到本地相册, 这儿需要在infolist中添加一个权限；Privacy - Photo Library Usage Description
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
