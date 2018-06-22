//
//  ViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "ViewController.h"
#import "ProductManager.h"
#import "Product.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *totalCost;

@property (strong, nonatomic) ProductManager * productManager;

@property (weak, nonatomic) IBOutlet UILabel *totalQuantity;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@end

@implementation ViewController




//Implementation for PickerView
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _productManager.allProducts.count;
}







- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{

    if([_totalQuantity.text  isEqual: @"0"]){
    
    }


}

//end of Implementation for PickerView




//Buttons Action
- (IBAction)buyProduct:(id)sender {


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
