//
//  Person.h
//  Random User
//
//  Created by Vekety Robin on 2020. 06. 16..
//  Copyright © 2020. Vekety Robin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSDate *dateOfBirth;
@property (nonatomic, retain) NSString *nationality;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSURL *imageURL;
@property (nonatomic, retain) UIImage *image;

@end

NS_ASSUME_NONNULL_END
