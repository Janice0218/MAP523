//
//  RequestData.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation

class RequestData {
    var delegate : RequestDataDelegate?
    
    func getData(url: URL, requestHandler: @escaping (Data)->()) {
        
        //default config
        let config = URLSessionConfiguration.default
        
        //get session
        let session = URLSession(configuration: config)
        
        //perform task
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                //perform  Task
                if let jsonData = data{
                    requestHandler(jsonData)
                }
 
            }
            else {
                print("Error while performing task in Request Data.")
            }
        }
        
        task.resume()
    }
    
    func getStock(url : URL) {
        getData(url: url) { (jsonData) in
            var dataString  = String(data: jsonData , encoding : .utf8)
            dataString = self.trim(jsonString: dataString!)
            let json  = dataString?.data(using: .utf8)
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: json!, options: []) as! NSDictionary
                
                let res =  jsonObject.value(forKeyPath: "ResultSet.Result") as! Array<NSDictionary>
                
    
                let ret  =  res.map({ (data) -> JsonStock in
                    return JsonStock(json: data)!
                })
                
                DispatchQueue.main.async {
                     self.delegate?.requestDataDidDownload(stocks: ret)
                }
            
                
            }
            catch {
                print("Unable to serialize data.")
            }
        }
    }
    
    
    func trim(jsonString : String) -> String {
        return jsonString.replacingOccurrences(of:  yahoostringToTrim, with: "").replacingOccurrences(of: ");", with:"")
    }
}

protocol RequestDataDelegate {
    func requestDataDidDownload(stocks : [JsonStock])
}
