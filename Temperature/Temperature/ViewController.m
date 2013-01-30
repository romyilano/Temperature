//
//  ViewController.m
//  Temperature
//
//  Created by Romy Ilano on 1/30/13.
//  Copyright (c) 2013 Snowyla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressedF2C:(id)sender {
    
    // convert fahrenheit to celsius
    // c = (f-32) * 5/9
    
    double startingFahrenheit = [self.textFieldTemperature.text doubleValue];
    
    double finalCelsius = (startingFahrenheit - 32) * 5.0/9.0;
    
    // this is a nice one to review
    self.labelFinal.text = [NSString stringWithFormat:@"%0.2f", finalCelsius];
    [self.textFieldTemperature resignFirstResponder];
    
}

- (IBAction)btnPressedC2F:(id)sender {
    
    // convert celsius to fahrenheit
    double startingCelsius = [self.textFieldTemperature.text doubleValue];
    
    double finalFahrenheit = (startingCelsius * 9.0/5.0) + 32;
    
    self.labelFinal.text = [NSString stringWithFormat:@"%0.2f", finalFahrenheit];
    
    [self.textFieldTemperature resignFirstResponder];
    
}


@end
