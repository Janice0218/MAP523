//
//  DetailCell.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-11.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    
    
    //Custom Cell

    @IBOutlet weak var openDetail: UILabel!
    
    @IBOutlet weak var closeDetail: UILabel!
    
    @IBOutlet weak var highDetail: UILabel!
    
    @IBOutlet weak var lowDetail: UILabel!
    
    @IBOutlet weak var volumeDetail: UILabel!


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    

}
