//
//  DetailViewController.m
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    UIImageView *_pokemonImage;
    UILabel *_pokemonName;
    UILabel *_pokemonType;
    UILabel *_pokemonHeight;
    UILabel *_pokemonWeight;
    UILabel *_pokemonDescription;
}

- (id)initWithData:(NSDictionary *)pokemonDetail {
    self = [super init];
    if (self) {
        self.view = [[UIView alloc] initWithFrame:CGRectZero];
        _pokemonDetail = pokemonDetail;
        
        _pokemonImage = [[UIImageView alloc] initWithImage:[_pokemonDetail objectForKey:@"image"]];
        _pokemonName.text = [_pokemonDetail objectForKey:@"name"];
        _pokemonType.text = [_pokemonDetail objectForKey:@"type"];
        _pokemonHeight.text = [_pokemonDetail objectForKey:@"height"];
        _pokemonWeight.text = [_pokemonDetail objectForKey:@"weight"];
        _pokemonDescription.text = [_pokemonDetail objectForKey:@"note"];
        
        [self.view addSubview:_pokemonImage];
        [self.view addSubview:_pokemonName];
        [self.view addSubview:_pokemonType];
        [self.view addSubview:_pokemonHeight];
        [self.view addSubview:_pokemonWeight];
        [self.view addSubview:_pokemonDescription];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
//    _pokemonImage.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
