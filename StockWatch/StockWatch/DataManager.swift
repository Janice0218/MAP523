//
//  DataManager.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//


import Foundation
import Foundation
import CoreData
import UIKit

class DataManager {

    var appDelegatePointer = UIApplication.shared.delegate as! AppDelegate
    
    var allData = NSMutableArray()
    
    
    func fetchAll() -> NSMutableArray {
        
        //reset data
        allData.removeAllObjects()

        //determine data to fetch
        let fetchrequest : NSFetchRequest<Stock> = Stock.fetchRequest()
        
        do {
            
            //grab data
            let stocks = try appDelegatePointer.persistentContainer.viewContext.fetch(fetchrequest)
            
            
            //store data to array
            for stock in stocks {
                allData.add(stock)
            }
        }
        
        catch {
            print("Unable to fetch Data")
        }
        return allData
        
    }
    
    func AddEntity(name: String , symbol :String , exch : String , exchDisp : String, type : String, typeDisp :String)  {
        
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Stock", into: appDelegatePointer.persistentContainer.viewContext) as! Stock
        
        
        newEntity.name = name
        newEntity.exchange = exch
        newEntity.exchangeDisplay = exchDisp
        newEntity.symbol = symbol
        newEntity.type = type
        newEntity.typeDisplay = typeDisp
        
        appDelegatePointer.saveContext()
        
        
    }
    
    
    
}
