//
//  CEMotionEnhancements.h
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface CEMotionEnhancements : NSObject

- (void)enable;

- (void)receiveSimulatorData:(NSArray *)data;

- (void)addMotionManager:(CMMotionManager *)manager;

+ (CEMotionEnhancements *)instance;

@end
