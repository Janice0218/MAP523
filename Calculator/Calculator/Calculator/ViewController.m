//
//  ViewController.m
//  Calculator
//
//  Created by Edmel John Ricahuerta on 2018-05-31.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//

#import "ViewController.h"
#import "Calculator_Brain.h"

@interface ViewController ()

@property(strong,nonatomic) Calculator_Brain * cal;
@property (weak, nonatomic) IBOutlet UILabel *numberOutput;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *buttonEnter;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubstract;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;



@end

@implementation ViewController

//events
- (IBAction)digitPressed:(UIButton *)sender {
    _numberOutput.text = [NSString stringWithFormat:@"%@%@",_numberOutput.text,sender.currentTitle];
}

- (IBAction)Operator_Click:(UIButton *)sender {
    if([sender.currentTitle isEqualToString:@"/"]){
        double output = [_cal calculate:@"/"];
      _numberOutput.text =
        [[NSString alloc]initWithFormat:@"%.02f" ,output];
    }
    if([sender.currentTitle isEqualToString:@"*"]){
        double output = [_cal calculate:@"*"];
        _numberOutput.text =
        [[NSString alloc]initWithFormat:@"%.02f" ,output];
    }
    if([sender.currentTitle isEqualToString:@"-"]){
        double output = [_cal calculate:@"-"];
        _numberOutput.text =
        [[NSString alloc]initWithFormat:@"%.02f" ,output];
    }
    if([sender.currentTitle isEqualToString:@"+"]){
        double output = [_cal calculate:@"+"];
        _numberOutput.text =
        [[NSString alloc]initWithFormat:@"%.02f" ,output];
    }
    
}
- (IBAction)Enter_Pressed:(id)sender {
    double val = [_numberOutput.text doubleValue];
    [_cal pushItem: val];
       _numberOutput.text = @"";

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //All initialization for buttons and Calculator
    _cal = [[Calculator_Brain alloc]init];
    
    
    
    
    _button1.layer.borderWidth =1.0f;
    _button1.layer.cornerRadius = 10;
    _button1.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button2.layer.borderWidth =1.0f;
    _button2.layer.cornerRadius = 10;
    _button2.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button3.layer.borderWidth =1.0f;
    _button3.layer.cornerRadius = 10;
    _button3.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button4.layer.borderWidth =1.0f;
    _button4.layer.cornerRadius = 10;
    _button4.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button5.layer.borderWidth =1.0f;
    _button5.layer.cornerRadius = 10;
    _button5.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button6.layer.borderWidth =1.0f;
    _button6.layer.cornerRadius = 10;
    _button6.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button7.layer.borderWidth =1.0f;
    _button7.layer.cornerRadius = 10;
    _button7.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button8.layer.borderWidth =1.0f;
    _button8.layer.cornerRadius = 10;
    _button8.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button9.layer.borderWidth =1.0f;
    _button9.layer.cornerRadius = 10;
    _button9.layer.borderColor = [UIColor grayColor].CGColor;
    
    _button0.layer.borderWidth =1.0f;
    _button0.layer.cornerRadius = 10;
    _button0.layer.borderColor = [UIColor grayColor].CGColor;
    
    _buttonAdd.layer.borderWidth =1.0f;
    _buttonAdd.layer.cornerRadius = 10;
    _buttonAdd.layer.borderColor = [UIColor grayColor].CGColor;
    
    _buttonSubstract.layer.borderWidth =1.0f;
    _buttonSubstract.layer.cornerRadius = 10;
    _buttonSubstract.layer.borderColor = [UIColor grayColor].CGColor;
    
    _buttonDivide.layer.borderWidth =1.0f;
    _buttonDivide.layer.cornerRadius = 10;
    _buttonDivide.layer.borderColor = [UIColor grayColor].CGColor;
    
    _buttonMultiply.layer.borderWidth =1.0f;
    _buttonMultiply.layer.cornerRadius = 10;
    _buttonMultiply.layer.borderColor = [UIColor grayColor].CGColor;
    
    _buttonEnter.layer.borderWidth =1.0f;
    _buttonEnter.layer.cornerRadius = 10;
    _buttonEnter.layer.borderColor = [UIColor grayColor].CGColor;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
