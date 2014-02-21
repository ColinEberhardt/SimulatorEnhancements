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

@interface AccData : NSObject 

@property double x;
@property double y;
@property double z;

@end

@implementation AccData
@end

@implementation CMAccelerometerData (Enhancements)

- (void) dummySetAcceleration:(CMAcceleration)acceleration {
  AccData *accData = [AccData new];
  accData.x = acceleration.x;
  accData.y = acceleration.y;
  accData.z = acceleration.z;
  objc_setAssociatedObject(self, ACCELERATION_IDENTIFIER, accData, OBJC_ASSOCIATION_RETAIN);
}

- (CMAcceleration)override_acceleration {
  AccData *value = objc_getAssociatedObject(self, ACCELERATION_IDENTIFIER);
  CMAcceleration acc;
  acc.x = value.x;
  acc.y = value.y;
  acc.z = value.z;
  return acc;
}

@end
