//
//  Student.m
//  KVC
//
//  Created by Harbros on 11.02.2019.
//  Copyright © 2019 Harbros. All rights reserved.
//

#import "Student.h"

@implementation Student

+ (Student*)randomStudent{
    Student* student = [[Student alloc] init];
    student.firstName = [NSString stringWithFormat:@"Student %d", arc4random()%10];
    student.lastName = [NSString stringWithFormat:@"Surname %d", arc4random()%10];
    student.age = arc4random()%30;
    student.gender = (Gender)arc4random()%2;
    student.grade = arc4random()%501 / 100.f;
    
    return student;
}

- (NSString*)description{
    return [NSString stringWithFormat:@"%@ %@, %d, %f", self.firstName, self.lastName, self.age, self.grade];
}

@end
