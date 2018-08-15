//
//  AddSymbolScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class AddSymbolScreen: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var stockSearchBar: StockSearchBar!
    
    
    //  reference for stock manager
    var stockManager : StockManager?
    
    //  array for all queried data
    var queriedData = [StockModel]()
    
    // text for input from search bar
    var stringText : String?
    var delegate : StockDelegate?

}



//
//  extension for This view with delegates
//
extension AddSymbolScreen : UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let addStock  = queriedData[(tableView.indexPathForSelectedRow?.row)!]
        delegate?.stockAddedToList(newStock: addStock)
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    //
    //  dequeue data for cell from queried data
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "queryCell", for: indexPath)
        let stock = queriedData[indexPath.row]
        cell.textLabel?.text = stock.Symbol
        cell.detailTextLabel?.text = stock.Name
        return cell
    
    }
    
    
    //
    //  rows from queried data
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return   queriedData.count
    }
    
    
    //
    //  search bar text for text change
    //
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count != 0 {
            
                self.stockManager?.listStocksBy(query: searchText, handler: { (all) in
                    self.queriedData = all

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
        }
        else
        {
            //  reset table
            resetTableView()
        }
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //  call reset for the application
        stockSearchBar.clearText()
        
        //  call reset table
        resetTableView()
    }
    
    
    //  reset the queried data and reload table
    func resetTableView(){
        queriedData.removeAll()
        tableView.reloadData()
    }
    
}



//
//  this protocol notify that stock has been added
//
protocol StockDelegate {
    func stockAddedToList(newStock : StockModel)-> Void
}






