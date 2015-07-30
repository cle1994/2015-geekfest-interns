//
//  ContactsManager.h
//  Pokedex
//
//  Created by Jessica Pham on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

@import Contacts;

@interface ContactsManager : NSObject
@property (nonatomic, strong) CNContactStore *contactStore;
@property (nonatomic, assign) CNAuthorizationStatus authorizationStatus;
@property (nonatomic, strong) NSMutableArray *pokedexAddressBook;
@property (nonatomic, strong) NSMutableArray *deviceAddressBook;

+ (instancetype)sharedManager;
- (void)requestAccessToContacts;
- (void)loadPokedex;
@end
