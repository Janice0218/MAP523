//
//  StockDetailScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class StockDetailScreen: UIViewController {
    
    @IBOutlet weak var loadMore: UIButton!
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var loadingItem: UIActivityIndicatorView!
    
    let intervalString = "\tInterval: \(OhlcConstansts.Interval) Minute"
    let cellId = "detailCell"
    let initialDataCount : Int = 10
    var maxData : Int?
    var dataToLoad : Int = 0
    var symbol : String = ""
    var companyName : String = ""
    
    //stock manager reference
    var stockManager : StockManager?
    
    //all stocks OHLC details
    var allDetails : [StockOHLCModel] = []
    
    var OhlcData : [StockOHLCModel] = []
    //
    //  load init data
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = symbol
        dataToLoad = initialDataCount
        dataDidLoad()

    }
    
    
    //
    //  reload the table for main screen when this view disappear
    //
    override func viewWillDisappear(_ animated: Bool) {
        
        let main  = navigationController?.topViewController as! MainScreen
        main.tableView.reloadData()
    }
    
    @IBAction func loadMoreTapped(_ sender: UIButton) {
        
        dataToLoad += initialDataCount
        if maxData! < dataToLoad {
            loadMore.isHidden = true
            OhlcData  = allDetails
        }
        else{
            OhlcData = Array(allDetails.suffix(dataToLoad))
        }
        tableVIew.reloadData()
    }
    
    //
    //  reload data when tapped
    //
    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        dataToLoad = initialDataCount
        dataDidLoad()
        loadMore.isHidden = false

    }
    
}

extension StockDetailScreen : UITableViewDelegate, UITableViewDataSource {
    

    //
    //  Populate the table with data from Resource
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell
        
        
        let stockDetail = OhlcData[indexPath.row]
        
        cell.setLabels(time: stockDetail.time, open: stockDetail.open, high: stockDetail.high, low: stockDetail.low, close: stockDetail.close, volume: stockDetail.volume)
        
        return cell
    }
    
    
    //
    //  Declaring the numbers of row for tableview
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OhlcData.count
        
    }
    
    

    //
    //  Renaming the section title
    //
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return companyName
    }
    
    
    //
    //  This function loads the data to table view from stockManager
    //  An alert Message is called when any error occur
    //
    func dataDidLoad()->Void {
        
        let errorTitle = "Request Error"
        let errorAction = "Dismiss"
        self.loadingItem.isHidden = false
        self.loadingItem.startAnimating()
        
        self.stockManager?.listStockDetailsBy(symbol: symbol, handler: { (all, error) in
            
            //  remove all details data
            self.allDetails.removeAll()
            
            //return to main queue
            DispatchQueue.main.async {
                
                //check if there are not data from list or as well as possible errors
                if all == nil  || all?.count == 0 || error != nil {
                    
                    //  create instance for alert view
                    let alertController = UIAlertController(title: errorTitle , message:
                        "\(error!)", preferredStyle: UIAlertControllerStyle.alert)
                    
                    //  add action for alert
                    alertController.addAction(UIAlertAction(title: errorAction, style: UIAlertActionStyle.default,handler:  { action in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    
                    //  present alert
                    self.present(alertController, animated: true, completion: nil)
                }
                else { // if data exist and no errors
                    self.allDetails = all!
                    self.maxData = all?.count
                    self.OhlcData = Array(self.allDetails.suffix(self.initialDataCount))
                    self.loadingItem.stopAnimating()
                    self.loadingItem.isHidden = true
                    self.tableVIew.reloadData()
                    self.loadMore.isHidden = false
                }
            }
        })
    }
}




