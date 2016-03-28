//
//  QYOptionView.h
//  1601-青云猜图
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYOptionView : UIView
@property (nonatomic, strong) NSArray *titles;      //optionView中optionBtn标题集合
@property (nonatomic, strong) void (^optionAction) (UIButton *optionBtn);

+(instancetype)optionView;
@end
