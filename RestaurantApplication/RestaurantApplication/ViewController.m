//
//  ViewController.m
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//
#import "Food.h"
#import "RestaurantMenu.h"
#import "ViewController.h"
#import "CheckOutViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource,CustomerHappyDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *QuantityTextBox;
@property (weak, nonatomic) IBOutlet UIButton *AddButton;
@property (weak, nonatomic) IBOutlet UIButton *CheckoutButton;
@property (strong , nonatomic) RestaurantMenu * Menu;
@end

@implementation ViewController
//LOCAL VAR
Food * food = nil;
//END OF VAR



///INIT
-(RestaurantMenu *) Menu{
    if(_Menu == nil){
        _Menu = [[RestaurantMenu alloc] init];
    }
    return _Menu;
}////END of INIT



//SEGUE

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"checkoutSegue"]){
        CheckOutViewController *checkoutView = [segue destinationViewController];
        checkoutView.Orders = self.Menu.AllFoodsBought;
    }
    
}

//END OF SEGEUE


///PICKER VIEW Impl
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.Menu.AllFoods.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    food = nil;
    
    food = [self.Menu.AllFoods objectAtIndex:(int) row];
    NSString * foodString = [[NSString alloc]initWithFormat:@"%@", food.Name];
    
    return foodString;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{

    food = [self.Menu.AllFoods objectAtIndex:(int)row];

}

//END of PICKER VIEW



///BUTTONS
- (IBAction)AddFood:(UIButton*)sender {
    if(food != nil || !([self.QuantityTextBox.text isEqualToString:@""])){
        food.Quantity = (int)[self.QuantityTextBox.text integerValue];
        [self.Menu.AllFoodsBought addObject:food];
            food = nil;
        self.QuantityTextBox.text = @"";
        food = nil;
    }
    
}

//END OF BUTTONS
///


//Delegate
-(void) FinishedOrdering{
    [self.Menu.AllFoodsBought removeAllObjects];
    self.Menu.AllFoodsBought = nil;
}
//End od Delegate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
