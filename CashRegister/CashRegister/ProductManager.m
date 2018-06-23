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
        
        //Sample Products
        Product* p1 = [[Product alloc]initWithProductName:@"Pants" andCost: 99.99 withTotal: 15] ;
        Product* p2 = [[Product alloc]initWithProductName:@"Laptop Bag" andCost: (double)164 withTotal: (int)5] ;
        Product* p3 = [[Product alloc]initWithProductName:@"Phone Case" andCost: 20.00 withTotal: 30] ;
        Product* p4 = [[Product alloc]initWithProductName:@"Wallet" andCost: 200.00 withTotal: 2] ;
        Product* p5 = [[Product alloc]initWithProductName:@"Baseball Hat" andCost: 50.99 withTotal: 10] ;
        Product* p6 = [[Product alloc]initWithProductName:@"Leather Belt" andCost: 155.99 withTotal: 6] ;
        Product* p7 = [[Product alloc]initWithProductName:@"Slippers" andCost: 20.99 withTotal: 5] ;
        Product* p8 = [[Product alloc]initWithProductName:@"Bluejays Socks" andCost: 10.99 withTotal: 10] ;
        //Allocating  the ProductManager
        _allProducts = [[NSMutableArray alloc] initWithObjects:p1,p2,p3,p4,p5,p6,p7,p8, nil];
        //End of Allocating the ProductManager
    }

    return _allProducts;
    
}


@end
