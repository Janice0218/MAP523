//
//  RestockViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-28.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//
#import "ViewController.h"
#import "RestockViewController.h"
#import "Product.h"

@interface RestockViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *quantityTextbox;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation RestockViewController
Product * updatedProduct = nil;
int quantity;
int productIndex;
//////Implementations for Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allProducts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Product * p = [self.allProducts objectAtIndex:indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    NSString * prodstring = [[NSString alloc] initWithFormat:@"%@ - $%.2f", p.productName,p.productPrice ];
    cell.textLabel.text =  prodstring;
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"Quantity: %d",p.productQuantity];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    updatedProduct = nil;
    updatedProduct = [self.allProducts objectAtIndex:(int)indexPath.row];
    productIndex =(int) indexPath.row;
    self.quantityTextbox.text = [[NSString alloc] initWithFormat:@"%d",updatedProduct.productQuantity ];
}


/////End of table view implementations
- (IBAction)clickedOK:(id)sender {
        updatedProduct.productQuantity += (int)[self.quantityTextbox.text integerValue];
    [self.delegate managerRestockProduct:updatedProduct atIndex: productIndex];
        [self.allProducts replaceObjectAtIndex: productIndex withObject: updatedProduct];
    [self.tableView reloadData];

    }





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
