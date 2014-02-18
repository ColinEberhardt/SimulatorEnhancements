//
//  CEViewController.m
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "CEViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "CELocationEnhancements.h"

@interface CEViewController () <CLLocationManagerDelegate>

@end

@implementation CEViewController {
  CLLocationManager *_locationManager;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _locationManager = [CLLocationManager new];
  _locationManager.delegate = self;
  [_locationManager startUpdatingLocation];
  
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  
}

@end
