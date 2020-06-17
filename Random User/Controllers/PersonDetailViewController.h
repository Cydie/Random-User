//
//  PersonDetailViewController.h
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetailDelegate.h"

@interface PersonDetailViewController : UITableViewController <PersonDetailDelegate> {
	Person *_person;
	NSArray *_tableLayout;
	UIImageView *_personPhoto;
}

- (void)updateWithPerson:(Person *)person;

@end
