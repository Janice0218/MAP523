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
    var stockManager : StockManager?
    var queriedData = NSMutableArray()
    var stringText : String?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension AddSymbolScreen : UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let addStock  = queriedData[(tableView.indexPathForSelectedRow?.row)!] as! StockModel
        
        delegate?.dataAddedByTapped(stock : addStock)

        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "queryCell", for: indexPath)
        let stock = queriedData[indexPath.row] as! StockModel
        cell.textLabel?.text = stock.Symbol
        cell.detailTextLabel?.text = stock.Name
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return   queriedData.count
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        DispatchQueue.main.async {
            self.queriedData =  (self.stockManager?.listStocksfromJson(query:searchText))!
            self.tableView.reloadData()
        }
    }
    
}



protocol AddDataToDbDelegate {
    func dataAddedByTapped(stock : StockModel)
}
