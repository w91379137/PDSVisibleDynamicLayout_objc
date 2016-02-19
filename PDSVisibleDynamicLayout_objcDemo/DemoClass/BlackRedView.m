//
//  BlackRedView.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "BlackRedView.h"
#import "UIView+PairCopyLayout.h"

@interface BlackRedView()
{
    NSMutableArray *currentConstraints;
}

@end


@implementation BlackRedView

-(void)dataSetup
{
    [super dataSetup];
    _layout = IBDesignableViewLayoutInit;
}

- (void)setLayout:(IBDesignableViewLayout)layout
{
    if (_layout == layout) {
        return;
    }
    _layout = layout;
    
    if (currentConstraints != nil) {
        for (id obj in currentConstraints)
        {
            if([obj isKindOfClass:MASConstraint.class]) {
                [(MASConstraint *)obj uninstall];
            }
            else if([obj isKindOfClass:NSArray.class]) {
                for (MASConstraint * constraint in (NSArray *)obj)
                {
                    [constraint uninstall];
                }
            }
        }
    }
    
    if (currentConstraints == nil) {
        currentConstraints = [NSMutableArray array];
    }
    
    NSString *xibName = nil;
    
    switch (_layout) {
        case IBDesignableViewLayoutInit:break;
        case IBDesignableViewLayout2:
            xibName = @"BlackRedView2";
            break;
        default:break;
    }
    
    if (xibName) {
        BlackRedView *otherOne =
        [[BlackRedView alloc] initWithFrame:CGRectZero XibName:xibName];
        
        NSArray *sourceViews =
        @[otherOne.mainContainerView,
          otherOne.blackView,
          otherOne.redView];
        
        NSArray *inputViews =
        @[self.mainContainerView,
          self.blackView,
          self.redView];
        
        [currentConstraints addObjectsFromArray:[self pairCopyArray1:sourceViews Array2:inputViews]];
    }
    
    [self layoutIfNeeded];
}

@end
