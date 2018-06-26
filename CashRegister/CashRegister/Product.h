//
//  Product.h
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-21.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

//Product properties
@property double productPrice;
@property int productId;
@property int productQuantity;
@property (strong,nonatomic) NSString* productName;


@end
