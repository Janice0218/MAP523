//
//  Product.m
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import "Product.h"

@implementation Product


-(instancetype)init{
    self.productQuantity =0;
    self.productName = [[NSString alloc]init];
    self.productPrice = 0.00;
    return self;
}

@end
