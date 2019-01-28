//
//  DAlertView.h
//  DAlertView
//
//  Created by Destiny on 2019/1/15.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DAlertAction.h"

typedef NS_ENUM(NSInteger, AlertAnimationType) {
    AlertAnimationTypeDefault = 0, // 默认动画，如果是SPAlertControllerStyleActionSheet样式,默认动画等效于SPAlertAnimationTypeFromBottom，如果是SPAlertControllerStyleAlert样式,默认动画等效于SPAlertAnimationTypeShrink
    AlertAnimationTypeFromBottom,  // 从底部弹出
    AlertAnimationTypeFromTop,     // 从顶部弹出
    AlertAnimationTypeFromRight,   // 从右边弹出
    AlertAnimationTypeFromLeft,    // 从左边弹出
    
    AlertAnimationTypeShrink,      // 收缩动画
    AlertAnimationTypeExpand,      // 发散动画
    AlertAnimationTypeFade,        // 渐变动画
    
    AlertAnimationTypeNone,        // 无动画
    AlertAnimationTypeAlpha , // 渐变动画
    AlertAnimationTypeRaiseUp, // 从底部弹出
    AlertAnimationTypeDropDown , // 从顶部弹出
};

NS_ASSUME_NONNULL_BEGIN

@interface DAlertView : UIView

/** 主标题 */
@property(nullable, nonatomic, copy) NSString *title;
/** 副标题 */
@property(nullable, nonatomic, copy) NSString *message;
/** 动画类型 */
@property(nonatomic, readonly) AlertAnimationType animationType;
/** 自定义View */
@property (nonatomic, strong) UIView *customAlertView;
/** 主标题颜色 */
@property(nonatomic, strong) UIColor *titleColor;
/** 主标题字体,默认18,加粗 */
@property(nonatomic, strong) UIFont *titleFont;
/** 副标题颜色 */
@property(nonatomic, strong) UIColor *messageColor;
/** 副标题颜色 */
@property(nonatomic, strong) UIColor *lineColor;
/** 副标题字体,默认16,未加粗 */
@property(nonatomic, strong) UIFont *messageFont;
/** 对齐方式(包括主标题和副标题) */
@property(nonatomic, assign) NSTextAlignment textAlignment;
/** 点击背景是否消失（用于只点击按钮才能消失） */
@property(nonatomic, assign) Boolean isTapDismiss;

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;

// 添加action
- (void)addAction:(DAlertAction *)action;

- (void)show;


@end

NS_ASSUME_NONNULL_END
