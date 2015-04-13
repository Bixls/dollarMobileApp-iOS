//
//  ViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 26,3//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryList.h"
#import "Country.h"
#import "chooseCountryViewController.h"
@interface HomePageViewController : UIViewController <chooseCountryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIButton *firstCountryImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondCountryImageBtn;
@property (weak, nonatomic) IBOutlet UIView *firstBtnView;
@property (weak, nonatomic) IBOutlet UIView *secondBtnView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstCountryCurrency;
@property (weak, nonatomic) IBOutlet UILabel *secondCountryCurrency;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;



- (IBAction)refreshButton:(id)sender;
- (IBAction)firstCountryBtnPressed:(id)sender;
- (IBAction)secondCountryBtnPressed:(id)sender;


@end

