//
//  StockSearch.m
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-15.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

#import "StockSearch.h"

@implementation StockSearch

-(void) clearText {
    self.text = @"";
    self.showsCancelButton  = false;
    [self endEditing:true];
}

@end
