//
//  CESimulatorEnhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CESimulatorEnhancements : NSObject

/**
 Enabled the simulator enhancements, allowing geolocation, accelerometer and other
 hardware-dependant services to be simulated.
 */
- (void)enable;

/**
 Receives simulator data in JSON format and updates the current geolocation accelerometer etc ...
 */
- (void)receiveSimulatorData:(NSString *)data;

/**
 Starts polling for simulator data updated on http://localhost:8080
 */
- (void)startClient;

/**
 Retrieves the singleton instance of this class.
 */
+ (CESimulatorEnhancements *)instance;

@end
