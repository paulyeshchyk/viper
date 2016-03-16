//
//  ErrorLayer.m
//
//
//  Created by Pavel Yeshchyk on 6/2/15.
//  Copyright (c) 2015 Pavel Yeshchyk. All rights reserved.
//

#import "ErrorLayer.h"

@implementation ErrorLayer

+ (NSError *)loginErrorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo {
    
    return [NSError errorWithDomain:@"LOGIN" code:code userInfo:userInfo];

}

+ (NSError *)coreDataErrorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo {
    
    return [NSError errorWithDomain:@"COREDATA" code:code userInfo:userInfo];
}

@end
