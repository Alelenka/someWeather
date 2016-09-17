//
//  Weather.h
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+StringAndDate.h"

@interface Weather : NSObject

@property (nonatomic, strong) NSString *temperature;
@property (nonatomic, strong) NSDate *date;
    //more properties

-(instancetype)initWithInfo:(NSDictionary *)info;
-(NSString *)returnStrindFromDate;

@end
