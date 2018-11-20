//
//  UIBlockView.m
//  Draw_LockScreen-07
//
//  Created by captain on 2018/11/12.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "UIBlockView.h"
#import "NodeView.h"
@interface UIBlockView()
@property(nonatomic,assign)CGMutablePathRef path;
@property(nonatomic,strong) NSMutableArray *nodeViews;
@property(nonatomic,strong)NSMutableArray *throughNodeViews;
@property BOOL isValidateGesture;
@property(nonatomic,strong)NSMutableString *secret;
@end

@implementation UIBlockView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
        self.nodeViews = [NSMutableArray array];
        self.throughNodeViews = [NSMutableArray array];
        self.secret = [[NSMutableString alloc]init];
        [self initNodeViews];
    }
    return self;
}
//绘制的9个点
- (void)initNodeViews{
    CGFloat x = self.frame.size.width/4;
    CGFloat startY = (self.frame.size.height-self.frame.size.width)/2;
    CGFloat y = x;
    for (int i =0; i < 9; i++) {
        NodeView *node = [[NodeView alloc]init];
        node.userInteractionEnabled = NO; //取消在touch中获得的相对位置
        node.image =[UIImage imageNamed:@"gesture_node_normal"];//集成自UIImageView时直接可以用.image
        node.center = CGPointMake(x*(i%3+1), startY+y*(i/3+1));
        node.bounds = CGRectMake(0, 0, 50, 50);
        node.number = [NSString stringWithFormat:@"%d", i+1];
        [self addSubview:node];
        [self.nodeViews addObject:node];
    }
}
//判断点是否落在nodeview中
- (NodeView *)throughNodeViewByPoint:(CGPoint)pt{
    __block NodeView *nodeView = nil;
    [self.nodeViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NodeView *node =obj;
        CGRect rect = node.frame;
        if (CGRectContainsPoint(rect, pt)) {
            nodeView= node;
            *stop =YES;
        }
    }];
    return nodeView;//这儿用nodeView做判断标准，因为nodeView只有9个确定，但画的点不确定，另外判断这个nodeview是否被手势选取过
}

- (void)drawRect:(CGRect)rect {
    if (self.path) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.path);
        CGContextSetLineWidth(context, 4.0);
        CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    //判断改点是否落在手势点中
    NodeView *nodeView =[self throughNodeViewByPoint:pt];
    if (nodeView) {
        //判断第一个点是否有效才执行后面的操作；
        self.isValidateGesture = YES;
        self.path = CGPathCreateMutable();
        CGPathMoveToPoint(self.path, NULL, nodeView.center.x, nodeView.center.y);
        nodeView.image =[UIImage imageNamed:@"gesture_node_highlighted"];
        [self.throughNodeViews addObject:nodeView];
        [self.secret appendString:nodeView.number];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //点有效才执行后续操作
    if (!self.isValidateGesture) {
        return;
    }
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
     //判断改点是否落在手势点中
    NodeView *nodeView =[self throughNodeViewByPoint:pt];
    if (nodeView) {
        //该点是否出现过，不出现的时候做后续操作
        if (![self.throughNodeViews containsObject:nodeView]) {
            CGPathAddLineToPoint(self.path, NULL, nodeView.center.x, nodeView.center.y);//这儿不能用pt的点来画，用nodeView的中心点来画
            [self setNeedsDisplay];
            nodeView.image = [UIImage imageNamed:@"gesture_node_highlighted"];
            [self.throughNodeViews addObject:nodeView];
            [self.secret appendString:nodeView.number];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!self.isValidateGesture) {
        return;
    }
    CGPathRelease(self.path);
    self.path = nil;
    [self validateSecret];
}

- (void)validateSecret{
    BOOL isSuccess = NO;
    if ([self.secret isEqualToString:@"1478"]) {
        isSuccess = YES;
    }
    if(self.unblockViewBlock){
        self.unblockViewBlock(self, isSuccess);
    }
}

-(void)reset{
    [self.throughNodeViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NodeView *node = obj;
        node.image = [UIImage imageNamed:@"gesture_node_normal"];
    }];
    [self.throughNodeViews removeAllObjects];
    self.isValidateGesture = NO;
    [self.secret setString:@""];
    [self setNeedsDisplay]; //重置之后重新绘制
}

@end
