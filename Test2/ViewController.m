//
//  ViewController.m
//  Test2
//
//  Created by btcc on 27/8/2019.
//  Copyright © 2019 btcc. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView * mainScrollView ;
@property (nonatomic,strong) UIImageView * headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 212)];
    _headerView.image = [UIImage imageNamed:@"WechatIMG1"];
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 997.5);
    _mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    UIImageView * contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 552.5)];
    contentView.image = [UIImage imageNamed:@"WechatIMG3"];
    UIImageView * contentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 552.5, [UIScreen mainScreen].bounds.size.width, 445)];
    contentView2.image = [UIImage imageNamed:@"WechatIMG2"];
    [_mainScrollView addSubview:contentView];
    [_mainScrollView addSubview:contentView2];
    
    _mainScrollView.delegate = self;
    [self.view addSubview:_headerView];
    [self.view addSubview:_mainScrollView];
    
    // Do any additional setup after loading the view.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ( scrollView.contentOffset.y >= 0) {
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    if (scrollView.contentOffset.y>=-212 && scrollView.contentOffset.y<0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (!decelerate) {
        [self scrollViewDidEndDecelerating:scrollView];
    }
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y>=-100 && scrollView.contentOffset.y<0) {
        [UIView animateWithDuration:0.25 animations:^{
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            scrollView.contentOffset = CGPointMake(0, 0);
        }];
    }
    if (scrollView.contentOffset.y<-100 && scrollView.contentOffset.y>-212) {
        [UIView animateWithDuration:0.25 animations:^{
            scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
            scrollView.contentOffset =CGPointMake(0, -212);
        }];
    }
}
@end
