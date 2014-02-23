//
//  CEManagerEnhancement.h
//  DayNineteen
//
//  Created by Colin Eberhardt on 23/02/2014.
//  Copyright (c) 2014 Chris Risner. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A base class for enhancing the functionality of 'manager' classes (e.g. location manager, motion manager)
 */
@interface CEBaseManagerEnhancement : NSObject

- (NSArray *)getManagers;

- (void)addManager:(id)manager;

@end
