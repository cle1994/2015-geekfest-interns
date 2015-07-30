//
//  BattleViewController.m
//  Pokedex
//
//  Created by Jason Dizon on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import "BattleViewController.h"
#import "ContactsManager.h"
#import "Pokemon.h"

@interface BattleViewController (){
    
    NSMutableArray * pokemonList;
    Pokemon * playerOne;
    Pokemon * playerTwo;
    
}



@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    ContactsManager *contacts = [ContactsManager sharedManager];
    pokemonList = contacts.pokedexAddressBook;
    
    int index1 = rand() % pokemonList.count;
    playerOne = [pokemonList objectAtIndex:index1];
    
    int index2 = rand() % pokemonList.count;
    while (index2 == index1) {
        index2 = rand() % pokemonList.count;
    }
    playerTwo = [pokemonList objectAtIndex:index2];
    
    UILabel *playerOneName = [[UILabel alloc] init];
    UIImage *playerOnePicture = [[UIImage alloc] init];
    playerOnePicture = playerOne.image;
    playerOneName.text = playerOne.name;
    
    UILabel *playerTwoName = [[UILabel alloc] init];
    UIImage *playerTwoPicture = [[UIImage alloc] init];
    playerTwoPicture = playerTwo.image;
    playerTwoName.text = playerTwo.name;
    
    UILabel *playerOneType = [[UILabel alloc] init];
    playerOnePicture = playerOne.image;

    playerOneType.text = playerOne.type;
    playerOneType.textColor = color;
    
    UILabel *playerTwoType = [[UILabel alloc] init];
    playerTwoType.text = playerTwo.type;
    playerTwoType.textColor = color;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
