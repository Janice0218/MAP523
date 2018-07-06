//
//  Food.h
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
@property (strong, nonatomic) NSString * Name;
@property int Quantity;
-(instancetype) initWithName: (NSString  *) name;
@end
