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

    
    //injectin DB into the stockManager
    init(db : DataManager) {
        self.dbManager = db
    }
    
    
    func listStocksfromDb() -> [Stock] {
        return dbManager.fetchAll()
    }
    
    /*
     This function list stock OHLC from symbol passed
     that must exist in the data store.
     */
    func listStocksBy(query : String, handler : @escaping (_ all : [StockModel])-> Void) {
        
        let stringUrl  = "\(yahoohost)\(query)&\(yahooregion)&\(yahoolanguage)&\(yahoocallback)"
        if let url = URL(string : stringUrl) {
                self.requestData.getData(url: url, forKey: "ResultSet.Result") { (result) in
                    switch result {
                    case .success(let stocks):
                        DispatchQueue.main.async {
                            handler(stocks as! [StockModel])
                        }
                    case .failure(let error):
                        print("ERROR: \(error.localizedDescription)")
                    }
            }
        }
    }
    
    /*
        This function list stock OHLC from symbol passed
        that must exist in the data store.
     */
    func listStockDetailsBy(symbol : String, handler : @escaping (_ all : [StockOHLCModel])-> Void) {

        let detail =  SymbolDetailURL.init(host: stockhost, function: stockfunc, symbol: symbol, interval: stockInterval, apiKey: stockApiKey)
        
         let stringUrl = detail.url
        if let url = URL(string : stringUrl) {
            self.requestData.getData(url: url, forKey: "Time%Series%(1min)") { (result) in
                switch result {
                case .success(let details):
                        handler(details as! [StockOHLCModel])
                case .failure(let error):
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    //needs refactor
    func AddStockToDb(stock : StockModel)->Void {
         dbManager.AddEntity(name: stock.Name,
                             symbol: stock.Symbol,
                             exch: stock.Exch,
                             exchDisp: stock.ExchDisp,
                             type: stock.JsonType,
                             typeDisp: stock.TypeDisp)
    }
    
    
    func removeStockBy(symbol : String)-> Void {
        
        
       let index =  AllStocks.map { (s) -> Int in
                s.Symbol == symbol
        }
    }
    
}













