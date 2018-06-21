//
//  Person.m
//  tableViewWithModel
//
//  Created by Rania Arbash on 2018-06-14.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "Person.h"

@implementation Person



-(instancetype)initWithfirstName:(NSString *)fname andLastName:(NSString *)lname andGender:(BOOL)gender{
    
    self = [super self];
    
    if (self){
        self.firstName = fname;
        self.lastName = lname;
        self.isMale = gender;
    }
    return self;
}
@end
