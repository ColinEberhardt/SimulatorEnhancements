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

@implementation CELocationEnhancements {
  CLLocationManager *_locationManager;
}

- (void)enable {
  [self swizzleClass:[CLLocationManager class] method:@"setDelegate:"];
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
  [_locationManager.delegate locationManager:_locationManager didUpdateLocations:locations];
}

+ (CELocationEnhancements *)instance {
  static CELocationEnhancements *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [CELocationEnhancements new];
  });
  return instance;
}

-(void)swizzleClass:(Class)class method:(NSString*)methodName {
  SEL originalMethod = NSSelectorFromString(methodName);
  SEL newMethod = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
  [self swizzle:class from:originalMethod to:newMethod];
}

-(void)swizzle:(Class)class from:(SEL)original to:(SEL)new {
  Method originalMethod = class_getInstanceMethod(class, original);
  Method newMethod = class_getInstanceMethod(class, new);
  if(class_addMethod(class, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
    class_replaceMethod(class, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
  } else {
    method_exchangeImplementations(originalMethod, newMethod);
  }
}

@end
