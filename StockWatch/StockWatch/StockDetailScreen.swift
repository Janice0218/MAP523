//
//  StockDetailScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class StockDetailScreen: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var loadingItem: UIActivityIndicatorView!
    var symbol : String = ""
    
    var stockManager : StockManager?
    var details : [StockOHLCModel] = []
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = symbol
        
        self.loadingItem.isHidden = false
        self.loadingItem.startAnimating()
        
        let search = symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        self.stockManager?.listStockDetailsBy(symbol: search, handler: { (all, error) in
            
            self.details.removeAll()
        
            DispatchQueue.main.async {
                if all == nil {
                    let alertController = UIAlertController(title: "Result Empty", message:
                        "\(String(describing: error?.localizedDescription))", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler:  { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    self.details = all!
                    self.tableVIew.reloadData()
                    self.loadingItem.stopAnimating()
                    self.loadingItem.isHidden = true
                }
            }
        })
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        let main  = navigationController?.topViewController as! MainScreen
        main.tableView.reloadData()
        
    }
    
    
    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        
        
        self.loadingItem.isHidden = false
        self.loadingItem.startAnimating()
        
        let search = symbol.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        self.stockManager?.listStockDetailsBy(symbol: search, handler: { (all,error) in
            self.details.removeAll()
            self.details = all!
            DispatchQueue.main.async {
                self.tableVIew.reloadData()
                self.loadingItem.stopAnimating()
                self.loadingItem.isHidden = true
            }
        })
    }
}


extension StockDetailScreen : UITableViewDelegate, UITableViewDataSource {
    
    
    //table methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        let allDetails = details
        cell.openDetail.text    = "\(allDetails[indexPath.row].open)"
        cell.closeDetail.text   = "\(allDetails[indexPath.row].close)"
        cell.highDetail.text    = "\(allDetails[indexPath.row].high)"
        cell.lowDetail.text     = "\(allDetails[indexPath.row].low)"
        cell.volumeDetail.text  = "\(allDetails[indexPath.row].volume)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\tInterval:\(stockInterval) Min"
    }
    
    
}





