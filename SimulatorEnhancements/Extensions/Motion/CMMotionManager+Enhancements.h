//
//  CMMotionManager+Enhancements.h
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (Enhancements)

- (void)sendAccelerometerUpdate:(CMAccelerometerData *)accelerometerData;


@end
