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
    
    
    let paramForStocks          =   "ResultSet.Result"
    let paramForStockDetails    =   "Time%Series%(1min)"
    //  instance for db
    private var dbManager       =   DataManager()
    
    //  instance for request data fetcher
    private var requestData     =   RequestDataFetcher()
    private var AllStockFromDb  =   [Stock]()
    
    //  injectin DB into the stockManager
    //  get init data
    init(db : DataManager) {
        self.dbManager          =   db
        AllStockFromDb          =   dbManager.fetchAll()
        
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
    func listStocksBy(query : String, handler : @escaping (_ all : [StockModel])-> Void) -> Void {
        
        if let url = URL(string : YahooConstants.getURL(query: query)) {
            self.requestData.getData(url: url, forKey: paramForStocks) { (result) in
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
    func listStockDetailsBy(symbol : String, handler : @escaping (_ all : [StockOHLCModel]?, _ erroMessage : String? )-> Void)-> Void {

        if let url = URL(string : OhlcConstansts.getURL(symbol: symbol)) {
            
            //  get data from request data fetcher call
            self.requestData.getData(url: url, forKey: paramForStockDetails) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let details):
                        handler(details as? [StockOHLCModel], nil)
                    case .failure(let error):

                        var message  : String
                        switch error {
                        case StockError.intervalError:
                            message = "The Request could not be completed. Please try again after 10 seconds. Error: \(StockError.intervalError))"
                        case StockError.emptyStock:
                            message = "Stock Not Found! Please add valid Stock. Error: \(StockError.emptyStock)"
                        case StockError.notFound:
                            message = "Data was not Found! Error: \(StockError.notFound)"
                        default:
                            message = "Error not Traced."
                        }
                        handler(nil, message)
                    }
                }
            }
        }
    }
    
    //
    //  add data to DB
    //
    func AddStockToDb(stock : StockModel)->Void {
        dbManager.AddEntity(name: stock.Name, symbol: stock.Symbol, exch: stock.Exch, exchDisp: stock.ExchDisp, type: stock.JsonType, typeDisp: stock.TypeDisp)
    }
    
    //
    //  remove data
    //
    func removeStockBy(symbol : String){
        dbManager.deleteEntity(name: "Stock", param: symbol)
    }
}













