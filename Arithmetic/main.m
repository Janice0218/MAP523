//
//  main.m
//  Arithmetic
//
//  Created by Edmel John Ricahuerta on 2018-05-17.
//  Copyright © 2018 seneca. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        NSLog(@"Creating primitive types int A and B");
        int a;
        int b;
        
        
        //NSLog(@"int A = %d, int B = % \n",a,b); //error
        
        
        
        a= 20;
        b = 5;
        NSLog(@"After Initializing...");
        
        NSLog(@"int A = %d , int B = %d\n",a,b);
        
        
        NSLog(@"Arithmetic Operations..");
        NSLog(@"The Addition of Values %d and %d is %d",a,b,a+b);
        NSLog(@"The Substraction of Values %d and %d is %d",a,b,a-b);
        NSLog(@"The Multiplication of Values %d and %d is %d",a,b,a*b);
        NSLog(@"The Division of Values %d and %d is %d",a,b,a/b);
        
        double sum  = a + b;
        double diff = a + b;
        double prod = a* b;
        double qout = a / b;
        
        
        //Line does not work double to %d
        //NSLog(@"Sum of %d and %d is %d",a,b,sum);
        
        NSLog(@"Sum of %d and %d is %f",a,b,sum);
        NSLog(@"Difference of %d and %d is %f",a,b,diff);
        NSLog(@"Product of %d and %d is %f",a,b,prod);
        NSLog(@"Quotent of %d and %d is %f",a,b,qout);
        
        
        NSLog(@"Boolean Operations...");
        NSLog(@"The max between A and B is %d",(a>b)?a:b );
        
        BOOL output;
        output  = true;
        
        
        NSLog(@"Assigning the Value for val...");
        char val;
        val = 'b';
        
        NSLog(@"The value of val is %c",val);
        
        NSLog(@"Looping odd additions..");
        int oddtotal;
        oddtotal = 0;
        for (int i = 0; i < 100;i++) {
            if(i % 2 == 0){
                oddtotal +=i;
            }
        }
        NSLog(@"The total of Odd Number is %d", oddtotal);
        
        
    }
    return 0;
}
