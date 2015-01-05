//
//  ViewController.m
//  TipCalculator
//
//  Created by AP Fritts on 1/4/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;

- (IBAction)onTap:(id)sender;
- (IBAction)onEdit:(id)sender;

-(void)updateValues;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onEdit:(id)sender {
    // Change settings button to "Done"
}

-(void)updateValues {
    float bill = [self.billAmount.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipPercent = [tipValues[self.tipPercent.selectedSegmentIndex] floatValue];
    
    float tip = bill * tipPercent;
    float total = tip + bill;
    
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", total];
}

@end