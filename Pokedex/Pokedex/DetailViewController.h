//
//  DetailViewController.h
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Pokemon *pokemonDetail;

- initWithData:(Pokemon *)pokemonDetail;

@end
