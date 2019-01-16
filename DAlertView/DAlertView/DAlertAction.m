//
//  DAlertAction.m
//  DAlertView
//
//  Created by Destiny on 2019/1/15.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "DAlertAction.h"

@implementation DAlertAction

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(DAlertActionStyle)style handler:(void (^ __nullable)(DAlertAction *action))handler {
    DAlertAction *action = [[self alloc] initWithTitle:title style:(DAlertActionStyle)style handler:handler];
    return action;
}

- (instancetype)initWithTitle:(nullable NSString *)title style:(DAlertActionStyle)style handler:(void (^ __nullable)(DAlertAction *action))handler {
    self = [self init];
    self.title = title;
    self.style = style;
    self.handler = handler;
    
    if (style == DAlertActionStyleDefault) {
        self.titleColor = [UIColor blackColor];
        self.titleFont = [UIFont systemFontOfSize:13.f];
    } else {
        self.titleColor = [UIColor blackColor];
        self.titleFont = [UIFont systemFontOfSize:13.f];
    }
    return self;
}

@end
