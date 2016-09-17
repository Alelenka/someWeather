//
//  MoscowTempTests.m
//  MoscowTempTests
//
//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MoscowTempTests : XCTestCase
@property (nonatomic, strong) NSDictionary *response;
@end

@implementation MoscowTempTests

- (void)setUp {
    [super setUp];
    self.response =@{   @"coord":
                            @{
                                @"lon":@37.62,
                                @"lat":@55.75
                                },
                        @"weather":@[
                                
                                @{
                                    @"id":@620,
                                    @"main":@"Snow",
                                    @"description":@"light shower snow",
                                    @"icon":@"13d"
                                    }
                                ],
                        @"base":@"cmc stations",
                        @"main":
                            @{
                                @"temp":@-2.96,
                                @"pressure":@986,
                                @"humidity":@85,
                                @"temp_min":@-5
                                },
                        @"wind":
                            @{
                                @"speed":@8,
                                @"deg":@230
                                },
                        @"clouds":
                            @{
                                @"all":@88
                                },
                        @"dt":@1452679288,
                        @"sys":
                            @{
                                @"type":@1,
                                @"id":@7323,
                                @"message":@0.0033,
                                @"country":@"RU",
                                @"sunrise":@1452664301,
                                @"sunset":@1452691500
                                },
                        @"id":@524901,
                        @"name":@"Moscow",
                        @"cod":@200
                        };}

- (void)tearDown {
    [super tearDown];
}

- (void)testResponseIsCorrect {
    
    BOOL isDict = [self.response isKindOfClass:[NSDictionary class]];
    XCTAssertTrue(isDict);
    
    XCTAssertNotNil(self.response[@"main"], "main dict should not be nil");
    
    isDict = [self.response[@"main"] isKindOfClass:[NSDictionary class]];
    XCTAssertTrue(isDict);
    
    NSDictionary *main = self.response[@"main"];
    
    XCTAssertNotNil(main[@"temp"], "temp should not be nil");
    
    NSNumber *temp = main[@"temp"];
    
    BOOL isNumber = [temp isKindOfClass:[NSNumber class]];
    XCTAssertTrue(isNumber);
    int chekForBool = strcmp([temp objCType], @encode(BOOL));
    XCTAssertNotEqual(chekForBool, 0, @"temp is umber");

        // continue to check
    
    
        //or start to chek from web response
    /* NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=moscow,ru&APPID=1207f91615a941502cd55345527dc296&units=metric"];
     
     NSString *description = [NSString stringWithFormat:@"GET %@", url];
     XCTestExpectation *expectation = [self expectationWithDescription:description];
     
     NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
     XCTAssertNotNil(data, "data should not be nil");
     XCTAssertNil(error, "error should be nil");
     
     if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
     NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
     XCTAssertEqual(httpResponse.statusCode, 200, @"HTTP response status code should be 200");
     
     } else {
     XCTFail(@"Response was not NSHTTPURLResponse");
     }
     
     [expectation fulfill];
     }];
     [task resume];
     
     [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
     if (error != nil) {
     NSLog(@"Error: %@", error.localizedDescription);
     }
     [task cancel];
     }];
     
     
     */
}


@end
