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

+ (instancetype)sharedManager;
- (void)requestAccessToContacts;
@end
