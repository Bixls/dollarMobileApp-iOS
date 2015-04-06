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
    [self.userDefaults setObject:[NSNumber numberWithInteger:-1] forKey:@"btnPressed"];
    //check if this is the first launch for the app
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"HasLaunchedOnce"]) {
        [self performSegueWithIdentifier:@"firstTimeSegue" sender:self];
    }
    
    self.countryList = [[CountryList alloc]init];
    
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    self.firstBtnView.layer.cornerRadius = 34;
    self.firstBtnView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    self.secondBtnView.layer.cornerRadius = 34;
    self.secondBtnView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    
    [self updateCurrencyWithPersistedData];
    [self updateButtons];

}

-(void)viewDidAppear:(BOOL)animated {
    [self updateButtons];
}

#pragma mark - Data Manipulation methods

-(void)saveReceivedDataToDisk {
    
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [self.userDefaults setObject:self.receivedDictionary forKey:@"storedData"];
    [self.userDefaults synchronize];
}

-(void)updateCurrencyWithPersistedData {
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
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

-(void)updateButtons {
   // NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]==-1) {
        
        NSDictionary *userSettings = [self.userDefaults objectForKey:@"userSettings"];
        //update buttons with user settings
        
        for (Country *country in self.countryList.countries) {
            
            if ([[userSettings valueForKey:@"firstCountryCode"] isEqualToString:country.countryCode]) {
                
                [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
            }
            if ([[userSettings valueForKey:@"secondCountryCode"] isEqualToString:country.countryCode]) {
                
                [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
            }
        }

    }
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"chooseCountrySegue"]) {
        chooseCountryViewController *chooseCountryView = segue.destinationViewController;
        chooseCountryView.delegate = self;
    }
    
}

#pragma mark - Choose Country Delegate Method

-(void)selectedCountry:(Country *)country {
    if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]== 0 ) {
        self.firstCountry = country;
        [self.firstCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        //[self.firstCountryLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        //[self.firstCountryLabelBtn setTintColor:[UIColor blackColor]];
        
    }else if ([[self.userDefaults objectForKey:@"btnPressed"]integerValue]== 1) {
        
        self.secondCountry = country;
        [self.secondCountryImageBtn setBackgroundColor:[UIColor colorWithPatternImage:country.countryFlag]];
        // [self.secondCountryLabelBtn setTitle:country.currencyFullName forState:UIControlStateNormal];
        // [self.secondCountryLabelBtn setTintColor:[UIColor blackColor]];
    }
}


#pragma mark - Buttons 

- (IBAction)refreshButton:(id)sender {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://www.dollar-prices-today.com/api.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *receivedData = [NSData dataWithContentsOfURL:location];
        
        self.receivedDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:nil];
        [self saveReceivedDataToDisk];
        [self updateCurrencyWithPersistedData];
    }];
    [task resume];

}
- (IBAction)firstCountryBtnPressed:(id)sender {
    
    [self.userDefaults setValue:[NSNumber numberWithInteger:0] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}

- (IBAction)secondCountryBtnPressed:(id)sender {
    
    [self.userDefaults setValue:[NSNumber numberWithInteger:1] forKey:@"btnPressed"];
    [self.userDefaults synchronize];
    
    [self performSegueWithIdentifier:@"chooseCountrySegue" sender:self];
}






@end
