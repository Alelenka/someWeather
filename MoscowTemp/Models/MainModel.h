//
//  MainModel.h
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

+ (void)getDayWeatherHandler:(void (^)(id object, NSError* error))completion;

@end
