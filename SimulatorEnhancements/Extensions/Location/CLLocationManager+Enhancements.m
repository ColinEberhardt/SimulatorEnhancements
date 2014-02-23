//
//  CLLocationManager+Enhancements.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "CLLocationManager+Enhancements.h"
#import "CELocationEnhancements.h"

@implementation CLLocationManager (Enhancements)

- (void)override_onClientEventLocation:(id)foo {
  // no-op - this suppresses location change events that are raised
  // by CLLocationManager
}

-(void)override_setDelegate:(id<CLLocationManagerDelegate>)delegate {
  [[CELocationEnhancements instance] addManager:self];
  [self override_setDelegate:delegate];
}

- (void)simx_didUpdateLocations:(NSArray *)locations {
  id delegate = self.delegate;
  
  if ([delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]) {
    [delegate locationManager:self didUpdateLocations:locations];
  }
  
  if ([delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
    [delegate locationManager:self didUpdateToLocation:locations.lastObject fromLocation:nil];
  }
}

@end
