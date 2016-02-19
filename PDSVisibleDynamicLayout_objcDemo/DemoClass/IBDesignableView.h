//
//  IBDesignableView.h
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface IBDesignableView : UIView

- (instancetype)initWithFrame:(CGRect)frame XibName:(NSString *)xibName;
- (void)dataSetup;

@property (nonatomic, strong) UIView *mainContainerView;

@end
