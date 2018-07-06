//
//  RestaurantMenu.m
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//
#import "Food.h"
#import "RestaurantMenu.h"

@implementation RestaurantMenu

-(NSMutableArray * ) AllFoods {
    if(_AllFoods == nil){
        
        Food * f1 = [[Food alloc]initWithName:@"Pizza"];
        Food * f2 = [[Food alloc]initWithName:@"Hotdog"];
        Food * f3 = [[Food alloc]initWithName:@"Mashed Potato"];
        Food *  f4 = [[Food alloc]initWithName:@"Hamburger"];
        Food * f5 = [[Food alloc]initWithName:@"Water"];
        Food * f6 = [[Food alloc]initWithName:@"Juice"];
        Food * f7 = [[Food alloc]initWithName:@"Pasta"];
        
        
        _AllFoods = [[NSMutableArray alloc] initWithObjects:f1,f2,f3,f4,f5,f6,f7, nil];
    }
    return _AllFoods;
}



-(NSMutableArray * )AllFoodsBought{
    if(_AllFoodsBought == nil){
        _AllFoodsBought = [[NSMutableArray alloc] init];
    }
    return _AllFoodsBought;
}

@end
