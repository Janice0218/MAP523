//
//  HistoryDetailViewController.h
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-29.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//
#import "Product.h"
#import <UIKit/UIKit.h>

@interface HistoryDetailViewController : UIViewController
@property (strong,nonatomic)NSString* ProductId;
@property (strong, nonatomic) NSString* ProductName;
@property (strong, nonatomic) NSString* ProductPrice;
@property (strong, nonatomic) NSString* ProductQuantity;
@property (strong, nonatomic) NSString* ProductDate;
@end
