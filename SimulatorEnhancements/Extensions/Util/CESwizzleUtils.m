//
//  SwizzleUtils.m
//  DayNineteen
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Chris Risner. All rights reserved.
//

#import <objc/runtime.h>
#import "CESwizzleUtils.h"

@implementation CESwizzleUtils

+ (void)swizzleClass:(Class)class method:(NSString*)methodName {
  
  SEL originalSelector = NSSelectorFromString(methodName);
  SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
  
  Method originalMethod = class_getInstanceMethod(class, originalSelector);
  Method newMethod = class_getInstanceMethod(class, newSelector);
  
  method_exchangeImplementations(originalMethod, newMethod);
}


@end
