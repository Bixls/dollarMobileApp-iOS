//
//  ViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 26,3//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryList.h"
#import "Country.h"
@interface HomePageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (strong,nonatomic) NSDictionary *receivedDictionary;
@property (nonatomic,strong) CountryList *countryList;

- (IBAction)refreshButton:(id)sender;


@end

