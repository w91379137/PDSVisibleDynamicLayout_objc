//
//  BlackRedView.h
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "IBDesignableView.h"

typedef NS_ENUM(NSUInteger, IBDesignableViewLayout) {
    IBDesignableViewLayoutInit,
    IBDesignableViewLayout2
};

@interface BlackRedView : IBDesignableView

@property (nonatomic) IBDesignableViewLayout layout;
@property (nonatomic, strong) IBOutlet UIView *blackView;
@property (nonatomic, strong) IBOutlet UIView *redView;

@end
