//
//  CELocationEnhancements.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <objc/runtime.h>
#import <CoreLocation/CoreLocation.h>
#import "CELocationEnhancements.h"
#import "CLLocationManager+Enhancements.h"
#import "NSDictionary+Helpers.h"
#import "CESwizzleUtils.h"

@implementation CELocationEnhancements {
  CLLocationManager *_locationManager;
}

- (void)enable {
  [CESwizzleUtils swizzleClass:[CLLocationManager class] method:@"setDelegate:"];
  [CESwizzleUtils swizzleClass:[CLLocationManager class] method:@"onClientEventLocation:"];
}

- (void)receiveSimulatorData:(NSArray *)data {
  NSMutableArray *locations = [NSMutableArray new];
  
  for (NSDictionary *locationData in data) {
    double lat = [[locationData NSNumberForKey:@"latitude"] doubleValue];
    double lon = [[locationData NSNumberForKey:@"longitude"] doubleValue];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    [locations addObject:location];
  }
  
  [self didUpdateLocations:locations];
  
}

- (void)addLocationManager:(CLLocationManager *)manager {
  _locationManager = manager;
}

- (void)didUpdateLocations:(NSArray *)locations {
  id delegate = _locationManager.delegate;
  
  if ([delegate respondsToSelector:@selector(locationManager:didUpdateLocations:)]) {
    [_locationManager.delegate locationManager:_locationManager didUpdateLocations:locations];
  }
  
  if ([delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
    [_locationManager.delegate locationManager:_locationManager didUpdateToLocation:locations.lastObject fromLocation:nil];
  }
}

+ (CELocationEnhancements *)instance {
  static CELocationEnhancements *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [CELocationEnhancements new];
  });
  return instance;
}

@end
