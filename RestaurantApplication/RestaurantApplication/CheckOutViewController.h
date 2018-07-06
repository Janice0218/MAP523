//
//  CheckOutViewController.h
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomerHappyDelegate
-(void) FinishedOrdering;
@end

@interface CheckOutViewController : UIViewController
@property (strong,nonatomic) NSMutableArray * Orders;
@property(strong,nonatomic) id<CustomerHappyDelegate> delegate;
@end
