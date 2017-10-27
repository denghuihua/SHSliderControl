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
#import "SHFontSizeSelectView.h"
#import "SHFontTypeSelectView.h"
#import "SHStationerySelectView.h"


#define FUNC_VIEW_CORNER_RADIUS 6
#define FUNC_VIEW_WIDTH 114 


@interface SHStylePanelViewController ()
{
    SHSegmentView *_styleSwitchView;
    
}
@property (strong, nonatomic) UIView *stylePanelView;
@property (strong, nonatomic) SHSegmentView *styleSwitchView;
@property (strong, nonatomic) SHFontSizeSelectView *fontSizeSelectView;
@property (strong, nonatomic) SHFontTypeSelectView *fontTypeSelectView;
@property (strong, nonatomic) SHStationerySelectView *stationerySelectView;
@end

@implementation SHStylePanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
    [self addSubviews];
    [self addGesture];
}

-(void)viewDidLayoutSubviews
{
    [self layoutSubviews];
}

-(void)addSubviews
{
   [self.view addSubview:self.stylePanelView]; 
     [self.stylePanelView addSubview:self.styleSwitchView];
     [self.stylePanelView addSubview:self.fontSizeSelectView];
}

-(void)layoutSubviews
{
    NSLog(@"layoutSubviews:%@",NSStringFromCGRect(self.view.frame));
    [self.stylePanelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.frame.size.width);
        make.height.mas_equalTo(408);
        make.width.mas_equalTo(FUNC_VIEW_WIDTH + FUNC_VIEW_CORNER_RADIUS/2);
        make.top.mas_equalTo(88);
    }];
    [self.styleSwitchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.stylePanelView);
        make.height.mas_equalTo(17);
        make.top.mas_equalTo(11);
    }];
    CGFloat top = 28;
    [self.fontSizeSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.stylePanelView);
        make.top.mas_equalTo(top);
    }];
}

-(void)addGesture
{
    UISwipeGestureRecognizer *dirLeftGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesAction:)];   
    dirLeftGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: dirLeftGes];
    
    UISwipeGestureRecognizer *dirRightGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesAction:)];   
    dirRightGes.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: dirRightGes];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction:)];   
    [self.view addGestureRecognizer: tapGes];
}

#pragma mark - Actions

-(void)valueChanged:(SHSegmentView *)view
{
    NSLog(@"valueChanged:%zd",view.selectedIndex);
}

-(void)swipeGesAction:(UISwipeGestureRecognizer *)swipeGes
{
    NSLog(@"UISwipeGestureRecognizerDirection:%zd",swipeGes.direction);
    if (CGRectContainsPoint(_stylePanelView.frame, [swipeGes locationInView:self.view])) {
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
}

-(void)tapGesAction:(UITapGestureRecognizer *)tapGes
{
    if (CGRectContainsPoint(_stylePanelView.frame, [tapGes locationInView:self.view])) {
        
    }else{
        [self dismissFuncViewWithAnimation:^(BOOL finished) {
            
        }];   
    }
}

#pragma mark - NormalMethods

- (void)showFuncViewWithAnimation:(void (^__nullable)(BOOL finished))completion {
    [self.stylePanelView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(FUNC_VIEW_CORNER_RADIUS/2);
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
                         [self.view removeFromSuperview];
                         [self removeFromParentViewController];
                     }];
}

#pragma mark - Getters and setters

- (UIView *)styleSwitchView {
    if (!_styleSwitchView) {
//        SHSegmentView *styleSwitchView = [[SHSegmentView alloc] initWithFrame:CGRectMake(0, 11, FUNC_VIEW_WIDTH, 17) images:@[@{@"0":@"stationery_gray",@"3":@"stationery_select"},@{@"0":@"font_gray",@"3":@"font_select"},@{@"0":@"font_size_gray",@"3":@"font_size_select"},]];
        _styleSwitchView = [[SHSegmentView alloc] initWithImages:@[@{@"0":@"stationery_gray",@"3":@"stationery_select"},@{@"0":@"font_gray",@"3":@"font_select"},@{@"0":@"font_size_gray",@"3":@"font_size_select"},]];
        
        [_styleSwitchView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [_styleSwitchView setSelectedIndex:0];
        _styleSwitchView.backgroundColor = [UIColor yellowColor];
        
    }
    return _styleSwitchView;
}

- (UIView *)stylePanelView {
    if (!_stylePanelView) {
        _stylePanelView = [[UIView alloc] init];
        _stylePanelView.clipsToBounds = YES;
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

- (UIView *)fontSizeSelectView {
    if (!_fontSizeSelectView) {
        _fontSizeSelectView = [[SHFontSizeSelectView alloc] init];
        _fontSizeSelectView.backgroundColor = [UIColor redColor];
    }
    return _fontSizeSelectView;
}

- (UIView *)fontTypeSelectView {
    if (!_fontTypeSelectView) {
        _fontTypeSelectView = [[SHFontTypeSelectView alloc] init];
        _fontTypeSelectView.backgroundColor = [UIColor greenColor];
    }
    return _fontTypeSelectView;
}

- (UIView *)stationerySelectView{
    if (!_stationerySelectView) {
        _stationerySelectView = [[SHStationerySelectView alloc] init];
        _stationerySelectView.backgroundColor = [UIColor blueColor];
    }
    return _stationerySelectView;
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
