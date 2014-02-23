//
//  CELocationEnhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEBaseManagerEnhancement.h"

@interface CELocationEnhancements : CEBaseManagerEnhancement

- (void)enable;

- (void)receiveSimulatorData:(NSArray *)data;

+ (CELocationEnhancements *)instance;

@end
