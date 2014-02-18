//
//  CESimulatorEnhancements.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "CESimulatorEnhancements.h"
#import "CELocationEnhancements.h"

@implementation CESimulatorEnhancements

- (void)enable {
  [[CELocationEnhancements instance] enable];
}

- (void)receiveSimulatorData:(NSString *)data {
  NSData* resultData = [data dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* json = [NSJSONSerialization JSONObjectWithData:resultData
                                                       options:kNilOptions
                                                         error:nil];
  
  [[CELocationEnhancements instance] receiveSimulatorData:json[@"locations"]];
}

+ (CESimulatorEnhancements *)instance {
  static CESimulatorEnhancements *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [CESimulatorEnhancements new];
  });
  return instance;
}

@end
