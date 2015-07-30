//
//  mainViewController.m
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright (c) 2015 geekfest. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        _contactList = [[ContactListTableViewController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect contactScreenRect = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height * 0.6);
    self.view.frame = contactScreenRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addChildViewController:_contactList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
