//
//  RequestData.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation

//enum for json results
enum JsonResult<Value> {
    case success(Value)
    case failure(Error)
}

class RequestDataFetcher {
    
    //
    //  helper function to trim with callbacks functions
    //
    func trim(jsonString : String) -> String {
        return jsonString.replacingOccurrences(of:  yahoostringToTrim, with: "")
            .replacingOccurrences(of: ");", with:"")
    }
    
    
    //  parsing data from API
    //  parameters
    //  url             : url data for api call
    //  completion      : closure for handling events in the function that has parameter of JSONRESULT
    //
    func getData(url: URL ,forKey : String, completion : ((JsonResult<Any>) -> Void)?) {
        
        
        //  set configuration as default
        let config = URLSessionConfiguration.default
        
        
        //  grab session for config
        let session = URLSession(configuration: config)
        
        //  start task for session with url
        let task = session.dataTask(with: url) {(data, response, error) in
            
            
            // validate if any error
            if let respError = error {
                completion?(.failure(respError))
            }

            else {
                
                var dataTofromUrl = data
                
                //  check if key is for yahoo api to truncate callback
                if forKey == yahooforKey {
                    if let jsonData = data {
                        var dataString  = String(data: jsonData , encoding : .utf8)
                        dataString = self.trim(jsonString: dataString!)
                        dataTofromUrl  = (dataString?.data(using: .utf8))!
                    }
                }
                
                do {
                    
                    //  serialize data
                    let jsonObject = try JSONSerialization.jsonObject(with: dataTofromUrl!, options: []) as! NSDictionary
                    
                    
                    //   check if key is for yahoo api for proper returns
                    if forKey == yahooforKey {
                        let res =  jsonObject.value(forKeyPath: forKey) as! Array<NSDictionary>
                        let returnValue  =  res.map({ (data) -> StockModel in
                            return StockModel(json: data)!
                        })
                        completion?(.success(returnValue))
                    }
                        
                    //   check if key is for stock api for proper returns
                    else if forKey == stockforKey {
                        if jsonObject.count !=  1 {
                            let res =  Array(jsonObject)[0].value as!  NSDictionary
                            
                            
                            // decode json to StockOHLCModel
                            let returnValue =  res.map({
                                return StockOHLCModel(time : $0.key as! String, json: $0.value as! NSDictionary)
                            }) as! [StockOHLCModel]
                            
                            completion?(.success(returnValue))
                        }
                            
                        // if call was invalid send error to UI
                        else {
                            completion?(.failure(StockError.intervalError))
                        }
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



