//
//  ViewController.m
//  DemoHH
//
//  Created by huihuadeng on 2017/10/23.
//  Copyright © 2017年 huihuadeng. All rights reserved.
//

#import "ViewController.h"
#import "SHSliderControl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SHSliderControl *sliderControl = [[SHSliderControl alloc] initWithFrame:CGRectMake(100, 100, 60, 300) titles:@[@"1",@"2",@"3",@"4",@"5",]];
    sliderControl.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sliderControl];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
