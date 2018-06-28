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



//Getter With Init;
-(NSMutableArray *) allProducts{
    if(_allProducts == nil){
        
        ///////////////////Sample Products
        
        //Denim Pants
        Product* p1 = [[Product alloc]init];
        [p1 setProductName:@"Pants"];
        [p1 setProductPrice:99];
        [p1 setProductQuantity:20];
        [p1 setProductId:1];
        
        //Leather Jacket
        Product* p2 = [[Product alloc]init];
        [p2 setProductName:@"Leather Jacket"];
        [p2 setProductPrice:200.00];
        [p2 setProductQuantity:10];
        [p2 setProductId:2];
        
        //Leather Belt
        Product* p3 = [[Product alloc]init];
        [p3 setProductName:@"Leather Belt"];
        [p3 setProductPrice:50];
        [p3 setProductQuantity:5];
        [p3 setProductId:3];
        
        //Sunglasses
        Product* p4 = [[Product alloc]init];
        [p4 setProductName:@"Sunglasses"];
        [p4 setProductPrice:20];
        [p4 setProductQuantity:10];
        [p4 setProductId:4];
        
        //Polo Shirt
        Product* p5 = [[Product alloc]init];
        [p5 setProductName:@"Polo Shirt"];
        [p5 setProductPrice:78.9];
        [p5 setProductQuantity:15];
        [p5 setProductId:5];
        
        //Summer Dress
        Product* p6 = [[Product alloc]init];
        [p6 setProductName:@"White Summer Dress"];
        [p6 setProductPrice:300];
        [p6 setProductQuantity:2];
        [p6 setProductId:6];
        ////////////////////End Of Sample Products
        
        ////////Allocating  the ProductManager
        _allProducts = [[NSMutableArray alloc] initWithObjects:p1,p2,p3,p4,p5,p6, nil];
        /////////End of Allocating the ProductManager
    }
    
    
    return _allProducts;

}


//Getter with Init
-(NSMutableArray *) allProductsBought{

    if(_allProductsBought == nil){
        _allProductsBought = [[NSMutableArray alloc]init];
    }
    return _allProductsBought;
}



//Update All Products and Add product bought to list;
-(void)buyProductWithTotal : (int) quantity atIndex: (int) index{
    
    Product * productToBuy =  [self.allProducts objectAtIndex:index];
    
    [productToBuy setProductQuantity:quantity];
    [self.allProducts replaceObjectAtIndex:(NSUInteger)index withObject: productToBuy];
}

-(void) addProductBoughtToList:(Product *)productBought WithQuantityOf :(int) quantity thatCost : (double) price{
    Product * prodAdd = [[Product alloc]init];
    [prodAdd setProductQuantity:quantity];
    [prodAdd setProductId:productBought.productId];
    [prodAdd setProductName:productBought.productName];
    [prodAdd setProductPrice:price];
    [self.allProductsBought addObject:prodAdd];
    
    
}

-(void)restockProductWithTotal:(int)quantity atIndex:(int)index{
    if(quantity > -1){
        
        Product * productToRestock = [_allProductsBought objectAtIndex:index];
        
        int totalQuantity  = productToRestock.productQuantity + quantity;
        
        [productToRestock setProductQuantity:totalQuantity];
        
        
    }
}


@end
