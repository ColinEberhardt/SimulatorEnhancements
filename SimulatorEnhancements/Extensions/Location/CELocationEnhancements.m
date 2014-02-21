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
  NSMutableArray *_locationManagers;
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
  
  for (CLLocationManager *locationManager in _locationManagers) {
    [locationManager simx_didUpdateLocations:locations];
  }
}

- (void)addLocationManager:(CLLocationManager *)manager {
  [_locationManagers addObject:manager];
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
