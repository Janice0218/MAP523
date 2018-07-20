//
//  YahooDetailViewController.m
//  YahooAPI
//
//  Created by Edmel John Ricahuerta on 2018-07-19.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "YahooDetailViewController.h"

@interface YahooDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Symbol;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Exch;
@property (weak, nonatomic) IBOutlet UILabel *Type;
@property (weak, nonatomic) IBOutlet UILabel *ExchDisplay;
@property (weak, nonatomic) IBOutlet UILabel *TypeDisp;

@end

@implementation YahooDetailViewController

- (void)viewDidLoad {
    self.Symbol.text =  [[NSString alloc] initWithFormat:@"symbol: %@",[self.detail valueForKey:@"symbol"]];
    self.Name.text =  [[NSString alloc] initWithFormat:@"name: %@",[self.detail valueForKey:@"name"]];
    self.Exch.text =  [[NSString alloc] initWithFormat:@"exch: %@",[self.detail valueForKey:@"exch"]];
    self.Type.text =  [[NSString alloc] initWithFormat:@"type: %@",[self.detail valueForKey:@"type"]];
    self.ExchDisplay.text =  [[NSString alloc] initWithFormat:@"exchDisp: %@",[self.detail valueForKey:@"exchDisp"]];
    self.TypeDisp.text =  [[NSString alloc] initWithFormat:@"typeDisp: %@",[self.detail valueForKey:@"typeDisp"]];

    [super viewDidLoad];

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
