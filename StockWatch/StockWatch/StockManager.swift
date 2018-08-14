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
    
    
    //  instance for db
    private var dbManager = DataManager()
    
    //  instance for request data fetcher
    private var requestData = RequestDataFetcher()
    private var AllStockFromDb  = [Stock]()
    
    //  injectin DB into the stockManager
    //  get init data
    init(db : DataManager) {
        self.dbManager = db
        AllStockFromDb = dbManager.fetchAll()
        
    }
    
    //
    //  list data from db
    //
    func listStocksfromDb() -> [Stock] {
        AllStockFromDb = dbManager.fetchAll()
        return AllStockFromDb
    }
    
    //
    //  This function list stock OHLC from symbol passed
    //  that must exist in the data store.
    //
    func listStocksBy(query : String, handler : @escaping (_ all : [StockModel])-> Void) {
        
        let stringUrl  = "\(yahoohost)\(query)&\(yahooregion)&\(yahoolanguage)&\(yahoocallback)"
        if let url = URL(string : stringUrl) {
            self.requestData.getData(url: url, forKey: "ResultSet.Result") { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let stocks):
                        handler(stocks as! [StockModel])
                    case .failure(let error):
                        print("ERROR: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    //
    //  This function list stock OHLC from symbol passed
    //  that must exist in the data store.
    //
    func listStockDetailsBy(symbol : String, handler : @escaping (_ all : [StockOHLCModel]?, _ error : Error? )-> Void) {
        
        // url for detail
        let detail =  SymbolDetailURL.init(host: stockhost, function: stockfunc, symbol: symbol, interval: stockInterval, apiKey: stockApiKey)
        
        //  get url from detail
        let stringUrl = detail.url
        
        //  pass string as URL
        if let url = URL(string : stringUrl) {
            
            //  get data from request data fetcher call
            self.requestData.getData(url: url, forKey: "Time%Series%(1min)") { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let details):
                        handler(details as? [StockOHLCModel], nil)
                    case .failure(let error):
                        handler(nil, error)
                    }
                }
            }
        }
    }
    
    //
    //  add data to DB
    //
    func AddStockToDb(stock : StockModel)->Void {
        dbManager.AddEntity(name: stock.Name,
                            symbol: stock.Symbol,
                            exch: stock.Exch,
                            exchDisp: stock.ExchDisp,
                            type: stock.JsonType,
                            typeDisp: stock.TypeDisp)
    }
    
    //
    //  remove data
    //
    func removeStockBy(symbol : String){
        AllStockFromDb = AllStockFromDb.filter({ (stock) -> Bool in
            return stock.symbol != symbol
        })
    }
}













