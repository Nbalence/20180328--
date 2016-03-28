//
//  QYAnswerView.h
//  1601-青云猜图
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAnswerView : UIView
@property (nonatomic, strong) void (^answerAction)(UIButton *answerBtn);
@property (nonatomic, strong) NSMutableArray *answerBtnIndexs;                  //anserView中需要填写的btn在answerView的subViews中的索引
+(instancetype)answerViewWithAnswerLength:(NSUInteger)length;
@end
