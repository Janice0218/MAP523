//
//  Food.m
//  RestaurantApplication
//
//  Created by Edmel John Ricahuerta on 2018-07-05.
//  Copyright © 2018 com.seneca.map523. All rights reserved.
//

#import "Food.h"

@implementation Food
-(instancetype) initWithName:(NSString *)name{
    self.Name = [[NSString alloc] initWithFormat:@"%@", name];
    return self;
}

@end
