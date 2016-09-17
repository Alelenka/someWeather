//
//  WeatherGenerator.m
//  MoscowTemperature
//
//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "WeatherGenerator.h"

@implementation WeatherGenerator

-(Weather *)getWeatherFromDict:(NSDictionary *)dictionary{
    if(dictionary[@"main"]){ //or some condition
        OpenWeather * weather = [[OpenWeather alloc] initWithInfo:dictionary];
        return weather;
    }
        //here we can create weather from different sources
    return nil;
}

@end
