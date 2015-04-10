//
//  ConversionViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 10,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "ConversionViewController.h"
#import "SWRevealViewController.h"
#import "Country.h"
#import "CountryList.h"
@interface ConversionViewController ()

@property (nonatomic,strong) CountryList *countryList;
@property (nonatomic,strong) Country *defaultCountry1;
@property (nonatomic,strong) Country *defaultCountry2;

@property (nonatomic,strong) NSUserDefaults *userDefaults;

@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.countryList = [[CountryList alloc]init];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    [self.userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    
    [self.firstLabelBtn setTintColor:[UIColor blackColor]];
    [self.secondLabelBtn setTintColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    
    [self updateUIWithPersistedData];


}

-(void)updateUIWithPersistedData {
    
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==-1) {
        
        NSDictionary *userSettings = [self.userDefaults objectForKey:@"userSettings"];
        
        for (Country *country in self.countryList.countries) {
            if ([[userSettings valueForKey:@"firstCountryCode"] isEqualToString:country.countryCode]) {
                self.defaultCountry1 = country;
                [self.firstImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
                [self.firstLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
            }
            if ([[userSettings valueForKey:@"secondCountryCode"] isEqualToString:country.countryCode]) {
                self.defaultCountry2 = country;
                [self.secondImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
                [self.secondLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
            }
            
        }
        
    }
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
