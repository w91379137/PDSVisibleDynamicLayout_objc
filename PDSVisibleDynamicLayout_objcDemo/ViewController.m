//
//  ViewController.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)change:(id)sender
{
    [self animate:^{
        view1.layout = BlackRedViewLayoutInit;
    }];
}

- (IBAction)change2:(id)sender
{
    [self animate:^{
        view1.layout = BlackRedViewLayoutOther;
    }];
}

- (void)animate:(void (^)())block
{
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:block
                     completion:nil];
}

@end
