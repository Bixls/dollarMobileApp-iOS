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

@property (nonatomic) NSInteger btnPressed;
@property (strong,nonatomic) NSDictionary *receivedDictionary;
@property (nonatomic,strong) CountryList *countryList;
@property (nonatomic,strong) Country *firstCountry;
@property (nonatomic,strong) Country *secondCountry;
@property (nonatomic,strong) NSUserDefaults *userDefaults;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    if (![self.userDefaults boolForKey:@"HasLaunchedOnce"]) {
        [self performSegueWithIdentifier:@"firstTimeSegue" sender:self];
    }
    
    [self.userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    self.firstBtnView.layer.cornerRadius = 34;
    self.firstBtnView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    self.secondBtnView.layer.cornerRadius = 34;
    self.secondBtnView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    
    self.countryList = [[CountryList alloc]init];
    [self updateCurrencyWithPersistedData];
    [self updateUIWithPersistedData];
  
}

-(void)viewDidAppear:(BOOL)animated {
    [self updateUIWithPersistedData];
}

#pragma mark - Data Manipulation methods

-(void)saveReceivedDataToDisk {
    [self.userDefaults setObject:self.receivedDictionary forKey:@"storedData"];
    [self.userDefaults synchronize];
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

-(void)updateUIWithPersistedData {
   
    if ([[self.userDefaults valueForKey:@"btnPressed"]integerValue]==-1) {
        
        NSDictionary *userSettings = [self.userDefaults objectForKey:@"userSettings"];
        
        for (Country *country in self.countryList.countries) {
            if ([[userSettings valueForKey:@"firstCountryCode"] isEqualToString:country.countryCode]) {
                self.firstCountry = country;
                [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.firstCountry.countryFlag]];
                double temp = [self calculateTheOtherCurrencyFromValueOfFirstCountry:self.firstCountry.currencyValue valueOfSecondCountry:self.secondCountry.currencyValue];
                //NSNumber *currencyValue = @(temp);
                self.firstCountryCurrency.text = @"1";
                self.secondCountryCurrency.text = [NSString stringWithFormat:@"%.4f",temp];
               // self.secondCountryCurrency.text= [currencyValue stringValue];
                self.firstLabel.text = self.firstCountry.currencyShortName;
              
                
            }
            if ([[userSettings valueForKey:@"secondCountryCode"] isEqualToString:country.countryCode]) {
                self.secondCountry = country;
                [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.secondCountry.countryFlag]];
               // NSNumber *currencyValue = @(self.secondCountry.currencyValue);
               // self.secondCountryCurrency.text = [currencyValue stringValue];
                self.secondCountryCurrency.text = [NSString stringWithFormat:@"%.4f",self.secondCountry.currencyValue];
                self.secondLabel.text = self.secondCountry.currencyShortName;
            }
            if ([[userSettings valueForKey:@"firstCountryCode"] isEqualToString:country.countryCode]&&[[userSettings valueForKey:@"secondCountryCode"] isEqualToString:country.countryCode]) {
                self.firstCountry = country;
                self.secondCountry = country;
                
                [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.firstCountry.countryFlag]];
                [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:self.secondCountry.countryFlag]];
                
                double temp = [self calculateTheOtherCurrencyFromValueOfFirstCountry:self.firstCountry.currencyValue valueOfSecondCountry:self.secondCountry.currencyValue];
               // NSNumber *currencyValue = @(temp);
                self.firstCountryCurrency.text = @"1";
                self.secondCountryCurrency.text = [NSString stringWithFormat:@"%.4f",temp];
               // self.secondCountryCurrency.text= [currencyValue stringValue];
                self.firstLabel.text = self.firstCountry.currencyShortName;
                self.secondLabel.text = self.secondCountry.currencyShortName;
            }

        }
        
    }
}



#pragma mark - Choose Country Delegate Method

-(void)selectedCountry:(Country *)country {
    [self updateUI:country];
}

-(void)updateUI:(Country *)country {
  
    for (Country *tempCountry in self.countryList.countries) {
        if (tempCountry.countryCode == country.countryCode) {
            country=tempCountry;
        }
    
      
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]== 0 ) {
        self.firstCountry = country;
        [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        double temp = [self calculateTheOtherCurrencyFromValueOfFirstCountry:self.firstCountry.currencyValue valueOfSecondCountry:self.secondCountry.currencyValue];
        //NSNumber *currencyValue = @(temp);
        self.firstCountryCurrency.text = @"1";
        self.secondCountryCurrency.text = [NSString stringWithFormat:@"%.4f",temp];
//        self.secondCountryCurrency.text= [currencyValue stringValue];
        self.firstLabel.text = self.firstCountry.currencyShortName;
      
        
    }else if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]== 1) {
        self.secondCountry = country;
        [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        
        double temp = [self calculateTheOtherCurrencyFromValueOfFirstCountry:self.firstCountry.currencyValue valueOfSecondCountry:self.secondCountry.currencyValue];
       // NSNumber *currencyValue = @(temp);
        self.secondCountryCurrency.text = [NSString stringWithFormat:@"%.4f",temp];
       // self.secondCountryCurrency.text= [currencyValue stringValue];
        self.secondLabel.text = self.secondCountry.currencyShortName;

    }

    
    }
}

-(double)calculateTheOtherCurrencyFromValueOfFirstCountry:(double)firstValue valueOfSecondCountry:(double)secondValue{
    
    double tempValue = 1/firstValue;
    return tempValue*secondValue;
    
}
#pragma mark - Buttons 

- (IBAction)refreshButton:(id)sender {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://www.dollar-prices-today.com/api.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *receivedData = [NSData dataWithContentsOfURL:location];
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"عذراً" message:@"من فضلك تأكد من وجود انترنت للتحديث" delegate:nil cancelButtonTitle:@"تم" otherButtonTitles:nil, nil];
            [alert show];
        }else{
             self.receivedDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self saveReceivedDataToDisk];
                [self updateCurrencyWithPersistedData];
                [self updateUIWithPersistedData];
                NSDate *date = [NSDate date];
                NSDateFormatter *dateformat = [[NSDateFormatter alloc]init];
                [dateformat setDateFormat:@"dd/MM/yyyy hh:mm a"];
                self.dateLabel.text = [dateformat stringFromDate:date];

            });

        }
    }];
    [task resume];
    
    


}

- (IBAction)firstCountryBtnPressed:(id)sender {
    
     [self.userDefaults setObject:[NSNumber numberWithInteger:0] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)secondCountryBtnPressed:(id)sender {
    
    [self.userDefaults setObject:[NSNumber numberWithInteger:1] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"chooseCountrySegue"]) {
        chooseCountryViewController *chooseCountryView = segue.destinationViewController;
        chooseCountryView.delegate = self;
    }
    
}




@end
