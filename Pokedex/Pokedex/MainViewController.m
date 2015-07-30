//
//  mainViewController.m
//  Pokedex
//
//  Created by Christian Le on 7/30/15.
//  Copyright (c) 2015 geekfest. All rights reserved.
//

#import "MainViewController.h"
#import "ContactsManager.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MainViewController {
    UITableView *_pokemonTableView;
}

- (id)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        ContactsManager *pokemonManager = [ContactsManager sharedManager];
        _pokemonArray = pokemonManager.pokedexAddressBook;
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
    
    [self.view addSubview:_pokemonTableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _pokemonTableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_pokemonArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifer = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    // Using a cell identifier will allow your app to reuse cells as they come and go from the screen.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [_pokemonArray objectAtIndex:row];
    
    return cell;
}

@end
