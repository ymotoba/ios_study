//
//  CustomUITableViewCell.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/09.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "CustomUITableViewCell.h"

@implementation CustomUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		// Initialization code
	}
	return self;
}

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	[super setHighlighted:highlighted animated:animated];
	if (highlighted) {
		self.alpha = 0.5f;
//		UIView *cellBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
//		cellBackgroundView.backgroundColor = [UIColor blueColor];
//		self.backgroundView = cellBackgroundView;
//		[self.textLabel setBackgroundColor:cellBackgroundView.backgroundColor];
	}
	else {
		self.alpha = 1.0f;
//		UIView *cellBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
//		cellBackgroundView.backgroundColor = [UIColor whiteColor];
//		self.backgroundView = cellBackgroundView;
//		[self.textLabel setBackgroundColor:cellBackgroundView.backgroundColor];
	}
}

@end
