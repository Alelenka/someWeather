//
//  MainModel.m
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "MainModel.h"
#import "AFNetworking.h"
#import "WeatherGenerator.h"

#define ROOT_URL @"http://api.openweathermap.org/data/2.5/weather?q=moscow,ru&APPID=1207f91615a941502cd55345527dc296&units=metric"

@implementation MainModel

#pragma mark - Network
+ (void)makeRequestWithURL:(NSString *)urlStr completion:(void (^)(NSDictionary* response))completion error: (void (^)(NSError* error))fail{
   AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlStr parameters:nil error:nil];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            if (completion) {
                completion(responseObject);
            }
        } else {
            if (fail) {
                fail(error);
            }
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }] resume];
}


+ (void)getDayWeatherHandler:(void (^)(id object, NSError* error))completion {
    [self makeRequestWithURL:@"http://api.openweathermap.org/data/2.5/weather?q=moscow,ru&APPID=1207f91615a941502cd55345527dc296&units=metric" completion:^(NSDictionary *response) {
        WeatherGenerator *weatherGenerator = [[WeatherGenerator alloc] init];
        Weather *weather = [weatherGenerator getWeatherFromDict:response];
        if(completion){
            completion(weather,nil);
        }
    } error:^(NSError *error) {
        if(completion){
            completion(nil, error);
        }
    }];
}

@end
