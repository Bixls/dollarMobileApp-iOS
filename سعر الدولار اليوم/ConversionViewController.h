//
//  ConversionViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 10,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chooseCountryViewController.h"

@interface ConversionViewController : UIViewController <UITextFieldDelegate,chooseCountryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (weak, nonatomic) IBOutlet UIButton *firstImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *firstLabelBtn;
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;

@property (weak, nonatomic) IBOutlet UIButton *secondImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondLabelBtn;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;


- (IBAction)firstImageBtnPressed:(id)sender;
- (IBAction)firstLabelBtnPressed:(id)sender;

- (IBAction)secondImageBtnPressed:(id)sender;
- (IBAction)secondLabelBtnPressed:(id)sender;
- (IBAction)dismissKeyboardWithBB:(id)sender;




@end
