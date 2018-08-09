//
//  MainViewController.m
//  StockApp
//
//  Created by Edmel John Ricahuerta on 2018-08-09.
//  Copyright © 2018 seneca.map. All rights reserved.
//

#import "MainViewController.h"
#import "StockManagerModel.h"



@interface MainViewController ()<UITableViewDataSource,UITableViewDataSource>


@property (nonatomic,strong) StockManagerModel * stocksManager;


@end

@implementation MainViewController



-(StockManagerModel *) stocksManager {
    if(self.stocksManager == nil) {
        self.stocksManager = [[StockManagerModel alloc]init];
    }
    return self.stocksManager;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text  = @"Sample Text!";
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
