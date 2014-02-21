//
//  CMMotionManager+Enhancements.m
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "CMMotionManager+Enhancements.h"
#import "CEMotionEnhancements.h"
#import <objc/runtime.h>

#define HANDLER_IDENTIFIER @"accelerometerHandler"

@implementation CMMotionManager (Enhancements)

- (void)simx_accelerometerUpdate:(CMAccelerometerData *)accelerometerData {
  CMAccelerometerHandler handler = objc_getAssociatedObject(self, HANDLER_IDENTIFIER);
  handler(accelerometerData, nil);
}

-(void)override_startAccelerometerUpdatesToQueue:(NSOperationQueue *)queue
                                     withHandler:(CMAccelerometerHandler)handler {

  objc_setAssociatedObject(self, HANDLER_IDENTIFIER, handler, OBJC_ASSOCIATION_RETAIN);
  
  [[CEMotionEnhancements instance] addMotionManager:self];
}


@end
