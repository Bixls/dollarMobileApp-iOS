//
//  Country.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 5,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "Country.h"

@implementation Country


- (instancetype)initWithCountryCode:(NSString *)code
                        countryName:(NSString  *)name
                  currencyFullName:(NSString *)currFullName
                  currencyShortName:(NSString *)currShortName
                        countryFlag:(NSString *)flag

{
    self = [super init];
    if (self) {
        _countryCode = code;
        _countryName = name;
        _currencyValue = 0;
        _currencyFullName = currFullName;
        _currencyShortName = currShortName;
        _countryFlag = [UIImage imageNamed:[NSString stringWithFormat:@"%@",flag]];
    }
    return self;
}



@end
