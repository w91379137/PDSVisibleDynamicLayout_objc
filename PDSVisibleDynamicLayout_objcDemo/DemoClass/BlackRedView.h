//
//  BlackRedView.h
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "PDSDynamicView.h"

typedef NS_ENUM(NSUInteger, BlackRedViewLayout) {
    BlackRedViewLayoutInit,
    BlackRedViewLayoutOther
};

@interface BlackRedView : PDSDynamicView

@property (nonatomic) BlackRedViewLayout layout;
@property (nonatomic, strong) IBOutlet UIView *blackView;
@property (nonatomic, strong) IBOutlet UIView *redView;

@end
