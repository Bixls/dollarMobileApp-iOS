//
//  AllCountriesViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 12,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "AllCountriesViewController.h"
#import "SWRevealViewController.h"
#import "CountryList.h"
#import "Country.h"
#import "CountriesConversionViewController.h"
#import <GoogleMobileAds/GADInterstitial.h>

@interface AllCountriesViewController ()

@property (nonatomic,strong) CountryList *countryList;
@property (nonatomic,strong) NSArray *countries;
@property (nonatomic) NSInteger selectedCountryIndex;
@property (nonatomic,strong) Country *selectedCountry;
@property (nonatomic,strong) GADInterstitial *interstitial;
@end

@implementation AllCountriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backbutton =  [[UIBarButtonItem alloc] initWithTitle:@"رجوع" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [backbutton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:16],NSFontAttributeName,
                                        nil] forState:UIControlStateNormal];
    backbutton.tintColor = [UIColor blackColor];
    self.navigationItem.backBarButtonItem = backbutton;

    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    self.countryList = [[CountryList alloc]init];
    self.countries = self.countryList.countries;
    //AdMob
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    //AdMob-interstitial
    self.interstitial = [[GADInterstitial alloc] init];
    self.interstitial.adUnitID = @"ca-app-pub-3940256099942544/4411468910";
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on test devices.
    request.testDevices = @[@"2077ef9a63d2b398840261c8221a0c9b"];
    [self.interstitial loadRequest:request];

}
-(void)viewDidAppear:(BOOL)animated {
    //AdMob-interstitial
    self.interstitial = [[GADInterstitial alloc] init];
    self.interstitial.adUnitID = @"ca-app-pub-3940256099942544/4411468910";
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on test devices.
    request.testDevices = @[@"2077ef9a63d2b398840261c8221a0c9b"];
    [self.interstitial loadRequest:request];

}

#pragma mark - Table View Data Source Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.countries count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Country *country = self.countries[indexPath.row];
    cell.imageView.image = country.countryFlag;
    cell.textLabel.text = country.countryName;
    
    return cell ;
}

#pragma mark - Table View Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedCountry = self.countries[indexPath.row];
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self launchinterstitial];
    
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"countriesConversion"]) {
        CountriesConversionViewController *countriesConversionView = segue.destinationViewController;
        countriesConversionView.selectedCountry = self.selectedCountry;
    }
}
#pragma mark - AdMob Methods
-(void)launchinterstitial {
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:self];
    }
}


@end
