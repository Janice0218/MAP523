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
@property (weak, nonatomic) IBOutlet UIButton *addOrupdate;
@property int Index;

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
    _Index = (int)indexPath.row;
    

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



- (IBAction)addClicked:(UIButton *)sender {
    NSIndexPath * index = nil;
     BOOL isMale = false;
    if (self.gender.selectedSegmentIndex == 0){
        isMale = true;
    }
    Person* p = [[Person alloc]initWithfirstName:self.FNtext.text andLastName:self.LNtext.text andGender:isMale];
    if([[[self.addOrupdate titleLabel] text] isEqual:@"Update"]){
        
        [self.myModel.personsList removeObjectAtIndex:_Index];
        [self.myModel.personsList insertObject: p atIndex:_Index];
    
                index = [NSIndexPath indexPathForRow:_Index inSection:0];

    }
    else {
    
    [self.myModel.personsList addObject:p];
    index = [NSIndexPath indexPathForRow:self.myModel.personsList.count - 1 inSection:0];
    
    //[NSIndexPath indexPathWithIndex:self.myModel.personsList.count - 1];
    
    
    }
   [self.addOrupdate.titleLabel  setText:@"Add"];
   [self.tableView reloadData];
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
