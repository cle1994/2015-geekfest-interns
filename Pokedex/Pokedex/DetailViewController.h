//
//  DetailViewController.h
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *pokemonDetail;

- initWithData:(NSDictionary *)pokemonDetail;

@end
