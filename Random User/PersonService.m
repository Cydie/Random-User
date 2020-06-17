//
//  PersonService.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import "PersonService.h"
#import "AFNetworking.h"

@implementation PersonService

+ (instancetype)sharedService {
	
	static PersonService *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PersonService alloc] init];
    });
	
	return sharedInstance;
}

- (void)requestPersonsForPage:(int)page completion:(void(^)(NSArray<Person *> *))completionHandler {
	
	NSDictionary *parameters = @{@"page": @(page), @"results": @30, @"seed": @"enco", @"exc": @[@"registered", @"id"]};
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	
	[manager GET:@"https://randomuser.me/api/" parameters:parameters headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
		
		NSDictionary *response = (NSDictionary *)responseObject;
		NSArray *results = response[@"results"];
		NSMutableArray *persons = [[NSMutableArray alloc] init];
		
		for (NSDictionary *personInfo in results) {
			
			Person *person = [[Person alloc] init];
			person.id = personInfo[@"login"][@"uuid"];
			person.name = [NSString stringWithFormat:@"%@ %@", personInfo[@"name"][@"first"], personInfo[@"name"][@"last"]];
			person.age = personInfo[@"dob"][@"age"];
			
			NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
			[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
			NSDate *formattedDate = [dateFormatter dateFromString:personInfo[@"dob"][@"date"]];
			person.dateOfBirth = formattedDate;
			
			person.gender = personInfo[@"gender"];
			person.nationality = personInfo[@"nat"];
			
			NSDictionary *location = personInfo[@"location"];
			person.location = [NSString stringWithFormat:@"%@, %@, %@", location[@"country"], location[@"state"], location[@"city"]];
			person.email = personInfo[@"email"];
			person.phone = personInfo[@"cell"];
			person.imageURL = [NSURL URLWithString:personInfo[@"picture"][@"medium"]];
			
			[persons addObject:person];
			
		}
		
		completionHandler(persons);
		
		} failure:^(NSURLSessionTask *operation, NSError *error) {
			NSLog(@"Error: %@", error);
	}];

	
}

@end
