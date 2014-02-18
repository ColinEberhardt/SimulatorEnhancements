//
//  CLLocationManager+Enhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@class CEDelegateMultiplexer;

@interface CLLocationManager (Enhancements)

// gets a proxy which is used to send delegate methods invocations to multiple delegates
- (CEDelegateMultiplexer*) getDelegateProxy;

@end
