//
//  MainViewController.m
//  StockApp
//
//  Created by Edmel John Ricahuerta on 2018-08-09.
//  Copyright © 2018 seneca.map. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate>

@end

@implementation MainViewController


-(StockManagerModel *) stockManager {
    if(_stockManager == nil) {
    
        _stockManager = [[StockManagerModel alloc]init];
    }
    return _stockManager;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stockManager.stockList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Cell";
    
    return cell;
    
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
