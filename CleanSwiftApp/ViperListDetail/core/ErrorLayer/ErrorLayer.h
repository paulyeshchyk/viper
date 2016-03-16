//
//  ErrorLayer.h
//
//
//  Created by Pavel Yeshchyk on 6/2/15.
//  Copyright (c) 2015 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorLayer : NSObject

+ (NSError *)loginErrorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo;
+ (NSError *)coreDataErrorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo;

@end
