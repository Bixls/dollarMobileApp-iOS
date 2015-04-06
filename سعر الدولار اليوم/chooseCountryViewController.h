//
//  chooseCountryViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 6,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "CountryList.h"

@protocol chooseCountryViewControllerDelegate <NSObject>

-(void)selectedCountry:(Country *)country ;

@end

@interface chooseCountryViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;
@property (nonatomic,weak) id <chooseCountryViewControllerDelegate> delegate;

@property (strong,nonatomic) CountryList *countryList;


@end
