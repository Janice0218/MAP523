//
//  Calculator_Brain.h
//  Calculator
//
//  Created by Edmel John Ricahuerta on 2018-05-25.
//  Copyright © 2018 com.map523. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator_Brain : NSObject

@property (nonatomic,strong) NSMutableArray* numbers;

-(void) pushItem: (double) number;
-(double) calculate : (NSString *) operation;



@end
