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
  SEL originalMethod = NSSelectorFromString(methodName);
  SEL newMethod = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
  [self swizzle:class from:originalMethod to:newMethod];
}

+ (void)swizzle:(Class)class from:(SEL)original to:(SEL)new {
  Method originalMethod = class_getInstanceMethod(class, original);
  Method newMethod = class_getInstanceMethod(class, new);
  if(class_addMethod(class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
    class_replaceMethod(class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
  } else {
    method_exchangeImplementations(originalMethod, newMethod);
  }
}

@end
