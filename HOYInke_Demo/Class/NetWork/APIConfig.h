//
//  APIConfig.h
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/29.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject
//信息服务器地址
#define SERVER_HOST @"ttp://service.ingkee.com"
//图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn"
//热门直播
#define API_HotLive @"api/live/gettop"
//附近的人
#define API_NearLive @"api/live/near_recommend"
//广告地址
#define API_Advertise @"advertise/get"//?uid=85149891&latitude=40.090562&longitude=116.413353


@end
