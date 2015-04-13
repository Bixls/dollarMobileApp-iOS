//
//  AllCountriesViewController.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 12,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllCountriesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
