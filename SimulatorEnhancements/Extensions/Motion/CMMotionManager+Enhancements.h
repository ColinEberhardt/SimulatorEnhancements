//
//  CMMotionManager+Enhancements.h
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

/**
 A category on CMMotionManager that modifies its behaviour via swizzled methods.
 */
@interface CMMotionManager (Enhancements)

/**
 Updates the current accelerometer reading.
 */
- (void)simx_accelerometerUpdate:(CMAccelerometerData *)accelerometerData;

@end
