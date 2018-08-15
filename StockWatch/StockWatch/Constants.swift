//
//  File.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation


struct YahooConstants {
    
    static let Host = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query="
    static let Region =  "region=1"
    static let Lang = "lang=en"
    static let Callback  = "callback=YAHOO.Finance.SymbolSuggest.ssCallback"
    static let stringToTrim = "YAHOO.Finance.SymbolSuggest.ssCallback("
    static let ForKey = "ResultSet.Result"
    
    static func getURL(query : String)-> String {
        return "\(Host)\(query)&\(Region)&\(Lang)&\(Callback)"
    }
    
}

struct OhlcConstansts {
    static let Domain = "https://www.alphavantage.co/"
    static let Function = "TIME_SERIES_INTRADAY"
    static let Interval = 1
    static let ApiKey = "TEUK0SW0QEMQ3DZ7"
    static let ForKey = "Time%Series%(1min)"
    
    static func getURL(symbol : String)-> String {
        return "\(Domain)query?function=\(Function)&symbol=\(symbol)&interval=\(Interval)min&apikey=\(ApiKey)"
    }
    
}
