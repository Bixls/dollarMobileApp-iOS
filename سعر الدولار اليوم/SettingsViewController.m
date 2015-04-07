//
//  SettingsViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 7,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    
}



- (IBAction)firstImageBtnPressed:(id)sender {
}

- (IBAction)firstLabelBtnPressed:(id)sender {
}

- (IBAction)secondImageBtnPressed:(id)sender {
}

- (IBAction)secondLabelBtnPressed:(id)sender {
}
@end
