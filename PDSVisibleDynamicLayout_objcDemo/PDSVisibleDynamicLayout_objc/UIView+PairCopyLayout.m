//
//  UIView+PairCopyLayout.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "UIView+PairCopyLayout.h"
#import "Masonry.h"

@implementation UIView (PairCopyLayout)

- (NSArray *)pairCopyArray1:(NSArray *)array1 Array2:(NSArray *)array2
{
    NSMutableArray *constraintMakers = [NSMutableArray array];
    
    for (NSInteger k = 0; k < array1.count; k++) {
        
        UIView *sourceView = array1[k];
        UIView *inputView = array2[k];
        
        [constraintMakers addObjectsFromArray:
         [self copyFromView:sourceView
                     ToView:inputView
                     array1:array1
                     array2:array2]];
    }
    return constraintMakers;
}

- (NSArray *)copyFromView:(UIView *)view1 ToView:(UIView *)view2 array1:(NSArray *)array1 array2:(NSArray *)array2
{
    NSMutableArray *constraintMakers = [NSMutableArray array];
    
    //NSLog(@"%lu",(unsigned long)view1.constraints.count);
    
    for (NSLayoutConstraint *constraint in view1.constraints) {
        //NSLog(@"%@",constraint);
        UIView *firstItem = [self findView:constraint.firstItem array1:array1 array2:array2];
        UIView *secondItem = [self findView:constraint.secondItem array1:array1 array2:array2];
        
        [constraintMakers addObjectsFromArray:
         [firstItem mas_updateConstraints:^(MASConstraintMaker *make) {
            
            id secondAttribute = nil;
            
            if (secondItem) {
                switch (constraint.secondAttribute) {
                    case NSLayoutAttributeLeft:
                        secondAttribute = secondItem.mas_left;
                        break;
                    case NSLayoutAttributeRight:
                        secondAttribute = secondItem.mas_right;
                        break;
                    case NSLayoutAttributeTop:
                        secondAttribute = secondItem.mas_top;
                        break;
                    case NSLayoutAttributeBottom:
                        secondAttribute = secondItem.mas_bottom;
                        break;
                    case NSLayoutAttributeLeading:
                        secondAttribute = secondItem.mas_leading;
                        break;
                    case NSLayoutAttributeTrailing:
                        secondAttribute = secondItem.mas_trailing;
                        break;
                        
                    case NSLayoutAttributeWidth:
                        secondAttribute = secondItem.mas_width;
                        break;
                    case NSLayoutAttributeHeight:
                        secondAttribute = secondItem.mas_height;
                        break;
                        
                    case NSLayoutAttributeCenterX:
                        secondAttribute = secondItem.mas_centerX;
                        break;
                    case NSLayoutAttributeCenterY:
                        secondAttribute = secondItem.mas_centerY;
                        break;
                        
                    default:
                        NSLog(@"NotFound1");
                        break;
                }
            }
            
            
            switch (constraint.firstAttribute) {
                case NSLayoutAttributeLeft:
                    if (secondItem) make.left.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeRight:
                    if (secondItem) make.right.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeTop:
                    if (secondItem) make.top.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeBottom:
                    if (secondItem) make.bottom.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeLeading:
                    if (secondItem) make.leading.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeTrailing:
                    if (secondItem) make.trailing.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                    
                case NSLayoutAttributeWidth:
                    make.width.equalTo(@(constraint.constant));
                    break;
                case NSLayoutAttributeHeight:
                    make.height.equalTo(@(constraint.constant));
                    break;
                    
                case NSLayoutAttributeCenterX:
                    if (secondItem) make.centerX.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                case NSLayoutAttributeCenterY:
                    if (secondItem) make.centerY.equalTo(secondAttribute).offset(constraint.constant);
                    break;
                    
                default:
                    NSLog(@"NotFound2");
                    break;
            }
        }]];
        
    }
    //NSLog(@"%lu",(unsigned long)constraintMakers.count);
    return constraintMakers;
}

- (UIView *)findView:(UIView *)view array1:(NSArray *)array1 array2:(NSArray *)array2
{
    if (!view) {
        return nil;
    }
    
    NSInteger k = [array1 indexOfObject:view];
    if (k == NSNotFound) {
        return nil;
    }
    
    return array2[k];
}


@end
