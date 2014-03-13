//
//  CLLocationManager+Enhancements.h
//  SimulatorEnhancements
//
//  Created by Colin Eberhardt on 16/02/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>


/**
 A category on CLLocatioManager that modifies its behaviour via swizzled methods.
 */
@interface CLLocationManager (Enhancements)

/**
 Send the didUpdateLocations: message to the delegate
 */
- (void)simx_didUpdateLocation:(CLLocation *)locations;

@end
