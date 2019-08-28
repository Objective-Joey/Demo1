//
//  ViewController.m
//  Test
//
//  Created by btcc on 27/8/2019.
//  Copyright © 2019 btcc. All rights reserved.
//

#import "ViewController.h"
#import "TBaseScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView * headerView;
@property (nonatomic,strong) UIScrollView * subScrollView;
@property (nonatomic,strong) TBaseScrollView * mainScrollView;
@property (nonatomic,strong) UIPanGestureRecognizer * ges;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    _headerView.backgroundColor = [UIColor yellowColor];
    _mainScrollView = [[TBaseScrollView alloc] initWithFrame:self.view.bounds];
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
    _mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    UIView * contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 400)];
    contentView.backgroundColor = [UIColor greenColor];
    UIView * contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 400)];
    contentView2.backgroundColor = [UIColor blueColor];
    [_mainScrollView addSubview:contentView];
    [_mainScrollView addSubview:contentView2];
    [self.view addGestureRecognizer:self.ges];
    _mainScrollView.delegate = self;
    [self.view addSubview:_headerView];
    [self.view addSubview:_mainScrollView];

    // Do any additional setup after loading the view.
}

-(void)pan:(UIPanGestureRecognizer *)gesture{

//    if (_mainScrollView.frame.origin.y >=120) {
//        _mainScrollView.scrollEnabled = YES;
//        [_mainScrollView removeGestureRecognizer:self.ges];
//        return;
//    }
    UIView * view = gesture.view;
    CGPoint translation = [gesture translationInView:view.superview];
    CGRect rect = view.bounds;

    if (_mainScrollView.frame.origin.y<100&& translation.y>=0) {

        CGFloat y = _mainScrollView.frame.origin.y;
        CGFloat new = y + translation.y;
        if (new>100) {
            new = 100;
        }
        _mainScrollView.frame =  CGRectMake(0,new, rect.size.width, rect.size.height);
    }
    
    if (_mainScrollView.frame.origin.y>=100&& translation.y<0) {
        
        CGFloat y = _mainScrollView.frame.origin.y;
        CGFloat new = y + translation.y;
        if (new<0) {
            new = 0;
        }
        _mainScrollView.frame =  CGRectMake(0,new, rect.size.width, rect.size.height);
    }
}
//
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{


}
//
-(UIPanGestureRecognizer *)ges{
    if (!_ges) {
        _ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    }
    return _ges;
}
@end
