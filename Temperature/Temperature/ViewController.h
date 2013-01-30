//
//  ViewController.h
//  Temperature
//
//  Created by Romy Ilano on 1/30/13.
//  Copyright (c) 2013 Snowyla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldTemperature;
@property (weak, nonatomic) IBOutlet UILabel *labelFinal;
- (IBAction)btnPressedF2C:(id)sender;
- (IBAction)btnPressedC2F:(id)sender;




@end
