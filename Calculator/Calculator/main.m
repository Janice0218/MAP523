//
//  main.m
//  Calculator
//
//  Created by Edmel John Ricahuerta on 2018-05-25.
//  Copyright © 2018 com.map523. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator_Brain.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        /*
         Assuming all numbers are all valid and follow the rules of number operations,
         This will calculate two numbers based on the passed operations.
         */
        NSLog(@"Simple Calculator\n");
        
        
        //Initializing
        Calculator_Brain* cal = [[Calculator_Brain alloc]init];
        double num1,num2;
        
    
        num1 = 20;
        num2  =5;
        NSLog(@"Pushing numbers into the array...\n");
        
        [cal pushItem:num1];
        [cal pushItem:num2];
        
        
        NSLog(@"Performing Addtion for numbers %.02f and  %.02f",num1, num2 );

        double sum = [cal calculate:@"+"];
        NSLog(@"The sum is : %.02f",sum);
        
        num1 = 20;
        num2  =5;
        NSLog(@"Pushing numbers into the array...\n");
        
        [cal pushItem:num1];
        [cal pushItem:num2];
        
        
        NSLog(@"Performing Substraction for numbers %.02f and  %.02f",num1, num2 );
        
        double diff = [cal calculate:@"-"];
        NSLog(@"The difference is : %.02f",diff);
        
        
        num1 = 15;
        num2  =5;
        NSLog(@"Pushing numbers into the array...\n");
        
        [cal pushItem:num1];
        [cal pushItem:num2];
        
        NSLog(@"Performing Multiplication for numbers %.02f and  %.02f",num1, num2 );
        
        double prod = [cal calculate:@"*"];
        NSLog(@"The product is : %.02f",prod);
        
        
        num1 = 22;
        num2  =2;
        NSLog(@"Pushing numbers into the array...\n");
        
        [cal pushItem:num2];
        [cal pushItem:num1];
        
        NSLog(@"Performing Division for numbers %.02f and  %.02f",num1, num2 );
        
        double qout = [cal calculate:@"/"];
        NSLog(@"The qoutient is : %.02f",qout);
        
        
        
        
        
    }
    return 0;
}
