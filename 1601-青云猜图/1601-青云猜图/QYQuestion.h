//
//  QYQuestion.h
//  1601-青云猜图
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYQuestion : NSObject
//声明属性
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *options;
//当前题目的答案长度
@property (nonatomic) NSUInteger length;
//初始化方法

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)questionWithDictionary:(NSDictionary *)dict;
@end
