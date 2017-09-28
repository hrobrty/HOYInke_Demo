//
//  HOYTabBar.h
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/27.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

typedef NS_ENUM(NSUInteger , HOYItemType){
    
    HOYItemTypeLaunch = 10,
    HOYItemTypeLive = 100 ,
    HOYItemTypeMe,
    
};

#import <UIKit/UIKit.h>

@class HOYTabBar ;

typedef void(^TabBlock)(HOYTabBar *tabbar,HOYItemType index);


@protocol HOYTabBarDelegate <NSObject>

- (void)tabbar:(HOYTabBar *)tabbar clinckButton:(HOYItemType) index ;

@end

@interface HOYTabBar : UIView


@property (nonatomic ,weak) id<HOYTabBarDelegate> tabbardelegate ;

@property (nonatomic ,copy) TabBlock block ;

@end
