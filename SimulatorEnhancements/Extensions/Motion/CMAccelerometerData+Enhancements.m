//
//  CMAccelerometerData+Enhancements.m
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <objc/runtime.h>
#import "CMAccelerometerData+Enhancements.h"

#define ACCELERATION_IDENTIFIER @"accelerometerHandler"

@implementation CMAccelerometerData (Enhancements)

- (void) simx_setAcceleration:(CMAcceleration)acceleration {
  NSValue *value = [NSValue value:&acceleration withObjCType:@encode(CMAcceleration)];
  objc_setAssociatedObject(self, ACCELERATION_IDENTIFIER, value, OBJC_ASSOCIATION_RETAIN);
}

- (CMAcceleration)override_acceleration {
  NSValue *value = objc_getAssociatedObject(self, ACCELERATION_IDENTIFIER);
  CMAcceleration acc;
  [value getValue:&acc];
  return acc;
}

@end
