//
//  QYAnswerView.m
//  1601-青云猜图
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAnswerView.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@implementation QYAnswerView
+(instancetype)answerViewWithAnswerLength:(NSUInteger)length{
    //创建answerView
    QYAnswerView *answerView = [[QYAnswerView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 44)];
    //添加子视图 answerBtn （宽高：44）
    for (int i = 0; i < length; i++) {
        //定义两个相邻的answerBtn横向间距
        CGFloat space = 10;
        //宽高
        CGFloat answerBtnW = 44;
        CGFloat answerBtnH = 44;
        //计算左边answerBtn距离屏幕左边的间距
        CGFloat baseSpaceX = (QYScreenW - answerBtnW * length - space * (length - 1)) / 2.0;
        //计算当前answerBtn的位置
        CGFloat answerBtnX = baseSpaceX + i * (answerBtnW + space);
        CGFloat answerBtnY = 0;
        //创建并添加answerBtn
        UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [answerView addSubview:answerBtn];
        answerBtn.frame = CGRectMake(answerBtnX, answerBtnY, answerBtnW, answerBtnH);
        //添加背景图片
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        //设置字体颜色
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //添加事件监听
        [answerBtn addTarget:answerView action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return answerView;
}

-(void)btnClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    if (_answerAction) {
        _answerAction(sender);
    }
}

//重写setFrame方法
-(void)setFrame:(CGRect)frame{
/*
 1、取出初始化的时候answerView的frame
 2、用传过来的frame中的origin来代替初始化的frame
 3、把最终的frame给answerView
 */
    CGRect frame1 = self.frame;
  
    frame1.origin = frame.origin;
    //不能直接写成 self.frame = frame,因为在setFrame方法中不能调用setFrame方法，父类的setFrame方法是直接赋值
    [super setFrame:frame1];
}

//anserView中需要填写的btn在answerView的subViews中的索引
- (NSMutableArray *)answerBtnIndexs {
    if (_answerBtnIndexs == nil) {
        //初始化_answerBtnIndexs
        _answerBtnIndexs = [NSMutableArray array];
        for (int i = 0; i < self.subviews.count; i++) {
            //添加索引到_answerBtnIndexs中
            [_answerBtnIndexs addObject:@(i)];
        }
    }
    return _answerBtnIndexs;
}
@end
