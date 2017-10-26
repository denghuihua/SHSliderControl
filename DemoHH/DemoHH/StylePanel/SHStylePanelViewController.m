//
//  SHStylePanelViewController.m
//  SohuInk
//
//  Created by huihuadeng on 2017/10/25.
//  Copyright © 2017年 Sohu. All rights reserved.
//

#import "SHStylePanelViewController.h"
#import "Masonry.h"
#import "SHSegmentView.h"

#define FUNC_VIEW_CORNER_RADIUS 6
#define FUNC_VIEW_WIDTH 114 


@interface SHStylePanelViewController ()
{
    SHSegmentView *_styleSwitchView;
    
}
@property (strong, nonatomic) UIView *stylePanelView;
@end

@implementation SHStylePanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    [self configViews];
    
    UISwipeGestureRecognizer *swipGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesAction:)];   
    swipGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: swipGes];
    
    UISwipeGestureRecognizer *swipGes2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesAction:)];   
    swipGes2.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: swipGes2];
    
}

-(void)configViews
{
    [self.view addSubview:self.stylePanelView];
    [self.stylePanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(FUNC_VIEW_CORNER_RADIUS/2);
        //        make.right.mas_equalTo(0);
        make.height.mas_equalTo(408);
        make.width.mas_equalTo(FUNC_VIEW_WIDTH + FUNC_VIEW_CORNER_RADIUS/2);
        make.top.mas_equalTo(self.view.frame.size.height * 0.132);
    }];
    
    SHSegmentView *styleSwitchView = [[SHSegmentView alloc] initWithFrame:CGRectMake(0, 11, FUNC_VIEW_WIDTH, 17) images:@[@{@"0":@"stationery_gray",@"3":@"stationery_select"},@{@"0":@"font_gray",@"3":@"font_select"},@{@"0":@"font_size_gray",@"3":@"font_size_select"},]];
    [styleSwitchView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.stylePanelView addSubview:styleSwitchView];
    [styleSwitchView setSelectedIndex:0];
    _styleSwitchView = styleSwitchView;
}

-(void)valueChanged:(SHSegmentView *)view
{
    NSLog(@"valueChanged:%zd",view.selectedIndex);
}

-(void)swipeGesAction:(UISwipeGestureRecognizer *)swipeGes
{
    NSLog(@"UISwipeGestureRecognizerDirection:%zd",swipeGes.direction);
    if (swipeGes.direction == UISwipeGestureRecognizerDirectionLeft) {
//        NSLog(@"UISwipeGestureRecognizerDirectionLeft");
        if (_styleSwitchView.selectedIndex  == 0) {
           
        }else
        {
            _styleSwitchView.selectedIndex = _styleSwitchView.selectedIndex - 1;    
        } 
    }else
    {
        if (_styleSwitchView.selectedIndex  == 2) {
            [self dismissFuncViewWithAnimation:^(BOOL finished) {
                
            }];
        }else
        {
            _styleSwitchView.selectedIndex = _styleSwitchView.selectedIndex + 1;    
        } 
    }
}

- (void)showFuncViewWithAnimation:(void (^__nullable)(BOOL finished))completion {
    [self.stylePanelView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-FUNC_VIEW_WIDTH);
    }];
    [self.stylePanelView setNeedsUpdateConstraints];
    [self.stylePanelView updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.275
                     animations:^{
                         self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:.2 alpha:.2];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)dismissFuncViewWithAnimation:(void (^__nullable)(BOOL finished))completion {
    [self.stylePanelView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_right);
    }];
    [self.stylePanelView setNeedsUpdateConstraints];
    [self.stylePanelView updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.275
                     animations:^{
                         self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:.2 alpha:.0];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (UIView *)stylePanelView {
    if (!_stylePanelView) {
        _stylePanelView = [[UIView alloc] init];
        _stylePanelView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA" alpha:1];
        _stylePanelView.layer.borderWidth = .5;
        _stylePanelView.layer.borderColor = [UIColor colorWithHexString:@"#000000" alpha:0.1].CGColor;
        _stylePanelView.layer.cornerRadius = 6;
        
        _stylePanelView.layer.shadowRadius = 3;
        _stylePanelView.layer.shadowColor = [UIColor colorWithHexString:@"#000000" alpha:1.0].CGColor;
        _stylePanelView.layer.shadowOpacity = .1;
        _stylePanelView.layer.shadowOffset = CGSizeMake(0, 0);
    }
    return _stylePanelView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
