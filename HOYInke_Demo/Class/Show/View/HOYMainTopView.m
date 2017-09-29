//
//  HOYMainTopView.m
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/29.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import "HOYMainTopView.h"


@interface HOYMainTopView()

@property (nonatomic ,strong) UIView *lineView ;

@property (nonatomic ,strong) NSMutableArray *buttons ;

@end

@implementation HOYMainTopView

- (NSMutableArray *)buttons{
    
    if (!_buttons) {
        
        _buttons = [NSMutableArray array];
        
    }
    return _buttons ;
}


-(UIView *)lineView{
    
    if (!_lineView) {
        
        _lineView = [[UIView alloc] init];
    }
    return _lineView ;
    
}

- (instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CGFloat btnW = self.width / titles.count ;
        CGFloat btnH = self.height;
    
        for (int i = 0; i < titles.count; i ++ ) {
        
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            NSString *titleName = titles[i];
           // 设置按钮名字 ；
            [titleBtn setTitle:titleName forState:UIControlStateNormal];
            // 设置按钮颜色 ；
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            // 设置按钮字体大小 ；
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            // 设置按钮位置 ；
            titleBtn.frame = CGRectMake(i * btnW, 0, btnW, btnH) ;
            // 设置按钮事件；
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            titleBtn.tag = i ;
            
            [self.buttons addObject:titleBtn];
            
            [self addSubview:titleBtn];
            
            
            if (i == 1) {
                
                CGFloat h = 2 ;
                CGFloat w = 40 ;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h ;
                self.lineView.width = titleBtn.titleLabel.width ;
                
                self.lineView.top = w ;
                self.lineView.centerX = titleBtn.centerX ;
                
                [self addSubview:self.lineView];
                
            }
            
        }

        
    }
    return self;
}


- (void)scrolling:(NSInteger)tag {
    
    UIButton *button = self.buttons[tag];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.lineView.centerX = button.centerX ;
        
    }];
    
    
}

- (void)titleClick:(UIButton *)button {
    
    self.block(button.tag);
    
    [self scrolling:button.tag];
    
    
}


@end
