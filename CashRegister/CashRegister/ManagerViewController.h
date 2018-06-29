//
//  ManagerViewController.h
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-28.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//
#import "ViewController.h"
#import "RestockViewController.h"
#import "ProductModelManager.h"
#import <UIKit/UIKit.h>

@interface ManagerViewController : UIViewController

@property (strong, nonatomic)ProductModelManager * gatewaProductManager;
@property (nonatomic,strong) id<UpdatingProductDelegate> delegate;
@end
