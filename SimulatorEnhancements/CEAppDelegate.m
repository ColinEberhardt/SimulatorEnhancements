//
//  CEAppDelegate.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "CEAppDelegate.h"
#import "CESimulatorEnhancements.h"

@implementation CEAppDelegate {
  NSTimer *_timer;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[CESimulatorEnhancements instance] enable];
  
  _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:NO];
  
  return YES;
}

- (void)tick {
  [[CESimulatorEnhancements instance] receiveSimulatorData:@"{locations:[{latitude:65.7, longitude:66.3]}"];
}

@end
