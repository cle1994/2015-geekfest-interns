//
//  PokemonCellTableViewCell.m
//  Pokedex
//
//  Created by Jason Dizon on 7/30/15.
//  Copyright © 2015 geekfest. All rights reserved.
//

#import "PokemonCellTableViewCell.h"

static CGFloat const kCellPadding = 10.0;

@implementation PokemonCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        _heightTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _heightTextLabel.textColor = [UIColor blackColor];
        _heightTextLabel.font = [UIFont systemFontOfSize:12];
        
        _weightTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _weightTextLabel.textColor = [UIColor blackColor];
        _weightTextLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_heightTextLabel];
        [self addSubview:_weightTextLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat cellHeightWithPadding = self.bounds.size.height - (kCellPadding * 2);
    
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    
    CGFloat imageViewOffset = self.imageView.frame.size.width;
    self.textLabel.frame = CGRectMake(imageViewOffset + kCellPadding, kCellPadding / 2, self.bounds.size.width - imageViewOffset - kCellPadding, cellHeightWithPadding * 0.4);

    CGFloat xValue = self.textLabel.frame.origin.x;
    CGFloat heightValue = cellHeightWithPadding * 0.2;
    CGFloat widthValue = self.textLabel.frame.size.width;
    
    self.detailTextLabel.frame = CGRectMake(xValue, cellHeightWithPadding * 0.4 + kCellPadding, widthValue, heightValue);
    self.heightTextLabel.frame = CGRectMake(xValue, CGRectGetMaxY(self.detailTextLabel.frame), widthValue, heightValue);
    self.weightTextLabel.frame = CGRectMake(xValue, CGRectGetMaxY(self.heightTextLabel.frame), widthValue, heightValue);
}

@end
