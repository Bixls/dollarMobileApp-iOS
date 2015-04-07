//
//  chooseCountryViewController.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 6,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "chooseCountryViewController.h"

@interface chooseCountryViewController ()

@end

@implementation chooseCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryList = [[CountryList alloc]init];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.countryList.countries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    Country *country =self.countryList.countries[indexPath.row];
    cell.textLabel.text = country.currencyFullName;
    cell.imageView.image = country.countryFlag;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Country *country = self.countryList.countries[indexPath.row];
    
    if([self.delegate respondsToSelector:@selector(selectedCountry:)])
    {
        
        [self.delegate selectedCountry:country];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
