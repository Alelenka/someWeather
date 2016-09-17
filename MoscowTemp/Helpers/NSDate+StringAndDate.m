//
//  NSDate+StringAndDate.m
//  MoscowTemperature
//

//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "NSDate+StringAndDate.h"

@implementation NSDate (StringAndDate)

-(NSString *)convertDateToString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    return [formatter stringFromDate:self];
}

@end
