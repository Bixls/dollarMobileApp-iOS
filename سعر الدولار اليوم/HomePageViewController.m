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
    self.countryList = [[CountryList alloc]init];
    
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self updateCurrencyWithPersistedData];

}




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

-(void)saveReceivedDataToDisk {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.receivedDictionary forKey:@"storedData"];
    [userDefaults synchronize];
}

-(void)updateCurrencyWithPersistedData {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *storedData = [userDefaults objectForKey:@"storedData"];
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


@end
