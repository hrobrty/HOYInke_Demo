//
//  HOYTabBarViewController.m
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/27.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import "HOYTabBarViewController.h"
#import "HOYTabBar.h"
#import "HOYBaseNavigationController.h"
#import "HOYLaunchViewController.h"

@interface HOYTabBarViewController ()<HOYTabBarDelegate>

@property (nonatomic ,strong) HOYTabBar *hoyTabbar ;

@end

@implementation HOYTabBarViewController

- (HOYTabBar *)hoyTabbar{
    
    if (!_hoyTabbar) {
        
        _hoyTabbar = [[HOYTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        
        _hoyTabbar.tabbardelegate = self ;
    }
    
    return _hoyTabbar ;
}


- (void)tabbar:(HOYTabBar *)tabbar clinckButton:(HOYItemType)index{
    
    
    if (index != HOYItemTypeLaunch) {
        
         self.selectedIndex = index - HOYItemTypeLive ;
        
        return ;
    }
    
    NSLog(@" i am touched!");
    HOYLaunchViewController *launchVc = [[HOYLaunchViewController alloc] init];
    
    [self presentViewController:launchVc animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载 控制器
    [self configViewController];
    
    
    // 加载tabbar ；
    [self.tabBar addSubview:self.hoyTabbar];
    
    // 取消横线 ；
    [[UITabBar appearance ] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)configViewController{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"HOYMainViewController",@"HOYMeViewController"]];
    
    for (int i = 0; i < array.count; i ++) {
        
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        HOYBaseNavigationController *nav = [[HOYBaseNavigationController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
        
    }
    
    self.viewControllers = array ;
    
}

@end
