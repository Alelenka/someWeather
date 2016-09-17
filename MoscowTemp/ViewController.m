//
//  ViewController.m
//  MoscowTemp
//
//  Copyright © 2016 Alyona Belyaeva. All rights reserved.
//

#import "ViewController.h"
#import "MainModel.h"
#import "Weather.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actInd;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MainModel getDayWeatherHandler:^(id object, NSError *error) {
        if(error){
                //processing the errors
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Что-то пошло не так" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            Weather *weather = object;
            [self.actInd setHidden:YES];
            self.dateLabel.text = [weather returnStrindFromDate];
            self.temperatureLabel.text = [NSString stringWithFormat:@"%@ Cº",weather.temperature];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
