//
//  ViewController.m
//  ObjCCodeChallenge
//
//  Created by Patrick Cooke on 7/22/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

#import "ViewController.h"
#import "RotaryWheel.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface ViewController () <WCSessionDelegate>

@end

@implementation ViewController

@synthesize sectorLabel;



- (void) wheelDidChangeValue:(NSString *)newValue {
    self.sectorLabel.text = newValue;
    NSLog(@"viewcontroller print %@",newValue);
    NSDictionary *applicationData = [[NSDictionary alloc] initWithObjects:@[newValue] forKeys:@[@"color"]];
    
    [[WCSession defaultSession] sendMessage:applicationData
                               replyHandler:^(NSDictionary *reply) {
                                   //handle reply from iPhone app here
                               }
                               errorHandler:^(NSError *error) {
                                   //catch any errors here
                               }
     ];
}


#pragma mark Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    sectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 60, self.view.center.y  + 125, 120, 30)];
    sectorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sectorLabel];
    RotaryWheel *wheel = [[RotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 200, 200) andDelegate:self withSections:4];
    wheel.center = CGPointMake(self.view.center.x , self.view.center.y);
    [self.view addSubview:wheel];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        NSLog(@"WCSession supported");
    }
    if ([[WCSession defaultSession] isReachable]) {
        NSLog(@"WCSession reachable");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

