//
//  BJDynamicsViewController.m
//  QimuDemo
//
//  Created by zhangwenjun on 2019/3/5.
//  Copyright © 2019 ll. All rights reserved.
//

#import "BJDynamicsViewController.h"

@interface BJDynamicsViewController ()
@property (strong, nonatomic) UIView *orangeBall;

@property (strong, nonatomic) UIView *redView;

//UIDynamicAnimator（动画者）
@property (strong, nonatomic) UIDynamicAnimator *animator;

//UIDynamicBehavior（动画行为）
@property (strong, nonatomic) UISnapBehavior *snapBehavior;
@property (strong, nonatomic) UIPushBehavior *pushBehavior;
@property (strong, nonatomic) UIAttachmentBehavior *attachmentBehavior;

@end

@implementation BJDynamicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"UIDynamicAnimator";
    self.view.backgroundColor = [UIColor whiteColor];
    self.isCustomBack = YES;

    
    // 1.初始化、配置orangeBall
    self.orangeBall = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-25, 100, 50, 50)];
    self.orangeBall.backgroundColor = [UIColor orangeColor];
    self.orangeBall.layer.cornerRadius = 25;
    [self.view addSubview:self.orangeBall];
    
    // 2.初始化animator
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    UIDynamicBehavior （抽象类）：
    //    UIGravityBehavior：重力行为
    //    UICollisionBehavior：碰撞行为
    //    UISnapBehavior：甩行为
    //    UIAttachmentBehavior：附着行为
    //    UIPushBehavior：推行为
    
    
    //重力行为
//    [self testGravity];
    
    //碰撞行为（配合重力行为使用）
//    [self testCollision];
    
    //推行为
//    [self testPush];
    
    //甩行为
//    [self testSnap];
    
    //吸附行为
    [self testAttachment];
}


#pragma mark - 重力行为
- (void)testGravity {
    // 1.初始化重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.orangeBall]];
    
    // 2.添加重力行为到UIDynamicAnimator
    [self.animator addBehavior:gravity];
}

#pragma mark - 碰撞行为
- (void)testCollision{
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.orangeBall]];
//    [collision addBoundaryWithIdentifier:@"apple" fromPoint:CGPointMake(10, 10) toPoint:CGPointMake(320, 568)];//通过这个可以设置重力加速度的方向
    collision.translatesReferenceBoundsIntoBoundary = YES;//到边界停止
    [self.animator addBehavior:collision];
}

#pragma mark - 推行为
- (void)testPush{
    // 添加点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushTestTap:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)pushTestTap:(UITapGestureRecognizer *)tap{
    
    self.pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.orangeBall] mode:UIPushBehaviorModeInstantaneous];
    //    pushBehavior.magnitude = pushMagnitude;
    [self.animator addBehavior:self.pushBehavior];
    
    CGPoint tapPoint = [tap locationInView:self.view];  //p2
    CGPoint squareViewCenterPoint = self.orangeBall.center;  //p1
    
    CGFloat deltaX = tapPoint.x - squareViewCenterPoint.x;
    CGFloat deltaY = tapPoint.y - squareViewCenterPoint.y;
    CGFloat angle = atan2(deltaY, deltaX);
    [self.pushBehavior setAngle:angle];  //推移的角度
    
    //勾股
    CGFloat distanceBetweenPoints =
    sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) +
         pow(tapPoint.y - squareViewCenterPoint.y, 2.0));
    //double pow(double x, double y）;计算以x为底数的y次幂
    //double sqrt (double);开平方
    
    //推力的大小（移动速度）
    [self.pushBehavior setMagnitude:distanceBetweenPoints / 500.0f];
    //每1个magnigude将会引起100/平方秒的加速度，这里分母越大，速度越小
}

#pragma mark - 甩行为
- (void)testSnap{
    // 添加点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(snapTestTap:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)snapTestTap:(UITapGestureRecognizer *)tapGesture {
    // 1.获得点击屏幕位置
    CGPoint touchPoint = [tapGesture locationInView:self.view];
    
    // 2.snapBehavior存在时 移除
    if (self.snapBehavior) {
        [self.animator removeBehavior:self.snapBehavior];
    }
    
    // 3.初始化snapBehavior 设定damping值
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.orangeBall snapToPoint:touchPoint];
    self.snapBehavior.damping = 0.3;
    [self.animator addBehavior:self.snapBehavior];
}

#pragma mark - 吸附行为
- (void)testAttachment{
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-5, 100, 10, 10)];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.layer.cornerRadius = 5;
    [self.view addSubview:self.redView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(attachmentTestTap:)];
    [self.orangeBall addGestureRecognizer:pan];
}

- (void)attachmentTestTap:(UIPanGestureRecognizer *)panGesture{
    CGPoint location = [panGesture locationInView:self.view];
    CGPoint boxLocation = [panGesture locationInView:self.orangeBall];
    
    switch (panGesture.state) {
            // 手势开始
        case UIGestureRecognizerStateBegan:
            NSLog(@"Touch started position: %@",NSStringFromCGPoint(location));
            NSLog(@"Location in image started is %@",NSStringFromCGPoint(boxLocation));
            
            // 1.移除所有动力行为
            [self.animator removeAllBehaviors];
            
            // 2.通过改变锚点移动View
            UIOffset centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(self.orangeBall.bounds), boxLocation.y - CGRectGetMidY(self.orangeBall.bounds));
            self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.orangeBall offsetFromCenter:centerOffset attachedToAnchor:location];
            
            // 3.redView中心设置为attachmentBehavior的anchorPoint
            self.redView.center = self.attachmentBehavior.anchorPoint;
            
            // 4.添加附着行为到animator
            [self.animator addBehavior:self.attachmentBehavior];
            
            break;
            
            // 手势改变
        case UIGestureRecognizerStateChanged:
            self.attachmentBehavior.anchorPoint = [panGesture locationInView:self.view];
            self.redView.center = self.attachmentBehavior.anchorPoint;
            
            break;
            
            // 手势结束
        case UIGestureRecognizerStateEnded:
            
            [self.animator removeAllBehaviors];

            NSLog(@"Touch ended position: %@",NSStringFromCGPoint(location));
            NSLog(@"Location in image ended is %@",NSStringFromCGPoint(boxLocation));
            break;
            
        default:
            break;
    }
}

@end
