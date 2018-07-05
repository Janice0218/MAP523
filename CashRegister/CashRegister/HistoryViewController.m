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
@property (strong, nonatomic) IBOutlet UITableView * tableView;

@end

@implementation HistoryViewController


 //local var

//////Implementations for Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productHistory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Product * p = [self.productHistory objectAtIndex:indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    NSString * prodstring = [[NSString alloc] initWithFormat:@"%@ - $%.2f", p.productName,p.productPrice ];
    cell.textLabel.text =  prodstring;
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"Quantity: %d",p.productQuantity];
    return cell;
}
/////End of tbel view implementations

//segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"DetailSegue"])
    {
        
        HistoryDetailViewController * detailView = [segue destinationViewController];
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        Product * productSelected =  [self.productHistory objectAtIndex:(int) indexPath.row];
        detailView.ProductId = [[NSString alloc]initWithFormat:@"%d", productSelected.productId];
        detailView.ProductName= productSelected.productName;
        detailView.ProductPrice= [[NSString alloc]initWithFormat:@"$%.2f", productSelected.productPrice];
        detailView.ProductQuantity = [[NSString alloc] initWithFormat:@"%d", productSelected.productQuantity];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"E, d MMM yyyy HH:mm:ss"];
        NSString *dateString = [dateFormatter stringFromDate: productSelected.dateChanged];
        detailView.ProductDate = dateString;

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
