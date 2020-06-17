//
//  MasterViewController.h
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 14..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#ifndef MasterViewController_h
#define MasterViewController_h

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonDetailViewController.h"
#import "PersonDetailDelegate.h"

@interface MasterViewController : UITableViewController <UISplitViewControllerDelegate> {
	int _page;
}

@property (nonatomic, strong) NSMutableArray<Person *> *persons;
@property (nonatomic, retain) id<PersonDetailDelegate> delegate;
@property (nonatomic, retain) PersonDetailViewController *detailViewController;

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController;

@end

#endif /* MasterViewController_h */
