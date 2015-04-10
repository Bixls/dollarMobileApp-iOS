//
//  ConversionViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 10,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "ConversionViewController.h"
#import "SWRevealViewController.h"
@interface ConversionViewController ()

@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    
}



@end
