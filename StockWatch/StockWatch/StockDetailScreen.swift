//
//  StockDetailScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class StockDetailScreen: UIViewController {
    
    var symbol : String?
    
    var stockManager : StockManager?
    var details : NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = symbol
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        
        let main  = navigationController?.topViewController as! MainScreen
        main.tableView.reloadData()
        
        details = stockManager?.listStockDetailfromJson(symbol: symbol!)
        
    }
    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        
    }


}


extension StockDetailScreen : UITableViewDelegate, UITableViewDataSource {

    
    //table methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        cell.openDetail.text    = "open"
        cell.closeDetail.text   = "close"
        cell.highDetail.text    = "high"
        cell.lowDetail.text     = "low"
        cell.volumeDetail.text  = "volume"
        
        return cell
        
  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\tInterval:\(stockInterval) Min"
    }

    
}


