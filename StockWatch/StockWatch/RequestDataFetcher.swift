//
//  RequestData.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation



class RequestDataFetcher {

    func trim(jsonString : String) -> String {
        return jsonString.replacingOccurrences(of:  yahoostringToTrim, with: "").replacingOccurrences(of: ");", with:"")
    }
    
    enum JsonResult<Value> {
        case success(Value)
        case failure(Error)
    }
    
    
    
    func getDataForSymbol(url: URL ,forKey : String, completion : ((JsonResult<Any>) -> Void)?) {
        
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) {(data, response, error) in
            
                if let respError = error {
                    completion?(.failure(respError))
                }
                else {
                    var dataTofromUrl = data
                    if forKey == yahooforKey {
                        if let jsonData = data {
                            var dataString  = String(data: jsonData , encoding : .utf8)
                            dataString = self.trim(jsonString: dataString!)
                            dataTofromUrl  = (dataString?.data(using: .utf8))!
                        }
                    }
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: dataTofromUrl!, options: []) as! NSDictionary
                        if forKey == yahooforKey {
                            let res =  jsonObject.value(forKeyPath: forKey) as! Array<NSDictionary>
                            let returnValue  =  res.map({ (data) -> StockModel in
                                return StockModel(json: data)!
                            })
                            completion?(.success(returnValue))
                        }
                        else {
                            let res =  Array(jsonObject)[0].value as! NSDictionary
                            let returnValue =  res.map({
                                return StockOHLCModel(json: $0.value as! NSDictionary)
                            
                            })
                           completion?(.success(returnValue))
                        }
                    }
                    catch {
                        completion? (.failure(error))
                    }
            }
        }
        task.resume()
    }

}
