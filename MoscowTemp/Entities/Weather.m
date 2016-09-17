//
//  Weather.m
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(instancetype)initWithInfo:(NSDictionary *)info{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(NSString *)returnStrindFromDate{
    return [self.date convertDateToString];
}

@end
