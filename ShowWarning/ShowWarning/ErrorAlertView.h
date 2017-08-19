//
//  ErrorAlertView.h
//  ShowWarning
//
//  Created by XtraMac1 on 19/08/17.
//  Copyright © 2017 XtraMac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ErrorAlertView : UIView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) BOOL showCloseButton;

- (void)presentAlertWithAnimation:(BOOL) animation;
- (void)dismissAlertWithAnimation:(BOOL) animation;



@end
