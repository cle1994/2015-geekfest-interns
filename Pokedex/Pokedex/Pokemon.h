//
//  Pokemon.h
//  Pokedex
//
//  Created by Jessica Pham on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

@import Contacts;
@import UIKit;

@interface Pokemon : NSObject
@property (nonatomic, assign) NSUInteger number;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat weight;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) UIImage *image;

- (id)initWithContact:(CNContact*)contact;

@end