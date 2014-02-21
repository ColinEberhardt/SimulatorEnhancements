//
//  CELocationEnhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocationManager;

@interface CELocationEnhancements : NSObject

- (void)enable;

- (void)receiveSimulatorData:(NSArray *)data;

- (void)addLocationManager:(CLLocationManager *)manager;

+ (CELocationEnhancements *)instance;

@end
