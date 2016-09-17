//
//  WeatherGenerator.h
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenWeather.h"

@interface WeatherGenerator : NSObject

-(Weather *)getWeatherFromDict:(NSDictionary *)dictionary;

@end
