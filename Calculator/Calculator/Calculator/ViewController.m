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

//getter
-(Calculator_Brain*) cal{
    if(_cal ==nil){
        _cal = [[Calculator_Brain alloc]init];
    }
    return _cal;
}

//events
- (IBAction)numberClick:(UIButton *)sender {
    _numberOutput.text =  sender.currentTitle;
}


- (IBAction)operationClick:(UIButton *)sender {
    if([sender.currentTitle isEqualToString:@"//"]){
        
    }
    else if([sender.currentTitle isEqualToString:@"*"]){
        
    }
    else if([sender.currentTitle isEqualToString:@"-"]){
        
    }
    else if([sender.currentTitle isEqualToString:@"+"]){
        
    }
    
}
- (IBAction)enterNumber:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
