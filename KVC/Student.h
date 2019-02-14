//
//  Student.h
//  KVC
//
//  Created by Harbros on 11.02.2019.
//  Copyright © 2019 Harbros. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    Male,
    Female,
    None
}Gender;

@interface Student : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) double grade;
@property (weak, nonatomic) Student* friend;

+ (Student*)randomStudent;

@end

NS_ASSUME_NONNULL_END
