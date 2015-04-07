//
//  firstTimeViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 6,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "firstTimeViewController.h"
#import "CountryList.h"
#import "Country.h"

@interface firstTimeViewController ()

@property (nonatomic,strong) Country *defaultCountry1;
@property (nonatomic,strong) Country *defaultCountry2;
@property (nonatomic,strong) CountryList *countrylist;
@property (nonatomic) NSInteger btnPressed;

@end

@implementation firstTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    
    self.countrylist = [[CountryList alloc]init];
    self.defaultCountry1 = self.countrylist.countries[0];
    self.defaultCountry2 = self.countrylist.countries[1];
    
   
    
    [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.defaultCountry1.countryFlag]];
    [self.firstCountryLabelBtn setTitle:self.defaultCountry1.currencyFullName forState:UIControlStateNormal];
    [self.firstCountryLabelBtn setTintColor:[UIColor blackColor]];
    
    [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.defaultCountry2.countryFlag]];
    [self.secondCountryLabelBtn setTitle:self.defaultCountry2.currencyFullName forState:UIControlStateNormal];
    [self.secondCountryLabelBtn setTintColor:[UIColor blackColor]];
    
    [self.saveBtn setTintColor:[UIColor blackColor]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"chooseCountrySegue"]) {
        chooseCountryViewController *chooseCountryView = segue.destinationViewController;
        chooseCountryView.delegate = self;
    }
    
}

#pragma mark - Buttons Methods

- (IBAction)firstCountryImageBtnPressed:(id)sender {
    self.btnPressed = 0;
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)firstCountryLabelBtnPressed:(id)sender {
    self.btnPressed = 0;
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)secondCountryImageBtnPressed:(id)sender {
    self.btnPressed = 1;
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)secondCountryLabelBtnPressed:(id)sender {
    self.btnPressed = 1;
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)saveBtnPressed:(id)sender {
    
    NSDictionary *userSettings = [NSDictionary dictionaryWithObjectsAndKeys:self.defaultCountry1.countryCode,@"firstCountryCode",self.defaultCountry2.countryCode,@"secondCountryCode", nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"HasLaunchedOnce"];
    [userDefaults setObject:userSettings forKey:@"userSettings"];
    [userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    [userDefaults synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ChooseCountry Delegate Method

-(void)selectedCountry:(Country *)country {
    
    if (self.btnPressed == 0 ) {
        self.defaultCountry1 = country;
        [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.firstCountryLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.firstCountryLabelBtn setTintColor:[UIColor blackColor]];
        
//        [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:[self.countrylist.countries[0] countryFlag]]];
//        [self.secondCountryLabelBtn setTitle:[self.countrylist.countries[0] currencyFullName] forState:UIControlStateNormal];
//        [self.secondCountryLabelBtn setTintColor:[UIColor blackColor]];

    }else if (self.btnPressed == 1) {
        self.defaultCountry2 = country;
        [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.secondCountryLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.secondCountryLabelBtn setTintColor:[UIColor blackColor]];
    }
}

@end
