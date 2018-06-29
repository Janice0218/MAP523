//
//  ViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "ViewController.h"
#import "ProductModelManager.h"
#import "Product.h"
#import "ManagerViewController.h"
#import "RestockViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UpdatingProductDelegate>

@property (weak, nonatomic) IBOutlet UILabel* totalCostLabel;
@property (strong, nonatomic) ProductModelManager * productManager;
@property (weak, nonatomic) IBOutlet UILabel* totalQuantityLabel;
@property (weak, nonatomic) IBOutlet UIButton* buyButton;
@property (weak, nonatomic) IBOutlet UILabel* productNameLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *productPickerView;

@end

@implementation ViewController


//local variables
Product * p = nil;
int indexOfProduct;
int quantityToBuy;

//Initialized Product Manager if Null;
-(ProductModelManager *) productManager {
    
    if(_productManager == nil){
        _productManager = [[ProductModelManager alloc]init];
    }
    
    return _productManager;
} //end of init;




//Implementation of picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.productManager.allProducts.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent: (NSInteger)component{
    p = nil;
    p =  [self.productManager.allProducts objectAtIndex:(int)row];
    NSString* productString = [[NSString alloc]initWithFormat:@"%d of %@ $%.2f",p.productQuantity,p.productName,p.productPrice ];
    return productString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     p =  [self.productManager.allProducts objectAtIndex:(int) row];
    indexOfProduct =(int) row;
    self.productNameLabel.text = p.productName;
    [self calculate:p];
}
//end of Implementation for PickerView



//implementation of restock delegate
-(void) managerRestockProduct:(Product *)product atIndex:(int)index{
    
    [self.productManager.allProducts replaceObjectAtIndex:index withObject:product];
    [self.productPickerView reloadAllComponents];

}

//calculate price
-(void) calculate :(Product*) product{
    self.totalCostLabel.text = [[NSString alloc]initWithFormat:@"%.2f",[self.totalQuantityLabel.text doubleValue] * product.productPrice];
}


//Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    if([[segue identifier] isEqualToString:@"ManagerSegue"]){
        
        ManagerViewController * managerView = [segue destinationViewController];
        managerView.gatewaProductManager = self.productManager;
        managerView.delegate = self;
        

    }
}

//buy buttons
- (IBAction)buyProduct:(id)sender {
    
    if(p ==nil ){
        p = [self.productManager.allProducts objectAtIndex:0];
    }
    
    
    if(p.productQuantity == 0){
        self.totalCostLabel.text = @"SOLD OUT!";
    }
    else
    {
        int quantityAfter  =  p.productQuantity - (int)[self.totalQuantityLabel.text integerValue];
        if(quantityAfter <= -1 || [self.totalCostLabel.text doubleValue] == 0){
            self.totalCostLabel.text = @"INVALID QUANTITY!";
        }
        else{
            [self.productManager buyProductWithTotal:quantityAfter atIndex: indexOfProduct];
            [self.productPickerView reloadAllComponents];
            Product * prodToBought = p;
            
            [self.productManager addProductBoughtToList:prodToBought WithQuantityOf:(int)[self.totalQuantityLabel.text integerValue] thatCost: [self.totalCostLabel.text doubleValue]];
        }
    }
}


//number buttons
- (IBAction)numberClicked:(UIButton*)sender {
    if( ((int)[_totalQuantityLabel.text length]) < 2 ){
        self.totalQuantityLabel.text = [[NSString alloc]initWithFormat:@"%@%@",self.totalQuantityLabel.text, [[sender titleLabel] text] ];
    }
    else{
        self.totalQuantityLabel.text  = [[sender titleLabel] text];
    }
    [self calculate:p];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
