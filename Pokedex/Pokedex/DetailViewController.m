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
        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.view.backgroundColor = [UIColor whiteColor];
        _pokemonDetail = pokemonDetail;
        
        _pokemonImage = [[UIImageView alloc] initWithImage:[_pokemonDetail objectForKey:@"image"]];
        _pokemonName = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonType = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonHeight = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonWeight = [[UILabel alloc] initWithFrame:CGRectZero];
        _pokemonDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _pokemonName.text = [_pokemonDetail objectForKey:@"name"];
        _pokemonType.text = [_pokemonDetail objectForKey:@"type"];
        _pokemonHeight.text = [_pokemonDetail objectForKey:@"height"];
        _pokemonWeight.text = [_pokemonDetail objectForKey:@"weight"];
        _pokemonDescription.text = [_pokemonDetail objectForKey:@"note"];
        
//        _pokemonName.text = @"test";
//        _pokemonType.text = @"test";
//        _pokemonHeight.text = @"test";
//        _pokemonWeight.text = @"test";
//        _pokemonDescription.text = @"test";
        
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
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    CGFloat xValue = self.view.bounds.origin.x;
    CGFloat yValue = self.view.bounds.origin.y + navigationBarHeight;
    CGFloat widthValue = self.view.bounds.size.width;
    CGFloat heightValue = self.view.bounds.size.height - navigationBarHeight;
    
    _pokemonImage.frame = CGRectMake(xValue, yValue, widthValue * 0.5, heightValue * 0.5);
    _pokemonName.frame = CGRectMake(CGRectGetMaxX(_pokemonImage.frame), yValue, widthValue * 0.5, heightValue * 0.2);
    _pokemonType.frame = CGRectMake(CGRectGetMaxX(_pokemonImage.frame), CGRectGetMaxY(_pokemonName.frame), widthValue * 0.5, heightValue * 0.1);
    _pokemonHeight.frame = CGRectMake(CGRectGetMaxX(_pokemonImage.frame), CGRectGetMaxY(_pokemonType.frame), widthValue * 0.5, heightValue * 0.1);
    _pokemonWeight.frame = CGRectMake(CGRectGetMaxX(_pokemonImage.frame), CGRectGetMaxY(_pokemonHeight.frame), widthValue * 0.5, heightValue * 0.1);
    _pokemonDescription.frame = CGRectMake(xValue, CGRectGetMaxY(_pokemonImage.frame), widthValue, heightValue * 0.5);
    
//    _pokemonImage.backgroundColor = [UIColor blueColor];
//    _pokemonName.backgroundColor = [UIColor greenColor];
//    _pokemonType.backgroundColor = [UIColor purpleColor];
//    _pokemonHeight.backgroundColor = [UIColor redColor];
//    _pokemonWeight.backgroundColor = [UIColor blueColor];
//    _pokemonDescription.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
