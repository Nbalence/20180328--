//
//  QYOptionView.m
//  1601-青云猜图
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYOptionView.h"

@implementation QYOptionView

+(instancetype)optionView{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"QYOptionView" owner:self options:nil];
    return views.firstObject;
}

-(void)setTitles:(NSArray *)titles{
    _titles = titles;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //确保obj是UIButton类型的
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *optionBtn = (UIButton *)obj;
            //设置标题
            [optionBtn setTitle:titles[idx] forState:UIControlStateNormal];
            //设置标题字体大小
            optionBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
            //添加事件监听（点击）
            [optionBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }];
}

-(void)btnClick:(UIButton *)sender{
    NSLog(@"%s",__func__);
    if (_optionAction) {
        _optionAction(sender);
    }
}

-(void)setFrame:(CGRect)frame{
    CGRect originFrame = self.frame;
    originFrame.origin = frame.origin;
    [super setFrame:originFrame];
}
@end
