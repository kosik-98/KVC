//
//  ViewController.m
//  KVC
//
//  Created by Harbros on 11.02.2019.
//  Copyright © 2019 Harbros. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) Student* student;
@property (strong, nonatomic) NSArray* students;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.students = [NSMutableArray array];
    
    Student* student1 = [Student randomStudent];
    Student* student2 = [Student randomStudent];
    Student* student3 = [Student randomStudent];
    
    student1.friend = student2;
    student2.friend = student3;
    student3.friend = student1;
    
    self.students = @[student1, student2, student3];
    
    [student2 addObserver:self
               forKeyPath:@"firstName"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    
    NSLog(@"%@", self.students);
    
    [self.students setValue:@"Alex" forKey:@"firstName"];
    [student3 setValue:@"AAA" forKeyPath:@"friend.firstName"];
    
    NSArray* arrayOfNames = [self.students valueForKey:@"firstName"];
    NSNumber* number = [self.students valueForKeyPath:@"@avg.grade"];
    
    NSLog(@"%@", self.students);
    NSLog(@"Average grade = %f", [number doubleValue]);
    NSLog(@"All names: %@", arrayOfNames);
    NSLog(@"Max age = %ld", [[self.students valueForKeyPath:@"@max.age"] integerValue]);
    NSLog(@"Min age = %ld", [[self.students valueForKeyPath:@"@min.age"] integerValue]);
    
    self.student = [Student randomStudent];
    [self refreshTableView];
}

- (void)refreshTableView{
    self.firstNameLabel.text = self.student.firstName;
    self.lastNameLabel.text = self.student.lastName;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", self.student.age];
    
    if(self.student.gender == Male){
        self.genderLabel.text = @"Male";
        self.genderSegmentedControl.selectedSegmentIndex = Male;
    }
    else if(self.student.gender == Female){
        self.genderLabel.text = @"Female";
        self.genderSegmentedControl.selectedSegmentIndex = Female;
    }
    else{
        self.genderLabel.text = @"None";
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Actions

- (IBAction)firstNameChanged:(UITextField*)sender {
    self.student.firstName = sender.text;
    [self refreshTableView];
}

- (IBAction)lastNameChanged:(UITextField*)sender {
    self.student.lastName = sender.text;
    [self refreshTableView];
}

- (IBAction)genderChanged:(UISegmentedControl*)sender {
    self.student.gender = (Gender)sender.selectedSegmentIndex;
    [self refreshTableView];
}

- (IBAction)ageChanged:(UITextField*)sender {
    self.student.age = [sender.text integerValue];
    [self refreshTableView];
}

- (IBAction)resetAllFields:(UIButton *)sender {
    self.student.firstName = @"";
    self.student.lastName = @"";
    self.student.gender = 2;
    self.student.age = 0;
    
    [self refreshTableView];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    
    NSLog(@"Field %@ changed", keyPath);
    
}

@end
