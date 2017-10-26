//
//  ViewController.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/23.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "ViewController.h"
#import "SHSliderControl.h"

#import "SHCircleSlideOnLine.h"
#import "SHStylePanelViewController.h"
#import "Masonry.h"

@interface ViewController ()
{
    SHCircleSlideOnLine *_circle;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];  
    
    SHStylePanelViewController *stylePanelVC = [[SHStylePanelViewController alloc] init];
    [self addChildViewController:stylePanelVC];
    [self didMoveToParentViewController:stylePanelVC];
    [self.view addSubview:stylePanelVC.view];
    
    [stylePanelVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_offset(64);
    }];
    [stylePanelVC.view layoutIfNeeded];
    
//    UIImageView *imagev = [[UIImageView alloc] init];
//    imagev.image =[UIImage imageNamed:@"13593416336776.jpg"];
//    imagev.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:imagev];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame=  CGRectMake(0, 0, 40, 40);
//    button.backgroundColor = [UIColor blackColor];
//    
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
////    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc ] initWithCustomView:button];
//    [self.view addSubview:button];

//    SHSliderControl *sliderControl = [[SHSliderControl alloc] initWithFrame:CGRectMake(100, 100, 60, 300) titles:@[@"1",@"2",@"3",@"4",@"5",]];
//    sliderControl.backgroundColor = [UIColor whiteColor];
//    [sliderControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged ];
//    [self.view addSubview:sliderControl];
//    SHCircleSlideOnLine *circle = [[SHCircleSlideOnLine alloc] initWithCircleStartX:5 endX:10];
//    circle.frame = CGRectMake(30, 300, 19 , 19 );
//    [self.view addSubview:circle];
//    circle.backgroundColor = [UIColor cyanColor];
//   [circle addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    circle.shapeColor = [UIColor whiteColor];
    
//    // 画一个圆形的path
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:2*(M_PI) startAngle:0 endAngle:2*M_PI clockwise:YES];
//    CAShapeLayer *shadowLayer = [CAShapeLayer layer];
//    
//    // 填充色
//    shadowLayer.fillColor = [UIColor clearColor].CGColor;
//    // 边框色
//    shadowLayer.strokeColor = [UIColor orangeColor].CGColor;
//    shadowLayer.frame = CGRectMake(7.5, 30, 15, 15);
//    // 边框的宽度
//    shadowLayer.lineWidth = 2;
//    shadowLayer.path = path.CGPath;
//    [circle.layer setMask:shadowLayer];
}

-(void)buttonAction:(UIButton *)button
{
    NSLog(@"buttonAction");
    
//    [stylePanelVC showFuncViewWithAnimation:^(BOOL finished) {
//    }];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
