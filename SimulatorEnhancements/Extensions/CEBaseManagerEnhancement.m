//
//  CEManagerEnhancement.m
//  DayNineteen
//
//  Created by Colin Eberhardt on 23/02/2014.
//  Copyright (c) 2014 Chris Risner. All rights reserved.
//

#import "CEBaseManagerEnhancement.h"

@implementation CEBaseManagerEnhancement {
  NSMutableArray *_managers;
}

-(id)init {
  if ( self = [super init] ) {
    _managers = [NSMutableArray new];
  }
  return self;
}

- (NSArray *)getManagers {
  // iterates over the managers - removing any 'nil' references
  NSMutableArray *managers = [NSMutableArray new];
  NSMutableArray *nilReferences = [NSMutableArray new];
  for (NSValue *nonRetainedManager in _managers) {
    id manager = [nonRetainedManager nonretainedObjectValue];
    if (manager != nil) {
      [managers addObject:manager];
    } else {
      [nilReferences addObject:nonRetainedManager];
    }
  }
  [_managers removeObjectsInArray:nilReferences];
  return managers;
}


- (void)addManager:(id)manager {
  // check to see if we already have a reference
  for (NSValue *nonRetainedManager in _managers) {
    id existingManager = [nonRetainedManager nonretainedObjectValue];
    if (manager == existingManager)
      return;
  }
  
  // adds a weak reference to the manager
  NSValue *nonRetainedManager = [NSValue valueWithNonretainedObject:manager];
  [_managers addObject:nonRetainedManager];
}

@end
