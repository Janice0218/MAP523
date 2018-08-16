//
//  MainScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class MainScreen: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    

    // init for stock manager
    var stockManager =  StockManager(db: DataManager())

    //  all data from db
    var allDataFromDB = [Stock]()
    
    // text for search bar
    var text  : String?
    
    // init data
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTableViewFor(tableView: tableView, dataArray: nil)
    }
}

//
//  extension for Main with delegate
//
extension MainScreen : UITableViewDataSource, UITableViewDelegate , StockDelegate
{
    
    //  implementation for stock delegate func
    func stockAddedToList(newStock  : StockModel)-> Void
    {
        //  if check if stock exist
        let exist =  allDataFromDB.first { (old) -> Bool in
            old.symbol! == newStock.Symbol
        }
        
        //  if does not exist then add to db as well as reset table
        if exist == nil {
            stockManager.AddStockToDb(stock: newStock)
            resetTableViewFor(tableView: tableView, dataArray:nil )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //  pass data to add view
        if (segue.identifier?.contains("addSegue"))! {
            let view = segue.destination as! AddSymbolScreen
            view.stockManager = self.stockManager
            view.delegate = self
            
        }
            
        //  pass data to detail view
        else if (segue.identifier?.contains("detailSegue"))! {
            let view = segue.destination as! StockDetailScreen
            let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)
            let symbol = cell?.textLabel?.text
            let companyName = cell?.detailTextLabel?.text
            view.symbol = symbol!
            view.companyName = companyName!
            view.stockManager = self.stockManager
            
        }
    }
    
    // TableView Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDataFromDB.count
    }
    
    
    //TableView cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "symbolCell", for: indexPath)
        let stock  = allDataFromDB[indexPath.row]
        cell.textLabel?.text = stock.symbol
        cell.detailTextLabel?.text = stock.name
        return cell
    }
    
    //
    // Table View Edit for update and delete
    //
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        //   reference for cell
        let cell = tableView.cellForRow(at: indexPath)
        
        //  check editing style
        if editingStyle == UITableViewCellEditingStyle.delete {
            let symbol =  cell?.textLabel?.text
            
            
            //  reset table with handler
             resetTableViewFor(tableView: tableView, dataArray: { () -> [Stock] in
                self.allDataFromDB.filter({ (stock) -> Bool in
    
                    stock.symbol != symbol
                })
             })
            stockManager.removeStockBy(symbol: symbol!)
        }
    }
    
    
    
    
    //
    //  searchBar functions for text changed
    //
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // search text is empty
        if searchText.characters.count == 0 {
            
            // reset the table
            resetTableViewFor(tableView: tableView, dataArray:  {return self.allDataFromDB})
        }
            
        else {
            //  reset table with handler
            resetTableViewFor(tableView: tableView, dataArray: { () -> [Stock] in
                return self.allDataFromDB.filter({ (stock) -> Bool in
                    (stock.symbol?.contains(searchText))!
                })
            })        }
    }
    
    //
    //  handling reset of search bar for this view
    //
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        let cancel = searchBar as! StockSearch
        cancel.clearText()
        
        // call reset for search bar

        //  call reset table
        resetTableViewFor(tableView: tableView, dataArray:  nil)
    }
    
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    
    //
    //  handling reset for within the view
    //
    func resetTableViewFor(tableView : UITableView, dataArray : (()->[Stock])?)->Void {
        
        if let data = dataArray?() {
            allDataFromDB = data
        }
        else {
        allDataFromDB = stockManager.listStocksfromDb()
        
        }
        //  then reload table view
        tableView.reloadData()
    }
    
}


























