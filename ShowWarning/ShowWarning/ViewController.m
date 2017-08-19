//
//  ViewController.m
//  ShowWarning
//
//  Created by XtraMac1 on 19/08/17.
//  Copyright © 2017 XtraMac1. All rights reserved.
//

#import "ViewController.h"
#import "ErrorAlertView.h"

@interface ViewController (){
    ErrorAlertView *alertView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showWarning:(id)sender {
    
    [self showAlertWith:[UIImage imageNamed:@"no-range"] title:@"Sorry!" message:@"No internet connectivity!"];
}

- (void)showAlertWith:(UIImage *)image title:(NSString *) title message:(NSString *) message {
    alertView = [[ErrorAlertView alloc] init];
    alertView.image = image;
    alertView.title = title;
    alertView.message = message;
    [alertView presentAlertWithAnimation:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertView dismissAlertWithAnimation:YES];
    });

    
}

@end
