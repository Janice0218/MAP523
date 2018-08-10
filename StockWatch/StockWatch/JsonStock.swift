//
//  JsonStock.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class JsonStock {
    
    var Symbol : String?
    
    var Name : String?
    
    var JsonType : String?
    
    var Exch : String?
    
    var TypeDisp : String?
    
    var ExchDisp : String?
    
    init(symbol: String? , name: String?, type : String?, exch: String?, typeDisp : String?, exchDisp : String?) {
        Symbol  = symbol
        
    }
    
}
