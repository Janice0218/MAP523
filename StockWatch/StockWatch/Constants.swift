//
//  File.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation



// Yahoo API constants
let yahoohost = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query="
let yahooregion =  "region=1"
let yahoolanguage = "lang=en"
let yahoocallback  = "callback=YAHOO.Finance.SymbolSuggest.ssCallback"

let yahoostringToTrim = "YAHOO.Finance.SymbolSuggest.ssCallback("
let yahooforKey = "ResultSet.Result"


// OHLC API constants
let stockhost = "https://www.alphavantage.co/"
let stockfunc = "TIME_SERIES_INTRADAY"
let stockInterval = 1
let stockApiKey = "TEUK0SW0QEMQ3DZ7"
let stockforKey = "Time%Series%(1min)"

//https://www.alphavantage.co/
//query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)
//&interval=1min&apikey=\(key)

struct SymbolDetailURL {
    var url : String
    init(host: String, function : String, symbol : String, interval : Int, apiKey : String) {
        url = "\(host)query?function=\(function)&symbol=\(symbol)&interval=\(interval)min&apikey=\(apiKey)"
    }
}



