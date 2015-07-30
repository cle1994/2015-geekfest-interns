//
//  ContactsManager.m
//  Pokedex
//
//  Created by Jessica Pham on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//
#import "ContactsManager.h"

NSString *const kContactAccess = @"contacts_access_granted";

@implementation ContactsManager {
}

+ (instancetype)sharedManager
{
    static dispatch_once_t once_t;
    static ContactsManager *sharedManager = nil;
    dispatch_once(&once_t, ^{
        sharedManager = [[ContactsManager alloc] init];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contactStore = [[CNContactStore alloc] init];
        self.pokedexAddressBook = [[NSArray alloc] init];
        self.deviceAddressBook = [[NSMutableArray alloc] init];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        if ([userDefaults valueForKey:kContactAccess] != nil) {
            self.authorizationStatus = [[userDefaults valueForKey:kContactAccess] intValue];
        } else {
            self.authorizationStatus = CNAuthorizationStatusNotDetermined;
        }
    }
    return self;
}

- (void)requestAccessToContacts
{
    if (_authorizationStatus == CNAuthorizationStatusNotDetermined) {
        [_contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError *error) {
            if (error == nil) {
                if (granted) {
                    _authorizationStatus = CNAuthorizationStatusAuthorized;

                } else {
                    _authorizationStatus = CNAuthorizationStatusDenied;
                }
            }
        }];
    }
}

- (void)loadDeviceContacts
{
    [_deviceAddressBook removeAllObjects];
    
    NSArray *keys = [NSArray arrayWithObjects:CNContactFamilyNameKey, CNContactGivenNameKey, CNContactImageDataKey, CNContactPhoneNumbersKey, CNContactBirthdayKey, CNContactNamePrefixKey, nil];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [_contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact *contact, BOOL *stop) {
        [_deviceAddressBook addObject:contact];
    }];
    
    
}
@end


