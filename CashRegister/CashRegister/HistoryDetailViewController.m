//
//  HistoryDetailViewController.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-29.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "HistoryDetailViewController.h"

@interface HistoryDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *productIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    //setting properties on load
    self.productIDLabel.text = self.ProductId;
    self.productNameLabel.text = self.ProductName;
    self.quantityLabel.text = self.ProductQuantity;
    self.priceLabel.text = self.ProductPrice;
    self.dateLabel.text = self.ProductDate;
    [super viewDidLoad];
    

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
