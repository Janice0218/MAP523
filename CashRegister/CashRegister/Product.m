//
//  Product.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype)initWithProductName: (NSString *) prodName andCost :(double)price withTotal:(int) numbers{

    self = [super self]; // Set this to super class;
    
    
    //if this is not nil set the ff properties
    if(self == nil){
        self.productName  = prodName;
        self.productPrice = price;
        self.productQuantity = numbers;
    }
    
    return self;
    
}


@end
