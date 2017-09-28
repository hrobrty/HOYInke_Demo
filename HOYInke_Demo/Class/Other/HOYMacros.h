//
//  HOYMacros.h
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/15.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#ifndef HOYMacros_h
#define HOYMacros_h

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGTH [UIScreen mainScreen].bounds.size.height

#define RGB(a ,b ,c)  [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

#define UIColorFromHex(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16)) / 255.0 green:(((s & 0xFF00) >> 8)) / 255.0 blue:((s & 0xFF)) / 255.0 alpha:1.0]


#endif /* HOYMacros_h */

