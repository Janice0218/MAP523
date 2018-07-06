//
//  CheckOutViewController.m
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//

#import "Food.h"
#import "CheckOutViewController.h"



@interface CheckOutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CheckOutViewController



///TABLEVIEW IMPL
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Orders.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Food * food = [self.Orders objectAtIndex:(int)indexPath.row];
    
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"order"];
    
    NSString * foodstring = [[NSString alloc] initWithFormat:@"%@\t%d",food.Name,food.Quantity];
    NSLog(@"%@",foodstring);
    cell.textLabel.text = foodstring;

    return cell;
}
///END OF TABLEVIEW

- (IBAction)finishedButton:(id)sender {
 
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Thank you!"
                                 message:@"Enjoy Your Meal!"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    
                            
                                    [self dismissViewControllerAnimated:YES completion:nil];
                                    [self.delegate FinishedOrdering];
                                    [self.Orders removeAllObjects];
                                    [self.tableView reloadData];
                                    
                                }];
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:NO completion:nil];
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
