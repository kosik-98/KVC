//
//  ViewController.h
//  KVC
//
//  Created by Harbros on 11.02.2019.
//  Copyright © 2019 Harbros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;

- (IBAction)firstNameChanged:(UITextField*)sender;
- (IBAction)lastNameChanged:(UITextField*)sender;
- (IBAction)genderChanged:(UISegmentedControl*)sender;
- (IBAction)ageChanged:(UITextField*)sender;
- (IBAction)resetAllFields:(UIButton *)sender;

@end

