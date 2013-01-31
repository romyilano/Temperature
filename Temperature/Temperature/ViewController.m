//
//  ViewController.m
//  Temperature
//
//  Created by Romy Ilano on 1/30/13.
//  Copyright (c) 2013 Snowyla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// stanford paul h. says we don't have to do forward declaration of private methods anymore but some people like it
-(void)showConversion;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.labelFinal.text = @"Enter a temperature to be converted";
    
    // make the toolbar that appears above the keyboard
    [self makeToolBar];
    
    [self.segmentedControlTemperatures addTarget:self
                                          action:@selector(pickOne:)
                                forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UITextFieldDelegate

// talk in class - why doesn't this work?
// I didn't read the documentation clearly enough
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.textFieldTemperature resignFirstResponder];
}


// this is the boilerplate - need to reead the documentation
// the text field clals this method whenever the user taps the return button. you can use this method to implement any custom behavior when the button is tapped
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textFieldTemperature resignFirstResponder];

    // bugfix! should calculate!
    [self showConversion];
    
    
    return NO;
}

#pragma mark-Action Methods
- (IBAction)btnPressedGo:(id)sender {
    
    
    
    
    [self showConversion];
   
    
}

#pragma mark-Custom Methods


-(void)pickOne:(id)sender
{
    
    // thanks Shiny!
    // the segmented control assigned to the (id)sender
    // since we already know what the class is, we put it in (instead of id)
    //      terminology for that
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSInteger selectedSegment = [segmentedControl selectedSegmentIndex];
    
    // do stuff
    if(selectedSegment == 0)
    {
        [self convertFtoC];
        
        [self.textFieldTemperature resignFirstResponder];
    }
    else
    {
        [self convertCtoF];
        
        [self.textFieldTemperature resignFirstResponder];
        
    }
}

-(void)showConversion
{
    
    // ugly way to do it, less efficient too
    
    if(self.segmentedControlTemperatures.selectedSegmentIndex == 0)
    {
        [self convertFtoC];
               
        [self.textFieldTemperature resignFirstResponder];
        
    }
    
    else if (self.segmentedControlTemperatures.selectedSegmentIndex == 1)
    {
        // c to f
        [self convertCtoF];
        
        [self.textFieldTemperature resignFirstResponder];
        
    }
    
}

-(void)checkInput
{
    // make sure that the user is entering a float
    
    // to-do
}

// convert f to c
-(void)convertFtoC
{
    // f to c
    double startingTemperature = [self.textFieldTemperature.text doubleValue];
    
    double finalTemp = (startingTemperature - 32.0) * 5.0/9.0;
    
    self.labelFinal.text = [NSString stringWithFormat:@"%1.2f", finalTemp];

}

// convert c to f
-(void)convertCtoF
{
    double startingTemperature = [self.textFieldTemperature.text doubleValue];
    
    double finalTemperature = startingTemperature * 9.0/5.0 + 32.0;
    
    self.labelFinal.text = [NSString stringWithFormat:@"%1.2f", finalTemperature];
    
}


-(void)makeToolBar
{
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle=UIBarStyleBlackTranslucent;
  
    UIBarButtonItem *bbiCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)];
    
    UIBarButtonItem *bbiFlex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // to-do customize the uibarbuttonitem using UIAppearance
    UIBarButtonItem *bbiDone = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonSystemItemDone target:self action:@selector(doneWithNumberPad)];
 
    numberToolbar.items = [NSArray arrayWithObjects:bbiCancel, bbiFlex, bbiDone ,nil];
    
    [numberToolbar sizeToFit];
    
    self.textFieldTemperature.inputAccessoryView = numberToolbar;
}

-(void)cancelNumberPad
{
    [self.textFieldTemperature resignFirstResponder];
    self.textFieldTemperature.text = @"";
    
}

-(void)doneWithNumberPad
{

    [self showConversion];
    
    [self.textFieldTemperature resignFirstResponder];
}

#pragma mark-UIResponder
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textFieldTemperature resignFirstResponder];
}


/*
 
 For some reason this didn't work; "worked before"
 changed UIView to a UIControl
// I learned this from Big Nerd Ranch
- (IBAction)backgroundTapped:(id)sender {
    
    [[self view]endEditing:YES];
}
 */
@end
