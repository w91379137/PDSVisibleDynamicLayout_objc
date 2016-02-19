//
//  IBDesignableView.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "IBDesignableView.h"

@implementation IBDesignableView

#pragma mark - IB_DESIGNABLE
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self xibSetup:NSStringFromClass([self class])];
        [self dataSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self xibSetup:NSStringFromClass([self class])];
        [self dataSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame XibName:(NSString *)xibName
{
    self = [super initWithFrame:frame];
    if (self) {
        [self xibSetup:xibName];
        [self dataSetup];
    }
    return self;
}

#pragma mark - Xib Setup
- (void)xibSetup:(NSString *)xibName
{
    UIView *view = [self loadViewFromNib:xibName];
    [self addSubview:view];
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UIView *)loadViewFromNib:(NSString *)xibName
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:xibName bundle:bundle];
    self.mainContainerView = (UIView *)[nib instantiateWithOwner:self options:nil][0];
    return self.mainContainerView;
}

#pragma mark - Data Setup
- (void)dataSetup
{
    
}



@end
