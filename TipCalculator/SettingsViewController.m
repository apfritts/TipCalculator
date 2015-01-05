//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by AP Fritts on 1/5/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;


- (IBAction)onTip:(id)sender;
-(void)onBackButton;

@end

@implementation SettingsViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger percentIndex = [defaults integerForKey:@"percent index"];
    NSLog(@"Trying to set percentIndex to %li", (long)percentIndex);
    self.tipPercent.selectedSegmentIndex = percentIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onTip:(id)sender {
    NSInteger percentIndex = self.tipPercent.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:percentIndex forKey:@"percent index"];
    [defaults synchronize];
    NSLog(@"Setting percentIndex to %li", (long)percentIndex);
}

-(void)onBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
