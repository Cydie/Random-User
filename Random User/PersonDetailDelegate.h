//
//  PersonDetailDelegate.h
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#ifndef PersonDetailDelegate_h
#define PersonDetailDelegate_h

#import "Person.h"

@protocol PersonDetailDelegate <NSObject>

@required
- (void)updateWithPerson:(Person *)person;

@end

#endif /* PersonDetailDelegate_h */
