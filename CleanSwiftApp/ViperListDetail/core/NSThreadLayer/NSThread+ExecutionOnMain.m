//
//  NSThread+ExecutionOnMain.m
//  
//
//  Created by Pavel Yeshchyk on 8/10/15.
//  Copyright (c) 2015 Pavel Yeshchyk. All rights reserved.
//

#import "NSThread+ExecutionOnMain.h"

@implementation NSThread (ExecutionOnMain)

+ (void)executeOnMainThread:(WOTMainThreadExecutionBlock)block {
    
    NSCAssert((block != nil), @"block is not defined");
    
    BOOL isMain = [NSThread isMainThread];
    if (isMain) {
        
        block();
    } else {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            block();
        });
    }
}

@end
