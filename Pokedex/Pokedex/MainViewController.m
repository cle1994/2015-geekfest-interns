//
//  mainViewController.m
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright (c) 2015 geekfest. All rights reserved.
//

#import "MainViewController.h"
#import "ContactsManager.h"
#import "PokemonCellTableViewCell.h"
#import "DetailViewController.h"
#import "Pokemon.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@end

static NSString * const kPokedexCellReuseId = @"kPokedexCellReuseId";

@implementation MainViewController {
    UITableView *_pokemonTableView;
}

- (id)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor redColor];
        
        //ContactsManager *pokemonManager = [ContactsManager sharedManager];
        self.pokemonArray = [[NSMutableArray alloc] init];
        [[ContactsManager sharedManager] loadPokedex];
        _pokemonArray = [[ContactsManager sharedManager] pokedexAddressBook];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.view.frame = screenRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pokemonTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _pokemonTableView.dataSource = self;
    _pokemonTableView.delegate = self;
    [_pokemonTableView registerClass:[PokemonCellTableViewCell class]
              forCellReuseIdentifier:kPokedexCellReuseId];
    
    _pokemonTableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationItem.title = @"Pokedex";
    
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, @"Your text");
    [self.view addSubview:_pokemonTableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect tableViewRect = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height * 0.6);
    
    _pokemonTableView.frame = tableViewRect;
    _pokemonTableView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table View Data Source Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_pokemonArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PokemonCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPokedexCellReuseId];
    
    // Using a cell identifier will allow your app to reuse cells as they come and go from the screen.
    if (cell == nil) {
        cell = [[PokemonCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                               reuseIdentifier:kPokedexCellReuseId];
    }
    
    NSUInteger row = [indexPath row];
    Pokemon *pokemonData = _pokemonArray[row];
    cell.textLabel.text = pokemonData.name;
    cell.detailTextLabel.text = pokemonData.type;
//    cell.heightTextLabel.text = [NSString stringWithFormat: @"%.2f", pokemonData.height];
//    cell.weightTextLabel.text = [NSString stringWithFormat: @"%.2f", pokemonData.weight];
    cell.heightTextLabel.text = @"100.0";
    cell.weightTextLabel.text = @"150.0";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSUInteger row = [indexPath row];
    //Pokemon *pokemonData = _pokemonArray[row];
    
    //DetailViewController *detailViewController = [[DetailViewController alloc] initWithData:pokemonData];
    
    //[self.navigationController pushViewController:detailViewController animated:YES];
}

@end
