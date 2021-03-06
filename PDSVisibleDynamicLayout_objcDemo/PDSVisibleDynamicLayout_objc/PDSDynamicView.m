//
//  PDSDynamicView.m
//  PDSVisibleDynamicLayout_objcDemo
//
//  Created by w91379137 on 2016/2/19.
//  Copyright © 2016年 w91379137. All rights reserved.
//

#import "PDSDynamicView.h"

@implementation PDSDynamicView

- (void)update:(NSArray *)constraints isInstall:(BOOL)isInstall
{
    if (constraints != nil) {
        for (id obj in constraints)
        {
            if([obj isKindOfClass:MASConstraint.class]) {
                if (isInstall) {
                    [(MASConstraint *)obj install];
                }
                else {
                    [(MASConstraint *)obj uninstall];
                }
            }
            else if([obj isKindOfClass:NSArray.class]) {
                for (MASConstraint * constraint in (NSArray *)obj)
                {
                    if (isInstall) {
                        [constraint install];
                    }
                    else {
                        [constraint uninstall];
                    }
                }
            }
        }
    }
}

- (NSArray *)constraintsOfKey:(NSString *)key
{
    if (!cacheConstraints) {
        cacheConstraints = [NSMutableDictionary dictionary];
    }
    
    if ([cacheConstraints.allKeys containsObject:key]) {
        NSArray *cache = cacheConstraints[key];
        [self update:currentConstraints isInstall:YES];
        return cache;
    }
    else {
        NSArray *create = [self createConstraintsOfKey:key];
        if (create) cacheConstraints[key] = create;
        return create;
    }
}

- (NSArray *)createConstraintsOfKey:(NSString *)key
{
    return nil;
}

@end
