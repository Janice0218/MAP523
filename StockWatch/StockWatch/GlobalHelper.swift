//
//  GlobalHelper.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-13.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

 class GlobalHelper {
    static func resetSearchBar( searchBar : UISearchBar ) -> Void{
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    
}
