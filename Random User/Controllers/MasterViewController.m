//
//  MasterViewController.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 14..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MasterViewController.h"
#import "PersonTableViewCell.h"
#import "UIKit+AFNetworking.h"
#import "PersonService.h"

@implementation MasterViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
	
	self = [super initWithStyle:style];
	
	if (self) {
		_persons = [[NSMutableArray alloc] init];
		_page = 1;
	}
	
	return self;
	
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	[self.tableView registerClass:[PersonTableViewCell class] forCellReuseIdentifier:@"Cell"];
	
	UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
	[refreshControl addTarget:self action:@selector(refreshPersons) forControlEvents:UIControlEventValueChanged];
	self.refreshControl = refreshControl;
	
	self.title = @"Users";
	if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)
		self.tableView.backgroundColor = UIColor.blackColor;
	else
		self.tableView.backgroundColor = UIColor.secondarySystemBackgroundColor;
	self.tableView.tintColor = UIColor.whiteColor;
	
	[self refreshPersons];
	
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
	return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.persons.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 55.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	Person *person = self.persons[indexPath.row];
	cell.textLabel.text = person.name;
	
	__weak UIImageView *imageView = cell.imageView;
	__weak UITableViewCell *weakCell = cell;
	
	[cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:person.imageURL] placeholderImage:nil success:^(NSURLRequest *req, NSHTTPURLResponse *resp, UIImage *image) {
		
		imageView.image = image;
		person.image = image;
		[weakCell setNeedsLayout];
		
	} failure:nil];
	
	if (indexPath.row == self.persons.count - 1)
		[self loadMore];

	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[self.delegate updateWithPerson:self.persons[indexPath.row]];
	if (self.splitViewController.collapsed)
		[self showDetailViewController:self.detailViewController sender:self];
	
}

- (void)loadMore {
	
	[[PersonService sharedService] requestPersonsForPage:++_page completion:^(NSArray<Person *> *persons) {
		[self loadPersons:persons];
	}];
	
}

- (void)refreshPersons {
	
	[[PersonService sharedService] requestPersonsForPage:1 completion:^(NSArray<Person *> *persons) {
		[self resetPersons];
		[self loadPersons:persons];
		[self.refreshControl endRefreshing];
	}];
	
}

- (void)loadPersons:(NSArray<Person *> *)persons {
	
	[self.persons addObjectsFromArray:persons];
	[self.tableView reloadData];
	
}

- (void)resetPersons {
	
	_page = 1;
	[self.persons removeAllObjects];
	
}

@end
