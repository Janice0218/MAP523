//
//  MainScreen.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-10.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class MainScreen: UIViewController   {

    @IBOutlet weak var tableView: UITableView!
    var text  : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}

extension MainScreen : UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate
{

    // TableView Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
        
    }
    
    
    //TableView cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "symbolCell", for: indexPath)
        
        if let str = text {
            cell.textLabel?.text  = str
        }
        else {
            cell.textLabel?.text = "Empty"
        
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
        tableView.reloadData()
    }



}
