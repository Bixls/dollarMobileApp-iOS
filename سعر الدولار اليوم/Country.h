//
//  Country.h
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 5,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Country : NSObject

@property (nonatomic,strong) NSString *countryCode;
@property (nonatomic,strong) NSString *countryName;
@property (nonatomic) double currencyValue;
@property (nonatomic,strong) NSString *currencyFullName;
@property (nonatomic,strong) NSString *currencyShortName;
@property (nonatomic,strong) UIImage *countryFlag;

- (instancetype)initWithCountryCode:(NSString *)code
                        countryName:(NSString  *)name
                   currencyFullName:(NSString *)currFullName
                  currencyShortName:(NSString *)currShortName
                        countryFlag:(NSString *)flag;

@end
