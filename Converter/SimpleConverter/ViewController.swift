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
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var segmentConverter: UISegmentedControl!
    
    //constant var for conversion
    let converterConstants = [0.0833333,2.54,0.0277778]
    let convertToLabel = ["Feet", "Centimeter", "Yard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        toLabel.text = convertToLabel[0]
        segmentConverter.selectedSegmentIndex = 0
        
        numTextField1.addTarget(self, action: #selector(textDidChanged(_:)), for: .editingChanged)
        numTextField2.addTarget(self, action: #selector(textDidChanged(_:)), for: .editingChanged)
    }
    
    //action for segments
    @IBAction func convertSegmentClick(_ sender: UISegmentedControl) {
        
        toLabel.text = convertToLabel[sender.selectedSegmentIndex]
        
        let textField : UITextField = numTextField2.isEditing ? numTextField2 : numTextField1
        didProcessFor(textField: textField)
        
    }
    
    @objc func textDidChanged(_ textField : UITextField) {
        didProcessFor(textField: textField)
    }
    
    
    func didProcessFor(textField :UITextField) {
        if let value = Double(textField.text!) {
            convert(num: value, textField: textField,
                    calculate: { (num) in
                        return  textField  == numTextField1 ?
                            (num * converterConstants[segmentConverter.selectedSegmentIndex]) :
                            (num / converterConstants[segmentConverter.selectedSegmentIndex])
            })
        }
        else {
            numTextField1.text = ""
            numTextField2.text = ""
        }
    }
    
    
    //switch
    @IBAction func clearTextSwitched(_ sender: UISwitch) {
        numTextField2.clearsOnBeginEditing = sender.isOn
        numTextField1.clearsOnBeginEditing = sender.isOn
    }
    
    
    
    //convert num and send result to textField
    func convert(num: Double, textField :  UITextField, calculate : (_ val : Double) -> Double ) {
        let textFieldResult  = (textField == numTextField1) ?  numTextField2 : numTextField1
        textFieldResult?.text = String(format : "%.2f",calculate(num))
    }
}







