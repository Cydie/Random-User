//
//  Person.m
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description {
	
	NSString *desc = @"id: %@\n"
	"name: %@\n"
	"age: %@\n"
	"gender: %@\n"
	"dateOfBirth: %@\n"
	"nationality: %@\n"
	"location: %@\n"
	"email: %@\n"
	"phone: %@\n"
	"imageURL: %@\n";
	
	return [NSString stringWithFormat:desc, self.id, self.name, self.age, self.gender, self.dateOfBirth, self.nationality, self.location, self.email, self.phone, self.imageURL];
	
}

@end
