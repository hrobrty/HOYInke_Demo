//
//  HOYMainTopView.h
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/29.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^topBlock)(NSInteger index);

@interface HOYMainTopView : UIView
// 重写构造方法 ；
- (instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *)titles ;

- (void)scrolling:(NSInteger)tag ;

@property (nonatomic ,copy) topBlock block ;



@end
