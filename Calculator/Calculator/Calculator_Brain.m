//
//  Calculator_Brain.m
//  Calculator
//
//  Created by Edmel John Ricahuerta on 2018-05-25.
//  Copyright © 2018 com.map523. All rights reserved.
//

#import "Calculator_Brain.h"

@implementation Calculator_Brain

@synthesize numbers = _numbers;


-(NSMutableArray *)numbers{
    if(_numbers == nil){
        _numbers = [[NSMutableArray alloc]init];
    }
    return _numbers;
}



-(void) pushItem: (double) number{
       [_numbers addObject:[NSNumber numberWithDouble:number]];
}

-(double) calculate:(NSString *)operation{

    if([operation isEqualToString:@"+"])
    {
        return  [self popItem] + [self popItem ];
    }
    
    else if([operation isEqualToString:@"-"])
    {
        double num1 =[self popItem] ;
        double num2  = [self popItem] ;
        return  num2 - num1;
    }
    
    else if([operation isEqualToString:@"*"])
    {
        return  [self popItem] * [self popItem ];
    }
    
    else if([operation isEqualToString:@"/"])
    {
        return [self popItem] / [self popItem];
    }
    
    else {
        NSLog(@"Operation Not Found!\n");
    }
    
    return -1;
}

-(double) popItem {
    double ret = [[self.numbers lastObject] doubleValue];
    [self.numbers removeLastObject];
    return ret;
}



@end
