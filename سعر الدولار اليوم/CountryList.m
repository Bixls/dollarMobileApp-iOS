//
//  CountryLibrary.m
//  سعر الدولار اليوم
//
//  Created by Adham Gad on 5,4//15.
//  Copyright (c) 2015 Bixls. All rights reserved.
//

#import "CountryList.h"

@implementation CountryList

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        Country *America = [[Country alloc]initWithCountryCode:NSLocalizedString(@"usdCountryCode", "")
                                                   countryName:NSLocalizedString(@"usdCountryName", "")
                                              currencyFullName:NSLocalizedString(@"usdCurrFullName", "")
                                             currencyShortName:NSLocalizedString(@"usdCurrShortName", "")
                                                   countryFlag:@"usd"];
        
        Country *Egypt = [[Country alloc]initWithCountryCode:NSLocalizedString(@"egpCountryCode", "")
                                                 countryName:NSLocalizedString(@"egpCountryName", "")
                                            currencyFullName:NSLocalizedString(@"egpCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"egpCurrShortName", "")
                                                 countryFlag:@"egp"];

        Country *SaudiArabia = [[Country alloc]initWithCountryCode:NSLocalizedString(@"sarCountryCode", "")
                                                       countryName:NSLocalizedString(@"sarCountryName", "")
                                                  currencyFullName:NSLocalizedString(@"sarCurrFullName", "")
                                                 currencyShortName:NSLocalizedString(@"sarCurrShortName", "")
                                                       countryFlag:@"sar"];
        
        Country *Kuwait = [[Country alloc]initWithCountryCode:NSLocalizedString(@"kwdCountryCode", "")
                                                  countryName:NSLocalizedString(@"kwdCountryName", "")
                                             currencyFullName:NSLocalizedString(@"kwdCurrFullName", "")
                                            currencyShortName:NSLocalizedString(@"kwdCurrShortName", "")
                                                  countryFlag:@"kwd"];
        
        Country *Qatar = [[Country alloc]initWithCountryCode:NSLocalizedString(@"qarCountryCode", "")
                                                 countryName:NSLocalizedString(@"qarCountryName", "")
                                            currencyFullName:NSLocalizedString(@"qarCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"qarCurrShortName", "")
                                                 countryFlag:@"qar"];

        Country *Jordan = [[Country alloc]initWithCountryCode:NSLocalizedString(@"jodCountryCode", "")
                                                  countryName:NSLocalizedString(@"jodCountryName", "")
                                             currencyFullName:NSLocalizedString(@"jodCurrFullName", "")
                                            currencyShortName:NSLocalizedString(@"jodCurrShortName", "")
                                                  countryFlag:@"jod"];

        Country *Bahrain = [[Country alloc]initWithCountryCode:NSLocalizedString(@"bhdCountryCode", "")
                                                   countryName:NSLocalizedString(@"bhdCountryName", "")
                                              currencyFullName:NSLocalizedString(@"bhdCurrFullName", "")
                                             currencyShortName:NSLocalizedString(@"bhdCurrShortName", "")
                                                   countryFlag:@"bhd"];

        Country *Emirates = [[Country alloc]initWithCountryCode:NSLocalizedString(@"aedCountryCode", "")
                                                    countryName:NSLocalizedString(@"aedCountryName", "")
                                               currencyFullName:NSLocalizedString(@"aedCurrFullName", "")
                                              currencyShortName:NSLocalizedString(@"aedCurrShortName", "")
                                                    countryFlag:@"aed"];
        
        Country *Lebanon = [[Country alloc]initWithCountryCode:NSLocalizedString(@"lbpCountryCode", "")
                                                   countryName:NSLocalizedString(@"lbpCountryName", "")
                                              currencyFullName:NSLocalizedString(@"lbpCurrFullName", "")
                                             currencyShortName:NSLocalizedString(@"lbpCurrShortName", "")
                                                   countryFlag:@"lbp"];
        
        Country *Libya = [[Country alloc]initWithCountryCode:NSLocalizedString(@"lydCountryCode", "")
                                                 countryName:NSLocalizedString(@"lydCountryName", "")
                                            currencyFullName:NSLocalizedString(@"lydCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"lydCurrShortName", "")
                                                 countryFlag:@"lyd"];
        
        Country *Tunis = [[Country alloc]initWithCountryCode:NSLocalizedString(@"tndCountryCode", "")
                                                 countryName:NSLocalizedString(@"tndCountryName", "")
                                            currencyFullName:NSLocalizedString(@"tndCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"tndCurrShortName", "")
                                                 countryFlag:@"tnd"];
        
        Country *Yemen = [[Country alloc]initWithCountryCode:NSLocalizedString(@"yerCountryCode", "")
                                                 countryName:NSLocalizedString(@"yerCountryName", "")
                                            currencyFullName:NSLocalizedString(@"yerCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"yerCurrShortName", "")
                                                 countryFlag:@"yer"];
        
        Country *Syria = [[Country alloc]initWithCountryCode:NSLocalizedString(@"sypCountryCode", "")
                                                 countryName:NSLocalizedString(@"sypCountryName", "")
                                            currencyFullName:NSLocalizedString(@"sypCurrFullName", "")
                                           currencyShortName:NSLocalizedString(@"sypCurrShortName", "")                                                 countryFlag:@"syp"];
        
        Country *Algeria = [[Country alloc]initWithCountryCode:NSLocalizedString(@"dzdCountryCode", "")
                                                   countryName:NSLocalizedString(@"dzdCountryName", "")
                                              currencyFullName:NSLocalizedString(@"dzdCurrFullName", "")
                                             currencyShortName:NSLocalizedString(@"dzdCurrShortName", "")                                                   countryFlag:@"dzd"];
        
        _countries = @[America,Egypt,SaudiArabia,Kuwait,Qatar,Jordan,Bahrain,Emirates,Lebanon,Libya,Tunis,Yemen,Syria,Algeria];
        
    }
    return self;
}


@end
