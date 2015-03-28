//
//  ViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 26,3//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "HomePageViewController.h"
#import "SWRevealViewController.h"

@interface HomePageViewController ()



@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}




@end
