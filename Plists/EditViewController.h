//
//  EditViewController.h
//  Plists
//
//  Created by Ricardo Reyes on 6/14/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewControllerDelegate <NSObject>

- (void)saveName:(NSString *)name;

@end

@interface EditViewController : UIViewController

@property (weak, nonatomic) id <EditViewControllerDelegate> delegate;

@end
