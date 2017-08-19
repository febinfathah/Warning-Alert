//
//  UIColor+Hex.h
//  ShowWarning
//
//  Created by XtraMac1 on 19/08/17.
//  Copyright © 2017 XtraMac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString*)hex;
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha;

@end
