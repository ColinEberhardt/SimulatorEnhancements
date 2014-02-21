//
//  CMAccelerometerData+Enhancements.h
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

/**
 A category on CMAccelerometerData that modifies its behaviour via swizzled methods.
 */
@interface CMAccelerometerData (Enhancements)

/**
 The acceleration property of CMAccelerometerData is immutable. This method allows this
 property to be set.
 */
- (void) dummySetAcceleration:(CMAcceleration)acceleration;

@end
