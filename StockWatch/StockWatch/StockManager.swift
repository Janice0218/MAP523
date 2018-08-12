//
//  StockService.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//




import Foundation
import CoreData
import UIKit


class StockManager
: RequestDataDelegate {
    
    private var dbManager = DataManager()
    private var requestData = RequestDataFetcher()
    private var AllStocks = NSMutableArray()

    
    init(db : DataManager) {
        self.dbManager = db
    }
    
    
    
    func listStocksfromDb() -> NSMutableArray {
        return dbManager.fetchAll()
    }
    
    
    func listStocksfromJson(query : String) -> NSMutableArray {
        

        let stringUrl  = "\(yahoohost)\(query)&\(yahooregion)&\(yahoolanguage)&\(yahoocallback)"
        let url = URL(string : stringUrl)
        
        requestData.delegate = self
        requestData.getStock( url: url!)
        
        return AllStocks
        
    }
    
    func AddStockToDb(stock : StockModel)->Void {
         dbManager.AddEntity(name: stock.Name!,
                             symbol: stock.Symbol!,
                             exch: stock.Exch!,
                             exchDisp: stock.ExchDisp!,
                             type: stock.JsonType!,
                             typeDisp: stock.TypeDisp!)

    }
    
    func requestDataDidDownload(result: NSMutableArray) {
        AllStocks = result
    }
}
