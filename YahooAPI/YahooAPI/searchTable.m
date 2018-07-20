//
//  searchTable.m
//  YahooAPI
//
//  Created by Rania Arbash on 2018-07-19.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "searchTable.h"
#import "YahooSearchModel.h"
#import "YahooDetailViewController.h"
@interface searchTable ()<UISearchBarDelegate,searchDelegate>
@property (nonatomic,strong)NSArray* results;
@property (nonatomic,strong)YahooSearchModel* myModel;

@end

@implementation searchTable

-(void)yahooSearchDidFinishWithResults:(NSArray *)results{

    self.results = results;
    
    [self.tableView reloadData];
    

}

-(YahooSearchModel*)myModel{

    if (_myModel == nil){
    
        _myModel = [[YahooSearchModel alloc]init];
        _myModel.delegate = self;
    }
    return _myModel;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchText);
    [self.myModel searchForText:searchText];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary* item = [self.results objectAtIndex:indexPath.row];
    cell.textLabel.text = [item valueForKey:@"symbol"];
    cell.detailTextLabel.text = [item valueForKey:@"name"];
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"yahooDetail"]){
        YahooDetailViewController * view = segue.destinationViewController;
         long index =  self.tableView.indexPathForSelectedRow.row;
        view.detail = [self.results objectAtIndex:index];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
