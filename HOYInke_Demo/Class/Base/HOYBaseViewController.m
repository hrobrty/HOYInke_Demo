//
//  HOYBaseViewController.m
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/28.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import "HOYBaseViewController.h"

@interface HOYBaseViewController ()

@end

@implementation HOYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor =    RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
