//
//  MainScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class MainScreen: UIViewController  {

    var stockManager =  StockManager(db: DataManager())

    var allDataFromDB = [Stock]()
    
    @IBOutlet weak var tableView: UITableView!
    var text  : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allDataFromDB = stockManager.listStocksfromDb()
        
        
    }
}

extension MainScreen : UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, AddDataToDbDelegate
{
    func dataAddedByTapped(stock: StockModel){
        
        let exist = allDataFromDB.first { (old) -> Bool in
            old.symbol == stock.Symbol
        }
        
        if exist ==  nil {
            stockManager.AddStockToDb(stock: stock)
            allDataFromDB  = stockManager.listStocksfromDb()
        }
    

        tableView.reloadData()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier?.contains("addSegue"))! {
            let view = segue.destination as! AddSymbolScreen
            view.stockManager = self.stockManager
            view.delegate = self
            
        }
        else if (segue.identifier?.contains("detailSegue"))! {
            let view = segue.destination as! StockDetailScreen
            let symbol = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)?.textLabel?.text
            view.symbol = symbol!
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
    
    
    //searchBar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       if searchText.characters.count == 0 {
            allDataFromDB = stockManager.listStocksfromDb()
            tableView.reloadData()
        }
       else {
            allDataFromDB = allDataFromDB.filter({ (data) -> Bool in
                (data.symbol?.contains(searchText))!
            })
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        allDataFromDB = stockManager.listStocksfromDb()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            stockManager.removeStockBy(symbol: allDataFromDB[indexPath.row].symbol!)
            allDataFromDB.remove(at: indexPath.row)
            tableView.reloadData()
            
            

        }
    }

}
