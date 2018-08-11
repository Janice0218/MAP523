//
//  MainScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class MainScreen: UIViewController   {

    
    var stockService = StockService()

    var allDataFromDB = Array<Stock>()
    
    @IBOutlet weak var tableView: UITableView!
    var text  : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allDataFromDB = stockService.listStocksfromDb()
    }
    
    


}

extension MainScreen : UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, AddDataToDbDelegate
{
    
    func dataAddedByTapped(isDone: Bool) {
        if isDone {
            allDataFromDB  = stockService.listStocksfromDb()
            tableView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier?.contains("addSegue"))! {
            let view = segue.destination as! AddSymbolScreen
            view.delegate = self
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

    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            self.allDataFromDB  = self.stockService.listStocksfromDb()
        }
        tableView.reloadData()

    }
}
