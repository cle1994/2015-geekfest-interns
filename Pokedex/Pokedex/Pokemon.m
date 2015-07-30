//
//  Pokemon.m
//  Pokedex
//
//  Created by Jessica Pham on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import "Pokemon.h"
#import "ContactsManager.h"

@implementation Pokemon {
    NSDictionary *_birthdayToType;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpDictionary];
    }
    return self;
}

- (instancetype)initWithContact:(CNContact *)contact
{
    self = [self init];
    if (self) {
        self.number = [[[ContactsManager sharedManager] deviceAddressBook] indexOfObject:contact];
        self.name = [NSString stringWithFormat:@"%@ %@", contact.givenName, contact.familyName];
        [self setTypeForBirthday:contact.birthday];
        [self setHeightAndWeight];
        if (contact.note) {
            self.description = contact.note;
        } else {
            [self setDescription];
        }
    }
    return self;
}

- (void)setTypeForBirthday:(NSDateComponents *)birthday{
    
}
- (void)setHeightAndWeight{
    
}
- (void)setDescription{
    
}

- (void)setUpDictionary {
    _birthdayToType = [[NSDictionary alloc] initWithObjects:@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12]
                                                    forKeys:@[@"Normal", @"Fire", @"Water", @"Electric", @"Grass", @"Fighting",
                                                              @"Ground", @"Flying", @"Psychic", @"Bug", @"Ghost", @"Dragon"]];
}
@end
