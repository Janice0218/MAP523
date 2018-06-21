//
//  Person.h
//  tableViewWithModel
//
//  Created by Rania Arbash on 2018-06-14.
//  Copyright © 2018 macuser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong)NSString* firstName;
@property (nonatomic, strong)NSString* lastName;
@property BOOL isMale;

-(instancetype)initWithfirstName : (NSString*) fname andLastName : (NSString*) lname andGender :(BOOL) gender;

@end
