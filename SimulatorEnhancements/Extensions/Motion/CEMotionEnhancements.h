//
//  CEMotionEnhancements.h
//  Maze
//
//  Created by Colin Eberhardt on 18/02/2014.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEBaseManagerEnhancement.h"

@interface CEMotionEnhancements : CEBaseManagerEnhancement

- (void)enable;

- (void)receiveSimulatorData:(NSArray *)data;

+ (CEMotionEnhancements *)instance;

@end
