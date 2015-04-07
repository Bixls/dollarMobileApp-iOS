//
//  SettingsViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 7,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chooseCountryViewController.h"

@interface SettingsViewController : UIViewController <chooseCountryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (weak, nonatomic) IBOutlet UIButton *firstImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *firstLabelBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondLabelBtn;

- (IBAction)firstImageBtnPressed:(id)sender;
- (IBAction)firstLabelBtnPressed:(id)sender;
- (IBAction)secondImageBtnPressed:(id)sender;
- (IBAction)secondLabelBtnPressed:(id)sender;
- (IBAction)saveBtnPressed:(id)sender;

@end
