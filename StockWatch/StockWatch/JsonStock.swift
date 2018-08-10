//
//  JsonStock.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit
import Foundation

class JsonStock {
    
    var Symbol      : String?
    var Name        : String?
    var JsonType    : String?
    var Exch        : String?
    var TypeDisp    : String?
    var ExchDisp    : String?
    
    
    init?(json : NSDictionary) {
        
        Symbol      = json.value(forKey: "symbol") as? String
        Name        = json.value(forKey: "name") as? String
        Exch        = json.value(forKey: "exch") as? String
        TypeDisp    = json.value(forKey: "typeDisp") as? String
        ExchDisp    = json.value(forKey: "exchDisp") as? String
        JsonType    = json.value(forKey: "type") as? String
        
    }

}
