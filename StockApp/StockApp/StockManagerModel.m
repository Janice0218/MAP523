//
//  StockManagerModel.m
//  StockApp
//
//  Created by Edmel John Ricahuerta on 2018-08-09.
//  Copyright © 2018 seneca.map. All rights reserved.
//

#import "StockManagerModel.h"

@implementation StockManagerModel


-(NSMutableArray * ) stockList {

    if (_stockList == nil) {
        _stockList = [[NSMutableArray alloc] init];
    }
    return _stockList;
    
}

@end
