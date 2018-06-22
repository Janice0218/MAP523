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

@end

@implementation ViewController

//Initialized Product Manager if Null;

-(ProductManager*) productManager{
    if(_productManager ==nil){
        _productManager = [[ProductManager alloc]init];
    }
    
    //Sample Products
    Product* p1 = [[Product alloc]initWithProductName:@"Pants" andCost: 99.99 withTotal: 15] ;
    Product* p2 = [[Product alloc]initWithProductName:@"Laptop Bag" andCost: 164.99 withTotal: 5] ;
    Product* p3 = [[Product alloc]initWithProductName:@"Phone Case" andCost: 20.00 withTotal: 30] ;
    Product* p4 = [[Product alloc]initWithProductName:@"Wallet" andCost: 200.00 withTotal: 2] ;
    Product* p5 = [[Product alloc]initWithProductName:@"Baseball Hat" andCost: 50.99 withTotal: 10] ;
    Product* p6 = [[Product alloc]initWithProductName:@"Leather Belt" andCost: 155.99 withTotal: 6] ;
    Product* p7 = [[Product alloc]initWithProductName:@"Slippers" andCost: 20.99 withTotal: 5] ;
    Product* p8 = [[Product alloc]initWithProductName:@"Bluejays Socks" andCost: 10.99 withTotal: 10] ;
    
    [_productManager.allProducts addObject:p1];
    
    [_productManager.allProducts addObject:p2];
    
    [_productManager.allProducts addObject:p3];
    
    [_productManager.allProducts addObject:p4];
    
    [_productManager.allProducts addObject:p5];
    
    [_productManager.allProducts addObject:p6];
    
    [_productManager.allProducts addObject:p7];
    
    [_productManager.allProducts addObject:p8];
    
    return _productManager;
}




//Implementation for PickerView
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _productManager.allProducts.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    Product * p =  [_productManager.allProducts objectAtIndex:(int)row];
    NSString * productString = [[NSString alloc] initWithFormat:@"%@ - $%f",p.productName,p.productPrice];
    return productString;
}





//when user selects a row in picker view
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{

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
