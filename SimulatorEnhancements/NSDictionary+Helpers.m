//
//  NSDictionary+Helpers.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "NSDictionary+Helpers.h"

@implementation NSDictionary (Helpers)

- (NSNumber*) NSNumberForKey:(NSString*)key
{
  NSString* value = (NSString*)[self objectForKey:key];
  if (value)
  {
    return [NSNumber numberWithInt:[value integerValue]];
  }
  else
  {
    return nil;
  }
}

@end
