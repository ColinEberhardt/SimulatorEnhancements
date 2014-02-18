//
//  CLLocationManager+Enhancements.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <objc/runtime.h>
#import "CLLocationManager+Enhancements.h"
#import "CELocationEnhancements.h"

@implementation CLLocationManager (Enhancements)

-(void)override_setDelegate:(id<CLLocationManagerDelegate>)delegate {
  [[CELocationEnhancements instance] addLocationManager:self];
  [self override_setDelegate:delegate];
}

@end
