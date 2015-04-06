//
//  firstTimeViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 6,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chooseCountryViewController.h"

@interface firstTimeViewController : UIViewController <chooseCountryViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *firstCountryImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondCountryImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *firstCountryLabelBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondCountryLabelBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;


- (IBAction)firstCountryImageBtnPressed:(id)sender;
- (IBAction)firstCountryLabelBtnPressed:(id)sender;

- (IBAction)secondCountryImageBtnPressed:(id)sender;
- (IBAction)secondCountryLabelBtnPressed:(id)sender;

- (IBAction)saveBtnPressed:(id)sender;

@end
