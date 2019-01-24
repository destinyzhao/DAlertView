//
//  DAlertAction.h
//  DAlertView
//
//  Created by Destiny on 2019/1/15.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DAlertActionStyle) {
    DAlertActionStyleDefault = 0,  // 默认样式
    DAlertActionStyleCancel,       // 取消样式
};

NS_ASSUME_NONNULL_BEGIN

@interface DAlertAction : NSObject

/**标题*/
@property (copy, nonatomic) NSString *title;
/**标题字体*/
@property (strong, nonatomic) UIFont *titleFont;
/**标题颜色*/
@property (strong, nonatomic) UIColor *titleColor;
/**回调*/
@property (copy, nonatomic) void (^handler)(DAlertAction *action);
/**Action 式样*/
@property (assign, nonatomic) DAlertActionStyle style;

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(DAlertActionStyle)style handler:(void (^ __nullable)(DAlertAction *action))handler;


@end

NS_ASSUME_NONNULL_END
