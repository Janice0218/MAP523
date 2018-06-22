//
//  ProductManager.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "ProductManager.h"
#import "Product.h"

@implementation ProductManager

-(NSMutableArray *) allProducts{
    if(_allProducts == nil){
        //Allocating  the ProductManager
        
        _allProducts = [[NSMutableArray alloc] init];
        //End of Allocating the ProductManager
    }

    return _allProducts;
    
}


@end
