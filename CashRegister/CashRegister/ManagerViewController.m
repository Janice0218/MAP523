//
//  ManagerViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-28.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//
#import "Product.h"
#import "ManagerViewController.h"
#import "HistoryViewController.h"

@interface ManagerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *history;

@end

@implementation ManagerViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"HistorySegue"]){
        HistoryViewController * historyView = [segue destinationViewController];
        historyView.historyProductManager = self.connectorProductManager;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"1st product: %@",[[self.connectorProductManager.allProducts objectAtIndex:0] productName]);

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
