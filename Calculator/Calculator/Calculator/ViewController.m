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


@end

@implementation ViewController

//events
- (IBAction)numberClick:(UIButton *)sender {
    _numberOutput.text = [NSString stringWithFormat:@"%@%@",_numberOutput.text,sender.currentTitle];
}

- (IBAction)operationClick:(UIButton *)sender {
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
- (IBAction)enterNumber:(id)sender {
    double val = [_numberOutput.text doubleValue];
    [_cal pushItem: val];
       _numberOutput.text = @"";

}

- (void)viewDidLoad {
    [super viewDidLoad];
   _cal = [[Calculator_Brain alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
