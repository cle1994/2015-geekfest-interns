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
        
//        ContactsManager *pokemonManager = [ContactsManager sharedManager];
//        _pokemonArray = pokemonManager.pokedexAddressBook;
        
        _pokemonArray = @[
                          @{@"name": @"John Doe"},
                          @{@"name": @"Erh-li Shen"},
                          @{@"name": @"Quynh Nguyen"}
                          ];
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
    
    _pokemonTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _pokemonTableView.dataSource = self;
    _pokemonTableView.delegate = self;
    [_pokemonTableView registerClass:[PokemonCellTableViewCell class]
              forCellReuseIdentifier:kPokedexCellReuseId];
    
    _pokemonTableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_pokemonTableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    CGRect tableViewRect = CGRectMake(self.view.bounds.origin.x, statusBarSize.height, self.view.bounds.size.width, self.view.bounds.size.height - statusBarSize.height);
    
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
    NSDictionary *pokemonData = _pokemonArray[row];
    cell.textLabel.text = [pokemonData objectForKey:@"name"];
    cell.detailTextLabel.text = @"test";
    cell.heightTextLabel.text = @"100.0";
    cell.weightTextLabel.text = @"150.0";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSDictionary *pokemonData = _pokemonArray[row];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithData:pokemonData];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
