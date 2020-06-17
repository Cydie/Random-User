//
//  PersonTableViewCell.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 15..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		
		UITableViewCellAccessoryType currentAccessoryType = UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
		self.accessoryType = currentAccessoryType;
		
		UIView *bgColored = [[UIView alloc] init];
		bgColored.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
		self.selectedBackgroundView = bgColored;
		
		self.textLabel.highlightedTextColor = UIColor.whiteColor;
		
	}
	
	return self;
	
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	self.imageView.layer.masksToBounds = YES;
	self.imageView.layer.borderWidth = 0.5;
	self.imageView.layer.borderColor = UIColor.grayColor.CGColor;
	self.imageView.layer.cornerRadius = self.imageView.bounds.size.width / 2.0;
}

@end
