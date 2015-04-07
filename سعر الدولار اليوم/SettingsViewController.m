//
//  SettingsViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 7,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "Country.h"
@interface SettingsViewController ()

@property (nonatomic,strong) Country *defaultCountry1;
@property (nonatomic,strong) Country *defaultCountry2;
@property (nonatomic,strong) NSUserDefaults *userDefaults;
@property (nonatomic,strong) CountryList *countryList;

@property (nonatomic)NSInteger btnPressed;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryList= [[CountryList alloc]init];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    [self.userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.firstLabelBtn setTintColor:[UIColor blackColor]];
    [self.secondLabelBtn setTintColor:[UIColor blackColor]];
    
    NSLog(@"%ld",(long)[[self.userDefaults objectForKey:@"btnPressed"]integerValue]);

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    [self updateUIWithPersistedData];
}

//-(void)viewDidAppear:(BOOL)animated {
//    [self updateUIWithPersistedData];
//}

-(void)updateUI:(Country *)country {
    
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==0) {
        self.defaultCountry1 = country;
        [self.firstImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.firstLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.firstLabelBtn setTintColor:[UIColor blackColor]];

    }else if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==1){
        self.defaultCountry2 = country;
        [self.secondImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.secondLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.secondLabelBtn setTintColor:[UIColor blackColor]];

    }
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


#pragma mark - Choose Country Delegate Methods

-(void)selectedCountry:(Country *)country {
    [self updateUI:country];
}

#pragma mark - Buttons Methods

- (IBAction)firstImageBtnPressed:(id)sender {
    [self.userDefaults setValue:[NSNumber numberWithInteger:0] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];

}

- (IBAction)firstLabelBtnPressed:(id)sender {
    [self.userDefaults setValue:[NSNumber numberWithInteger:0] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)secondImageBtnPressed:(id)sender {
    [self.userDefaults setValue:[NSNumber numberWithInteger:1] forKey:@"btnPressed"];
    [self.userDefaults synchronize];

    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];

}

- (IBAction)secondLabelBtnPressed:(id)sender {
    [self.userDefaults setValue:[NSNumber numberWithInteger:1] forKey:@"btnPressed"];
    [self.userDefaults synchronize];

    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];

}

- (IBAction)saveBtnPressed:(id)sender {
    NSDictionary *userSettings = [NSDictionary dictionaryWithObjectsAndKeys:self.defaultCountry1.countryCode,@"firstCountryCode",self.defaultCountry2.countryCode,@"secondCountryCode", nil];
  
    [self.userDefaults setObject:userSettings forKey:@"userSettings"];
    [self.userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"chooseCountrySegue"]) {
        chooseCountryViewController *chooseCountryView = segue.destinationViewController;
        chooseCountryView.delegate = self;
    }
    
}

@end
