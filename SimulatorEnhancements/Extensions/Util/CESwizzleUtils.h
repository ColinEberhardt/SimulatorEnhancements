//
//  SwizzleUtils.h
//  DayNineteen
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Chris Risner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CESwizzleUtils : NSObject

+ (void)swizzleClass:(Class)class method:(NSString*)methodName;

@end
