//
//  HOYMainViewController.m
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/28.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import "HOYMainViewController.h"

@interface HOYMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScorllView;

@property (nonatomic ,strong) NSArray * datalist ;

@end

@implementation HOYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self initUIView];
    
}


- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"关注" , @"热门" ,@"附近"];
    }
    return _datalist ;
}

- (void)initUIView{
    // 添加左右按钮 ；
    [self setupNav];
    
    //  添加子视图控制器
    
    [self setupChildViewController];
    
    
}

-(void) setupChildViewController{
    
    NSArray *vcNames = @[@"HOYFocuseViewController" , @"HOYHotViewController" ,@"HOYNearViewController"];
    // 添加生命周期到mainview ；
    
    for ( int i  = 0; i < vcNames.count; i ++) {
        
        NSString * vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        vc.title = self.datalist[i];
        
        [self addChildViewController:vc] ;
        
    }
    
    // 将子控制器的view ，加到mainview的scroolingview上 ；
    // 设置scroolingview的contentsize ；
    
    self.contentScorllView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count , 0);
    
//   默认展示第二个界面
    self.contentScorllView.contentOffset = CGPointMake(self.contentScorllView.frame.size.width , 0);
    
    
}

- (void)setupNav {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat width = SCREEN_WIDTH ;
    CGFloat heigth = SCREEN_HEIGTH ;
    
    CGFloat offset = scrollView.contentOffset.x ;
    // 获取索引值 ；
    NSInteger idx = offset / width ;
    
//    根据索引值返回vc引用
    UIViewController * vc = self.childViewControllers[idx];
    
//    判断当前vc是否执行过
    if ([vc isViewLoaded]) return ;
    
//    设置子控制器大小
    
    vc.view.frame = CGRectMake(offset, 0, width, heigth);
    
//    将子控制器的view加载到scrollingview上
    
    [scrollView addSubview:vc.view];
    
    
}

@end
