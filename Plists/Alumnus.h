//
//  Alumnus.h
//  Plists
//
//  Created by Ricardo Reyes on 6/14/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alumnus : NSObject

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
