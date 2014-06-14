//
//  Alumnus.m
//  Plists
//
//  Created by Ricardo Reyes on 6/14/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import "Alumnus.h"

@implementation Alumnus

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
    }
    
    return self;
}

@end
