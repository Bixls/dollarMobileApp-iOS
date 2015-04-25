//
//  CountriesConversionViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 12,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "CountriesConversionViewController.h"
#import "CountryList.h"
#import "Country.h"



@interface CountriesConversionViewController ()

@property (nonatomic,strong) NSUserDefaults *userDefaults;
@property (nonatomic,strong) CountryList *countryList;
@property (nonatomic,strong) NSMutableArray *countries;
@property (nonatomic,strong) NSMutableArray *allCurrencies;
@end

@implementation CountriesConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    self.countryList = [[CountryList alloc]init];
    [self updateCurrencyWithPersistedData];
    self.countries = [[NSMutableArray alloc]init];
    for (Country *country in self.countryList.countries) {
        if (country.countryCode!=self.selectedCountry.countryCode) {
            [self.countries addObject:country];
           
        }else if (country.countryCode == self.selectedCountry.countryCode){
            self.selectedCountry = country;
        }
    }
    //أسعار العملات في
    NSString *temp = NSLocalizedString(@"shortLabel", "");
    self.firstLabel.text = [NSString stringWithFormat:@"%@ %@",temp,self.selectedCountry.countryName];
    NSString *temp2= NSLocalizedString(@"largeLabel", @"") ;
    //أسعار الدولار و العملات العربية اليوم بالمقارنة ب
    self.secondLabel.text = [NSString stringWithFormat:@"%@ %@",temp2,self.selectedCountry.currencyFullName];
    //AdMob
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
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
    cell.detailTextLabel.text = country.currencyFullName;
    double currencyValue = self.selectedCountry.currencyValue/country.currencyValue;
    cell.textLabel.text = [NSString stringWithFormat:@"%0.4f",currencyValue];
    return cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
