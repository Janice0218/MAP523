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

@property (weak, nonatomic) IBOutlet UILabel* totalCost;
@property (strong, nonatomic) ProductManager* productManager;
@property (weak, nonatomic) IBOutlet UILabel* totalQuantity;
@property (weak, nonatomic) IBOutlet UIButton* buyButton;
@property (weak, nonatomic) IBOutlet UILabel* productName;
@property (weak, nonatomic) IBOutlet UIPickerView *productPickerView;

@end

@implementation ViewController

//Initialized Product Manager if Null;

-(ProductManager *) productManager {
    
    if(_productManager == nil){
        _productManager = [[ProductManager alloc]init];
    }
    return _productManager;
}




//Implementation for PickerView
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.productManager.allProducts.count;
    //_productManager.allProducts.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent: (NSInteger)component{
    
    Product* p =  [self.productManager.allProducts objectAtIndex:(int)row];
    NSString* productString = [[NSString alloc]initWithFormat:@"%@ - $%.2f",p.productName,p.productPrice ];
    return productString;

    
}






//when user selects a row in picker view
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if([_totalQuantity.text  isEqual: @"0"]){
    
    }
}

//end of Implementation for PickerView




//Buttons Action
- (IBAction)buyProduct:(id)sender {


}
- (IBAction)numberClicked:(UIButton*)sender {
    _totalQuantity.text  = [[sender titleLabel] text];
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
