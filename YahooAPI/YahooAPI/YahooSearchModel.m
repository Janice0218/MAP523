
//  YahooSearchModel.m
//  YahooAPI
//
//  Created by Rania Arbash on 2018-07-19.
//  Copyright © 2018 macuser. All rights reserved.
//

#import "YahooSearchModel.h"

@implementation YahooSearchModel


-(void)searchForText:(NSString *)text{

    NSString* urlString = [NSString stringWithFormat:@"http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=%@&region=1&lang=en&callback=YAHOO.Finance.SymbolSuggest.ssCallback",text];
    
    
    self.myQue = dispatch_queue_create("queue", NULL);
    dispatch_async(self.myQue, ^{
       
        NSURL* url = [NSURL URLWithString:urlString];
        NSString* jsonFromURL = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //validate json
        jsonFromURL = [jsonFromURL substringFromIndex:39];
        jsonFromURL = [jsonFromURL substringToIndex:jsonFromURL.length -2];
        
        
        NSData* data = [jsonFromURL dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSArray* results = [jsonDictionary valueForKeyPath:@"ResultSet.Result"];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ok");
            [self.delegate yahooSearchDidFinishWithResults:results];
        });
    });
}

@end
