//
//  UIView+PDSDynamicView.h
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PDSDynamicView)

- (NSArray *)pairCopyArray1:(NSArray *)array1
                     Array2:(NSArray *)array2;

- (NSArray *)copyFromView:(UIView *)view1
                   ToView:(UIView *)view2
                   array1:(NSArray *)array1
                   array2:(NSArray *)array2;

@end
