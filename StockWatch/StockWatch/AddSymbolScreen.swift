//
//  AddSymbolScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class AddSymbolScreen: UIViewController {
    

    var delegate : AddDataToDbDelegate?
    var stockService  = StockService()
    var queriedData = NSMutableArray()
    var stringText : String?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }


    
    

}

extension AddSymbolScreen : UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            stockService.AddStockToDb(stock: queriedData[(tableView.indexPathForSelectedRow?.row)!] as! JsonStock)
            delegate?.dataAddedByTapped(isDone: true)
            self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "queryCell", for: indexPath)
        let stock = queriedData[indexPath.row] as! JsonStock
        cell.textLabel?.text = stock.Symbol
        cell.detailTextLabel?.text = stock.Name
        return cell
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return   queriedData.count
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
        queriedData =  stockService.listStocksfromJson(query: searchText) as! NSMutableArray
        tableView.reloadData()

    }
    
}
protocol AddDataToDbDelegate {
    func dataAddedByTapped(isDone : Bool)
}
