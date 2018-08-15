//
//  DataManager.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//


import Foundation
import CoreData
import UIKit

class DataManager {
    
    //  reference app delegate pointer
    var appDelegatePointer = UIApplication.shared.delegate as! AppDelegate
    
    //  data from db
    var allData = [Stock]()
    
    
    let fetchrequestForStock : NSFetchRequest<Stock> = Stock.fetchRequest()
    //
    //  fetch all data from core data
    //
    func fetchAll() -> [Stock] {
        
        do {
            //grab data
            let stocks = try appDelegatePointer.persistentContainer.viewContext.fetch(fetchrequestForStock)
            
            if allData.count != stocks.count {
                allData.removeAll()
                
                //store data to array
                for stock in stocks {
                    allData.append(stock)
                }
            }
        }
        catch {
            print("Unable to fetch Data")
        }
        return allData
    }
    
    func AddEntity(name: String, symbol :String, exch : String, exchDisp : String, type : String, typeDisp :String)  {
        
        let newEntity = NSEntityDescription
            .insertNewObject(forEntityName: "Stock", into: appDelegatePointer.persistentContainer.viewContext)
            as! Stock
        
        newEntity.name              = name
        newEntity.exchange          = exch
        newEntity.exchangeDisplay   = exchDisp
        newEntity.symbol            = symbol
        newEntity.type              = type
        newEntity.typeDisplay       = typeDisp
        
        appDelegatePointer.saveContext()
        
    }
    
    func deleteEntity(name : String, param : String) {
        
        fetchrequestForStock.predicate = NSPredicate.init(format: "symbol==\(param)")
        
        do {
            let object = try appDelegatePointer.persistentContainer.viewContext.fetch(fetchrequestForStock)
            
            appDelegatePointer.persistentContainer.performBackgroundTask({ context in
                let obj : Stock = object[0]
                do {
                    context.delete(obj)
                    
                        try context.save()
                }
                catch {
                    fatalError()
                }
                
            })
        }
        catch {
            print("Unable to delete from DB")
        }
        
    }
    
}
