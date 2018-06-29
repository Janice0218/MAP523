//
//  HistoryViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-25.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryDetailViewController.h"
#import "Product.h"
#import "ProductModelManager.h"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HistoryViewController
Product * productSelected;


//////Implementations for Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productHistory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Product * p = [self.productHistory objectAtIndex:indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
        NSString * prodstring = [[NSString alloc] initWithFormat:@"%@ - $%.2f", p.productName,p.productPrice ];
    NSLog(@"%@",prodstring);
    cell.textLabel.text =  prodstring;
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"Quantity: %d",p.productQuantity];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    productSelected =  [self.productHistory objectAtIndex:(int) indexPath.row];
}
/////End of tbel view implementations

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"DetailSegue"])
    {
        HistoryDetailViewController * detailView = [segue destinationViewController];
        detailView.ProductId = [[NSString alloc]initWithFormat:@"%d", productSelected.productId];
        detailView.ProductName= productSelected.productName;
        detailView.ProductPrice= [[NSString alloc]initWithFormat:@"$%.2f", productSelected.productPrice];
        detailView.ProductQuantity = [[NSString alloc] initWithFormat:@"%d", productSelected.productQuantity];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        NSString *date = [formatter stringFromDate: productSelected.dateChanged];
        detailView.ProductDate =  date;
    
    }
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
