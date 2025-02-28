//
//  ViewController.m
//  FlutterNativeDemo
//
//  Created by huawt on 2025/2/26.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()
@property (nonatomic, strong) FlutterViewController *flutterVC;
@end

@implementation ViewController
- (IBAction)buttonOneAction:(UIButton *)sender {

    [self.flutterVC setInitialRoute:@"one"];
    [self presentViewController:self.flutterVC animated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flutterVC =  [[FlutterViewController alloc] init];
    self.flutterVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

@end
