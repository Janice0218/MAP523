//
//  ViewController.swift
//  SimpleConverter
//
//  Created by Edmel John Ricahuerta on 2018-08-08.
//  Copyright © 2018 seneca.map. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageText: UILabel!
    
    
    @IBOutlet weak var numTextField1: UITextField!
    @IBOutlet weak var numTextField2: UITextField!
    
    @IBOutlet weak var segmentConverter: UISegmentedControl!
    
    
    //constant var for conversion
    let converterConstants = [0.0833333,2.54,0.0277778]
    
    
    
    //action for segments
    @IBAction func convertSegmentClick(_ sender: UISegmentedControl) {
        
        let textField : UITextField = numTextField2.isEditing ? numTextField2 : numTextField1
        didProcessFor(textField: textField)
        
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if !(sender.text?.isEmpty)! {
            didProcessFor(textField: sender)
        }
        
    }
    
    func didProcessFor(textField :UITextField) {
        if let value = Double(textField.text!) {
            convert(num: value, textField: textField,
                    calculate: { (num) in
                        return  textField  == numTextField1 ?
                            (num * converterConstants[segmentConverter.selectedSegmentIndex]) :
                            (num / converterConstants[segmentConverter.selectedSegmentIndex])
            }
            )}
        
    }
    
    func convert(num: Double, textField :  UITextField, calculate : (_ val : Double) -> Double ) {
        if textField == numTextField1 {
            numTextField2.text  = "\(calculate(num))"
        }
        if textField == numTextField2 {
            numTextField1.text  = "\(calculate(num))"
        }
    }
}







