//
//  StockService.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class StockService  {

    var dbManager = DataManager()
    
    func listStocksfromDb() -> Array<Stock> {
        return dbManager.fetchAll() as! Array<Stock>
    }
    
    func listStocksfromJson() -> Array<JsonStock> {
        
    
    }
    
    
}
