//
//  RestockViewController.h
//  CashRegister
//
//  Created by Edmel John Ricahuerta on 2018-06-28.
//  Copyright © 2018 com.map523.seneca. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UpdatingProductDelegate
@required
-(void) managerRestockProduct : (Product * ) product WithTotalOf : (int) quantity;
@end

@interface RestockViewController : UIViewController

@property NSMutableArray* allProducts;
@property (nonatomic,strong)id<UpdatingProductDelegate> delegate;

@end
