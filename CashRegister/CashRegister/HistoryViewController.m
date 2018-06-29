//
//  HistoryViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-25.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "HistoryViewController.h"
#import "Product.h"
#import "ProductModelManager.h"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HistoryViewController



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

/////End of tbel view implementations



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
