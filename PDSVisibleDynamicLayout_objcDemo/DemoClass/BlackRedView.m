//
//  BlackRedView.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "BlackRedView.h"
#import "UIView+PDSDynamicView.h"

@implementation BlackRedView

- (void)setLayout:(BlackRedViewLayout)layout
{
    if (_layout == layout) {
        return;
    }
    _layout = layout;
    
    if (!currentConstraints) {
        currentConstraints = [NSMutableArray array];
    }
    [self update:currentConstraints isInstall:NO];
    
    NSString *key = nil;
    
    switch (_layout) {
        case BlackRedViewLayoutInit:break;
        case BlackRedViewLayoutOther: key = @"BlackRedView2"; break;
        default:break;
    }
    
    if (key) {
        [currentConstraints addObjectsFromArray:[self constraintsOfKey:key]];
    }
    
    [self layoutIfNeeded];
}

- (NSArray *)createConstraintsOfKey:(NSString *)key
{
    BlackRedView *otherOne =
    [[BlackRedView alloc] initWithFrame:CGRectZero XibName:key];
    
    NSArray *sourceViews =
    @[otherOne.mainContainerView,
      otherOne.blackView,
      otherOne.redView];
    
    NSArray *inputViews =
    @[self.mainContainerView,
      self.blackView,
      self.redView];
    
    return [self pairCopyArray1:sourceViews Array2:inputViews];
}

@end
