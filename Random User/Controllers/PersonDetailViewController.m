//
//  PersonDetailViewController.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];
	if (self) {
		_tableLayout =
		@[
			@{
				@"section": @"Personal Information",
				@"rows":
					@[
						@{
							@"label": @"Age",
							@"key": @"age"
						},
						@{
							@"label": @"Gender",
							@"key": @"gender"
						},
						@{
							@"label": @"Date of birth",
							@"key": @"dateOfBirth"
						},
						@{
							@"label": @"Nationality",
							@"key": @"nationality"
						},
						@{
							@"label": @"Location",
							@"key": @"location"
						}
					]
			},
			@{
				@"section": @"Contact",
				@"rows":
					@[
						@{
							@"label": @"Phone",
							@"key": @"phone"
						},
						@{
							@"label": @"Email",
							@"key": @"email"
						}
					]
			},
		];
	}
	return self;

}

- (void)loadView {
	
	[super loadView];
	
	UILabel *noSelected = [[UILabel alloc] init];
	noSelected.text = @"Select a user";
	noSelected.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightThin];
	noSelected.translatesAutoresizingMaskIntoConstraints = NO;
	self.tableView.backgroundView = noSelected;
	
	_personPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 70.0, 70.0)];
	_personPhoto.layer.masksToBounds = YES;
	_personPhoto.layer.borderWidth = 0.5;
	_personPhoto.layer.borderColor = UIColor.grayColor.CGColor;
	_personPhoto.layer.cornerRadius = _personPhoto.bounds.size.height / 2.0;
	_personPhoto.translatesAutoresizingMaskIntoConstraints = NO;
	_personPhoto.hidden = YES;
	self.tableView.tableHeaderView = _personPhoto;
	
	NSArray<NSLayoutConstraint *> *constraints =
	@[
		
		[noSelected.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
		[noSelected.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-60.0],
		
		[_personPhoto.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
		[_personPhoto.widthAnchor constraintEqualToConstant:70.0],
		[_personPhoto.heightAnchor constraintEqualToConstant:70.0],
		[_personPhoto.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.0]
		
	 ];
	
	[NSLayoutConstraint activateConstraints:constraints];
	
}

- (void)updateWithPerson:(Person *)person {

	_person = person;
	self.title = _person.name;
	self.tableView.backgroundView.hidden = YES;
	_personPhoto.image = _person.image;
	_personPhoto.hidden = NO;
	
	[self.tableView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

	if (!_person)
		return 0;
	
	return 2;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	if (!_person)
		return 0;
	
	if (section == 0)
		return 5;
	else
		return 2;
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return _tableLayout[section][@"section"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *title = _tableLayout[indexPath.section][@"rows"][indexPath.row][@"label"];
	NSString *key = _tableLayout[indexPath.section][@"rows"][indexPath.row][@"key"];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if (!cell)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"Cell"];
	
	id detail = [_person valueForKeyPath:key];
	cell.textLabel.text = title;
	
	if ([detail isKindOfClass:[NSNumber class]])
		cell.detailTextLabel.text = ((NSNumber *)detail).stringValue;
	else if ([detail isKindOfClass:[NSDate class]])
		cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:(NSDate *)detail dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
	else
		cell.detailTextLabel.text = (NSString *)detail;
	
	return cell;
	
}

@end
