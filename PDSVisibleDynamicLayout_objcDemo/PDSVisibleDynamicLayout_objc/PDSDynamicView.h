//
//  PDSDynamicView.h
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "PDSIBDesignableView.h"

@interface PDSDynamicView : PDSIBDesignableView
{
    NSMutableArray *currentConstraints;
    NSMutableDictionary *cacheConstraints;
}

- (void)update:(NSArray *)constraints isInstall:(BOOL)isInstall;
- (NSArray *)constraintsOfKey:(NSString *)key;
- (NSArray *)createConstraintsOfKey:(NSString *)key;

@end
