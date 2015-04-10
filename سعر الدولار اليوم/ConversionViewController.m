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
@property (nonatomic) double firstCountryCurr;
@property (nonatomic) double secondCountryCurr;

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
    [self updateCurrencyWithPersistedData];
  

    [self updateUIWithPersistedData];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.firstTextField];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(secondTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.secondTextField];


}

-(void)viewDidAppear:(BOOL)animated {
    double input = [self.firstTextField.text doubleValue];
    if (input) {
        double tempValue = input/self.defaultCountry1.currencyValue;
        NSString *secondText = [NSString stringWithFormat:@"%.3f",tempValue*self.defaultCountry2.currencyValue];
        self.secondTextField.text =secondText;

    }
}


-(void)updateCurrencyWithPersistedData {
    
    NSDictionary *storedData = [self.userDefaults objectForKey:@"storedData"];
    NSArray *values = storedData[@"values"];
    for (Country *country in self.countryList.countries) {
        for (NSDictionary *dict in values) {
            NSString *title = [dict valueForKey:@"title"];
            if ([title isEqualToString:country.countryCode]) {
                country.currencyValue = [dict[@"value"]doubleValue];
                break;
            }
        }
    }
}

-(void)updateCurrencyOfSelectedCountry:(Country *)selectedCountry{
    for (Country *country in self.countryList.countries) {
        if (selectedCountry.countryCode == country.countryCode) {
            selectedCountry.currencyValue = country.currencyValue;
            if (selectedCountry.countryCode==self.defaultCountry1.countryCode) {
                self.defaultCountry1.currencyValue = selectedCountry.currencyValue;
            }else if (selectedCountry.countryCode == self.defaultCountry2.countryCode) {
                self.defaultCountry2.currencyValue= selectedCountry.currencyValue;
            }
        }
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

-(void)updateUI:(Country *)country {
    
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==0) {
        self.defaultCountry1 = country;
        [self.firstImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.firstLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.firstLabelBtn setTintColor:[UIColor blackColor]];
        [self updateCurrencyOfSelectedCountry:country];
      
    }else if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==1){
        self.defaultCountry2 = country;
        [self.secondImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        [self.secondLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        [self.secondLabelBtn setTintColor:[UIColor blackColor]];
        [self updateCurrencyOfSelectedCountry:country];
    }
}


-(void)firstTextFieldDidChange:(NSNotification *)notification {
    
    double input = [self.firstTextField.text doubleValue];
    double tempValue = input/self.defaultCountry1.currencyValue;
    NSString *secondText = [NSString stringWithFormat:@"%.3f",tempValue*self.defaultCountry2.currencyValue];
    //NSNumber *secondText = [NSNumber numberWithDouble:tempValue*self.defaultCountry2.currencyValue];
  //  self.secondTextField.text = [secondText stringValue];
    self.secondTextField.text = secondText;
}

-(void)secondTextFieldDidChange:(NSNotification *)notification {
    
    double input = [self.secondTextField.text doubleValue];
    double tempValue = input/self.defaultCountry2.currencyValue;
    NSString *firstText = [NSString stringWithFormat:@"%.3f",tempValue*self.defaultCountry1.currencyValue];
 
    self.firstTextField.text = firstText;

}

#pragma mark -Choose Country Delegate Methods

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

- (IBAction)dismissKeyboardWithBB:(id)sender {
    if ([self.firstTextField isFirstResponder]) {
        [self.firstTextField resignFirstResponder];
    }
    if ([self.secondTextField isFirstResponder]) {
        [self.secondTextField resignFirstResponder];
    }
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"chooseCountrySegue"]) {
        chooseCountryViewController *chooseCountryView = segue.destinationViewController;
        chooseCountryView.delegate = self;
    }
    
}

@end
