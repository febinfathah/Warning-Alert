//
//  ErrorAlertView.m
//  ShowWarning
//
//  Created by XtraMac1 on 19/08/17.
//  Copyright © 2017 XtraMac1. All rights reserved.
//

#import "ErrorAlertView.h"
#import "UIView+Additions.h"
#import "UIColor+Hex.h"


@interface ErrorAlertView() {

}
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation ErrorAlertView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self loadNib];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self){
        [self loadNib];
    }

    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message andImage:(UIImage *) image {
    
    self = [super init];
    if (self) {
        [self loadNib];
        self.title = title;
        self.message = message;
        self.image = image;
    }
    
    return self;
}

#pragma mark - IBActions
- (IBAction)closePressed:(id)sender {
    [self dismissAlertWithAnimation:YES];
}


#pragma mark - Functions
- (void)loadNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"ErrorAlertView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = [UIColor colorWithR:0 G:0 B:0 alpha:0.5];
    self.showCloseButton = NO;
    UISwipeGestureRecognizer *ges =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [self.backgroundView addGestureRecognizer:ges];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeGes{
     if (swipeGes.direction == UISwipeGestureRecognizerDirectionDown){
         [self dismissAlertWithAnimation:true];
    }
}


#pragma mark - Setter Methods
- (void)setImage:(UIImage *)image {
    _imageView.image = image;
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)setMessage:(NSString *)message {
    _messageLabel.text = message;
}

- (void)setShowCloseButton:(BOOL)showCloseButton{
    _closeButton.hidden = !showCloseButton;
}

#pragma mark - Present and dismiss AlertView
- (void)presentAlertWithAnimation:(BOOL) animation {
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

    if (animation) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        [window addConstraintsWithFormat:@"H:|[V0]|" forViews:@[self] andKeys:@[@"V0"]];
        [window addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];

        
        CGFloat height = self.contentView.height;
        CGFloat y = window.height - height;
        self.frame = CGRectMake(0, window.height, window.width, height);
        [UIView animateWithDuration:0.35 delay:0.1f usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.frame = CGRectMake(0, y, window.width, height);
            NSLog(@"%@", NSStringFromCGRect(self.frame));
        } completion:nil];
    }
    else{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
    }
    
}

- (void)dismissAlertWithAnimation:(BOOL)animation {
    
    if (animation){
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //        [window addSubview:self];
        CGFloat height = self.height;
        CGFloat y = window.height - height;
        self.frame = CGRectMake(0, y, window.width, height);
        [UIView animateWithDuration:0.35f delay:0.1f usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.frame = CGRectMake(0, window.height, window.width, height);
            NSLog(@"%@", NSStringFromCGRect(self.frame));
        } completion:^(BOOL finished) {
            if (finished) {
                [self removeFromSuperview];
            }
        }];
    }
    else{
        [self removeFromSuperview];
    }
}


@end
