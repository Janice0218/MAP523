//
//  StockOHLCModel.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-12.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class StockOHLCModel {

    var open    : Double
    var high    : Double
    var close   : Double
    var low     : Double
    var volume  : Double
    var time    : String
    init?(time : String, json: NSDictionary) {
            self.time   =   time
            open        =   Double(json.value(forKey: "1. open") as! String)!
            high        =   Double(json.value(forKey: "2. high") as! String)!
            low         =   Double(json.value(forKey: "3. low") as! String)!
            close       =   Double(json.value(forKey: "4. close") as! String)!
            volume      =   Double(json.value(forKey: "5. volume") as! String)!
        
    }
}
