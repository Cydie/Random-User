//
//  PersonService.h
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonService : NSObject {
	
}

+ (instancetype)sharedService;
- (void)requestPersonsForPage:(int)page completion:(void(^)(NSArray<Person *> *))completionHandler;

@end

NS_ASSUME_NONNULL_END
