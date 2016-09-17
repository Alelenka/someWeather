//
//  OpenWeather.m
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "OpenWeather.h"

@implementation OpenWeather

-(instancetype)initWithInfo:(NSDictionary *)info{
    self = [super init];
    if(self){
        self.temperature = info[@"main"][@"temp"];
        self.date = [NSDate dateWithTimeIntervalSince1970:[info[@"dt"] doubleValue]];
    }
    return self;
}

@end
