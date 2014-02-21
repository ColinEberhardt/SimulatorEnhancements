//
//  CESimulatorEnhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CESimulatorEnhancements : NSObject

- (void)enable;

- (void)receiveSimulatorData:(NSString *)data;

- (void)startClient;

+ (CESimulatorEnhancements *)instance;

@end
