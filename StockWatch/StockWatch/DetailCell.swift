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

    @IBOutlet weak var timeDetail: UILabel!
    @IBOutlet weak var openDetail: UILabel!
    @IBOutlet weak var closeDetail: UILabel!
    @IBOutlet weak var highDetail: UILabel!
    @IBOutlet weak var lowDetail: UILabel!
    @IBOutlet weak var volumeDetail: UILabel!
    
    
    func setLabels(time: String, open : Double,high : Double , low : Double, close :Double , volume : Double) {
        self.timeDetail.text    =   "\(time )"
        self.openDetail.text    =   "\(open )"
        self.highDetail.text    =   "\(high )"
        self.lowDetail.text     =   "\(low  )"
        self.closeDetail.text   =   "\(close)"
        self.volumeDetail.text   =  "\(volume)"
    }

}
