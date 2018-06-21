//
//  ListerModel.m
//  tableViewWithModel
//
//  Created by Rania Arbash on 2018-06-14.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "ListerModel.h"
@implementation ListerModel

-(NSMutableArray*)personsList{
    
    if (_personsList == nil){
        _personsList = [[NSMutableArray alloc]init];
    }
    return _personsList;
}

@end
