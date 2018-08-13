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


class StockManager {
    
    private var dbManager = DataManager()
    private var requestData = RequestDataFetcher()
    private var AllStocks = [StockModel]()
    private var detailsForSymbol = NSDictionary()
    
    init(db : DataManager) {
        self.dbManager = db
    }
    
    
    func listStocksfromDb() -> [Stock] {
        return dbManager.fetchAll()
    }
    
    
    func listStocksfromJson(query : String) -> [StockModel] {
        
        let stringUrl  = "\(yahoohost)\(query)&\(yahooregion)&\(yahoolanguage)&\(yahoocallback)"
        if let url = URL(string : stringUrl) {
        
            DispatchQueue.main.async {
       
                self.requestData.getDataForSymbol(url: url, forKey: "ResultSet.Result") { (result) in
                    switch result {
                    case .success(let stocks):
                        self.AllStocks = stocks as! [StockModel]
                    case .failure(let error):
                        print("ERROR: \(error.localizedDescription)")
                    }
        
                }
            }
        }
        return AllStocks
        
    }
    
    
    func listStockDetailfromJson(symbol : String)-> NSDictionary {
        let detail =  SymbolDetailURL.init(host: stockhost, function: stockfunc, symbol: symbol, interval: stockInterval, apiKey: stockApiKey)
        
         let stringUrl = detail.url
        if let url = URL(string : stringUrl) {
            DispatchQueue.main.async {
                
                self.requestData.getDataForSymbol(url: url, forKey: "Time%Series%(1min)") { (result) in
                    switch result {
                    case .success(let details):
                        self.detailsForSymbol = ["symbol" : symbol, "details " : details]
                    case .failure(let error):
                        print("ERROR: \(error.localizedDescription)")
                    }
                    
                }
            }
        }
             return detailsForSymbol
    }
    
    func AddStockToDb(stock : StockModel)->Void {
         dbManager.AddEntity(name: stock.Name,
                             symbol: stock.Symbol,
                             exch: stock.Exch,
                             exchDisp: stock.ExchDisp,
                             type: stock.JsonType,
                             typeDisp: stock.TypeDisp)

    }
    
}
