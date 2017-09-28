//
//  HOYTabBar.m
//  HOYInke_Demo
//
//  Created by hrobrty on 2017/9/27.
//  Copyright © 2017年 com.hrobrty. All rights reserved.
//

#import "HOYTabBar.h"

@interface HOYTabBar ()

@property (nonatomic , strong) UIImageView *tabbgView ;

@property (nonatomic ,strong) NSArray *datalist ;

@property (nonatomic ,strong) UIButton *lastItem ;

@property (nonatomic ,strong) UIButton *cameraButton ;

@end

@implementation HOYTabBar

- (UIButton *)cameraButton {
    
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        
      //  [_cameraButton sizeToFit];
        
        _cameraButton.tag = HOYItemTypeLaunch ;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return  _cameraButton ;
}

-(NSArray *)datalist{
    if (!_datalist) {
        
        _datalist = @[@"tab_live" , @"tab_me"];
    }
    return _datalist ;
}

- (UIImageView *)tabbgView{
    
    if (!_tabbgView) {
        
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView ;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //装载背景
        [self addSubview:self.tabbgView];
        // 装载item
        for (int i = 0; i < self.datalist.count; i ++ ) {
            
            
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            
            // 高亮状态不自适应图片；
            item.adjustsImageWhenHighlighted =  NO ;
            
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = HOYItemTypeLive + i ;
            
            if (i == 0) {
                
                item.selected = YES ;
                
                self.lastItem = item ;
            }
            
            [self addSubview:item];
        }
     
        
        //添加直播按钮；
        
        [self addSubview:self.cameraButton];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds ;
    
    for (int i = 0; i < [self subviews].count; i ++) {
        
        UIView *btn = [self subviews][i];
        
        CGFloat width = self.bounds.size.width / self.datalist.count ;
        
        
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake((btn.tag - HOYItemTypeLive) *width, 0, width,self.frame.size.height ) ;
            
        }
    }
    
     [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size
                                           .width /2, self.bounds.size.height - 40) ;
   
    
}

- (void)clickItem:(UIButton *)button{
    
    if ([self.tabbardelegate respondsToSelector:@selector(tabbar:clinckButton:)]) {
        
        [self.tabbardelegate  tabbar:self clinckButton:button.tag] ;
        
        
    }
    
    !self.block ?:self.block(self,button.tag);
    
    
    if (button.tag == HOYItemTypeLaunch) {
        
        return ;
    }
    
    
    self.lastItem.selected = NO ;
    
    button.selected = YES ;
    
    self.lastItem = button ;
    
    // 设置动画；
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        // 扩大1.2倍 ；
        button.transform = CGAffineTransformMakeScale(1.2, 1.2) ;
        
    } completion:^(BOOL finished) {
    // 还原 ；
        [UIView animateWithDuration:0.2 animations:^{
            
            button.transform = CGAffineTransformIdentity;
            
            
            
        }];
        
    }];
 
    
    
}




@end
