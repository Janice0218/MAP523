//
//  YahooSearchModel.h
//  YahooAPI
//
//  Created by Rania Arbash on 2018-07-19.
//  Copyright © 2018 macuser. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol searchDelegate
-(void)yahooSearchDidFinishWithResults :(NSArray*)results;
@end

@interface YahooSearchModel : NSObject
@property (nonatomic,strong)id<searchDelegate> delegate;
@property(nonatomic)dispatch_queue_t myQue;
-(void)searchForText :(NSString*)text;

@end
