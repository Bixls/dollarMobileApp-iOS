//
//  CountriesConversionViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 12,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@import GoogleMobileAds;

@interface CountriesConversionViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) Country *selectedCountry;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;



@end
