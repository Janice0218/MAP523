//
//  ViewController.m
//  tableViewWithModel
//
//  Created by Rania Arbash on 2018-06-14.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ListerModel.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) ListerModel* myModel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;

@property (weak, nonatomic) IBOutlet UITextField *LNtext;

@property (weak, nonatomic) IBOutlet UITextField *FNtext;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(ListerModel*)myModel {

    if (_myModel == nil){
        _myModel = [[ListerModel alloc]init];
    }
    return _myModel;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Person* selectedPerson = [self.myModel.personsList objectAtIndex:(int)indexPath.row];
    self.FNtext.text = selectedPerson.firstName;
    self.LNtext.text = selectedPerson.lastName;
    
//    if (selectedPerson.isMale == true){
//    
//       // self.gender.
//    }
//    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.myModel.personsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Person* p = [self.myModel.personsList objectAtIndex:indexPath.row];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = p.firstName;
    cell.detailTextLabel.text = p.lastName;
    NSString* picture =@"";
    if (p.isMale == true){
        picture = @"male.jpg";
    }
    else {
        picture = @"female.jpg";
    }
    cell.imageView.image = [ UIImage imageNamed:picture];
    return cell;
}



- (IBAction)addClicked:(id)sender {
    BOOL isMale = false;
    if (self.gender.selectedSegmentIndex == 0){
        isMale = true;
    }
    
    Person* p = [[Person alloc]initWithfirstName:self.FNtext.text andLastName:self.LNtext.text andGender:isMale];
    
    [self.myModel.personsList addObject:p];
    NSIndexPath* index = [NSIndexPath indexPathForRow:self.myModel.personsList.count - 1 inSection:0];
    
    //[NSIndexPath indexPathWithIndex:self.myModel.personsList.count - 1];
    
    [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
    
    
   // [self.tableView reloadData];
    self.FNtext.text = @"";
    self.LNtext.text = @"";
    
    
}
- (IBAction)fetchClicked:(id)sender {
    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
