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
    
    init?(json: NSDictionary) {
    
    let jsonArray = Array(json)
        
            open        =   Double(jsonArray[0].value as! String)!
            high        =   Double(jsonArray[1].value as! String)!
            low         =   Double(jsonArray[2].value as! String)!
            close       =   Double(jsonArray[3].value as! String)!
            volume      =   Double(jsonArray[4].value as! String)!
        
    }
}
