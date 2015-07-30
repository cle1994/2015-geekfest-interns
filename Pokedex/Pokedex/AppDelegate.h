//
//  AppDelegate.h
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright (c) 2015 geekfest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) MainViewController *mainViewController;

@end

