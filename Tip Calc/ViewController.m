//
//  ViewController.m
//  Tip Calc
//
//  Created by Trustin Harris on 6/26/18.
//  Copyright © 2018 Trustin Harris. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillField;
@property (weak, nonatomic) IBOutlet UILabel *TipLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TipSegmentedControl;

@end

@implementation ViewController

- (IBAction)Tap:(id)sender {
    [self.view endEditing:YES]; // Gets rid of keyboard
}
    
- (IBAction)EditText:(id)sender {
    
    NSArray *percents = @[@(0.1), @(0.15), @(0.2)];
    
    double tipPercents = [percents[self.TipSegmentedControl.selectedSegmentIndex] doubleValue];
    
    double bill = [self.BillField.text doubleValue];
    double tip = tipPercents * bill;
    double total = bill + tip;
    
    self.TipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.TotalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
}

- (IBAction)EditingBegan:(id)sender {
    self.BillField.text = @"";
    
}
- (IBAction)EditingEnd:(id)sender {
   
}
- (IBAction)Slider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSString *number;
    number = [NSString stringWithFormat:@"$%.2f", slider.value];
    
     double bill = [self.BillField.text doubleValue];
    double tip = [[number substringFromIndex:1] doubleValue];
    double total = bill + tip;
    self.TotalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
    
    
    
    self.TipLabel.text = number;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.BillField.text = [NSString stringWithFormat: @"0.00"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
