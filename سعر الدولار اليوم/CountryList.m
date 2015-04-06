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
        
        Country *America = [[Country alloc]initWithCountryCode:@"USD" countryName:@"الولايات المتحده الامريكية" currencyFullName:@"الدولار الأمريكي" currencyShortName:@"دولار" countryFlag:@"usd"];
        Country *Egypt = [[Country alloc]initWithCountryCode:@"EGP" countryName:@"مصر" currencyFullName:@"الجنيه المصري" currencyShortName:@"جنيه" countryFlag:@"egp"];

        Country *SaudiArabia = [[Country alloc]initWithCountryCode:@"SAR" countryName:@"السعودية" currencyFullName:@"الريال السعودي" currencyShortName:@"ريال" countryFlag:@"sar"];
        
        Country *Kuwait = [[Country alloc]initWithCountryCode:@"KWD" countryName:@"الكويت" currencyFullName:@"الدينار الكويتي" currencyShortName:@"دينار" countryFlag:@"kwd"];
        
        Country *Qatar = [[Country alloc]initWithCountryCode:@"QAR" countryName:@"قطر" currencyFullName:@"الريال القطري" currencyShortName:@"ريال" countryFlag:@"qar"];

        Country *Jordan = [[Country alloc]initWithCountryCode:@"JOD" countryName:@"الاردن" currencyFullName:@"الدينار الاردني" currencyShortName:@"دينار" countryFlag:@"jod"];

        Country *Bahrain = [[Country alloc]initWithCountryCode:@"BHD" countryName:@"البحرين" currencyFullName:@"الدينار البحريني" currencyShortName:@"دينار" countryFlag:@"bhd"];

        Country *Emirates = [[Country alloc]initWithCountryCode:@"AED" countryName:@"الإمارات" currencyFullName:@"الدرهم الاماراتي" currencyShortName:@"درهم" countryFlag:@"aed"];
        
        Country *Lebanon = [[Country alloc]initWithCountryCode:@"LBP" countryName:@"لبنان" currencyFullName:@"الليرة اللبنانية" currencyShortName:@"ليرة" countryFlag:@"lbp"];
        
        Country *Libya = [[Country alloc]initWithCountryCode:@"LYD" countryName:@"لبيا" currencyFullName:@"الدينار الليبي" currencyShortName:@"دينار" countryFlag:@"lyd"];
        Country *Tunis = [[Country alloc]initWithCountryCode:@"TND" countryName:@"تونس" currencyFullName:@"الدينار التونيسي" currencyShortName:@"دينار" countryFlag:@"tnd"];
        Country *Yemen = [[Country alloc]initWithCountryCode:@"YER" countryName:@"اليمن" currencyFullName:@"الريال اليمني" currencyShortName:@"ريال" countryFlag:@"yer"];
        Country *Syria = [[Country alloc]initWithCountryCode:@"SYP" countryName:@"سوريا" currencyFullName:@"الليرة السورية" currencyShortName:@"ليرة" countryFlag:@"syp"];
        
        Country *Algeria = [[Country alloc]initWithCountryCode:@"DZD" countryName:@"الجزائر" currencyFullName:@"الدينار الجزائري" currencyShortName:@"دينار" countryFlag:@"dzd"];
        _countries = @[America,Egypt,SaudiArabia,Kuwait,Qatar,Jordan,Bahrain,Emirates,Lebanon,Libya,Tunis,Yemen,Syria,Algeria];
        
    }
    return self;
}


@end
