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
    NSDictionary *_birthdayToDescription;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpBirthdayToTypeDictionary];
        [self setBirthdayToDescriptionDictionary];
    }
    return self;
}

- (instancetype)initWithContact:(CNContact *)contact
{
    self = [self init];
    if (self) {
        self.number = [[[ContactsManager sharedManager] deviceAddressBook] indexOfObject:contact];
        self.name = [NSString stringWithFormat:@"%@ %@", contact.givenName, contact.familyName];
        self.height = ((float)rand() / RAND_MAX) * 6;
        self.weight = ((float)rand() / RAND_MAX) * 150;
        
        NSString *month = [NSString stringWithFormat:@"%ld", contact.birthday.month];
        if ([month isEqualToString:@"0"]) {
            month = [NSString stringWithFormat:@"%ld",(NSInteger)((rand() % 12) + 1)];
        }
        self.type = [_birthdayToType valueForKey:month];
        if (contact.note) {
            self.note = contact.note;
        } else {
            NSString *description = [_birthdayToDescription valueForKey:month];
            self.note = description;
        }
        
        if (contact.imageDataAvailable) {
            // convert nsdata to uiimage 8 bit
        } else {
            // Assign pokemon image of same type
            NSString *imageFilename = [NSString stringWithFormat:@"Images/%@.png", self.type];
            self.image = [UIImage imageNamed:imageFilename];
        }
        
    }
    return self;
}

- (void)setBirthdayToDescriptionDictionary{
    //Descriptions credit to http://www.psychicguild.com/horoscopes_explained.php
    _birthdayToDescription = [[NSDictionary alloc] initWithObjects:
                              @[@"Continually climbing the eternal mountain of success, this pokemon rises to the occasion when faced with a new task or deadline. It reaches its goals because it knows that the longest journey commences with a single step.",
                                @"This pokemon not only marches to a different drummer, it makes up new music as it goes along. It is an 'mind oriented' individual, whose thoughts never stop tick-tocking over.",
                                @"This pokemon is incredibly adaptable and resilient. It is to be found leading the field in many diverse areas of life and can be found represented amongst top business millionaires.",
                                @"This pokemon is independent, outgoing and assertive. No matter what upheaval, challenge or triumph they confront - it has a wonderful ability to bounce back.",
                                @"Like the butterfly that chooses to remain hidden in its cocoon until it is ready and prepared to emerge, the true spirit of this pokemon remains hidden behind a veneer of day-to-day activities.",
                                @"This pokemon's personality can appear mysterious or detached to others. It loves the adventure and game playing involved in out-thinking other people.",
                                @"Just as the Moon goes through many changes as it moves from its new to full phases, this pokemon too goes through many new and full phases of experience. Life doesn't stand still for it, even if it remains in one place.",
                                @"No matter what level it has attained, this pokemon is a trendsetter, leader and adventurer. Charismatic and positive-thinking, it attracts an abundance of friends and opportunities.",
                                @"Creative and sensitive, this pokemon is delicate and who, like rare and special orchids, require individual treatment to fully blossom into their true unique beauty.",
                                @"This pokemon can switch off from the world around then and during these periods much more occurs on the deep innermost levels of its psyche, than their closest companions imagine.",
                                @"Passion, desire and power go hand in hand for this pokemon. Old and wise beyond the average, it often knows all the answers.",
                                @"This pokemon believes that anything is possible - and because of this belief system, it is adept at seeking out their very own pot of gold at the end of the rainbow."]
                                                           forKeys:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"]];
}

- (void)setUpBirthdayToTypeDictionary {
    _birthdayToType = [[NSDictionary alloc] initWithObjects:@[@"Normal", @"Fire", @"Water", @"Electric", @"Grass", @"Fighting",
                                                              @"Ground", @"Flying", @"Psychic", @"Bug", @"Poison", @"Dragon"]
                                                    forKeys:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"]];
}
@end
