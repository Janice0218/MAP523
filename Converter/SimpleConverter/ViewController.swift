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
        
    
        if numTextField1.isEditing && numTextField1.text != nil{
            let val = Double(numTextField1.text!)
            let res = convert(num: val!, operation: { (num) -> Double in
                return num * converterConstants[sender.selectedSegmentIndex]
           })
        numTextField2.text = "\(res)"
        }
            
        if numTextField2.isEditing && numTextField1.text != nil {
            let val = Double(numTextField2.text!)
            let res = convert(num: val!, operation: { (num) -> Double in
                return num * converterConstants[sender.selectedSegmentIndex]
            })
        numTextField1.text = "\(res)"
        }
        
    }

    @IBAction func textChanged(_ sender: UITextField) {
        if sender == numTextField1 && numTextField1.text != nil{
            let val = Double(numTextField1.text!)
            let res = convert(num: val!, operation: { (num) -> Double in
                return num * converterConstants[segmentConverter.selectedSegmentIndex]
            })
            numTextField2.text = "\(res)"
        }
        if sender == numTextField2 && numTextField2.text != nil{
            let val = Double(numTextField2.text!)
            let res = convert(num: val!, operation: { (num) -> Double in
                return num * converterConstants[segmentConverter.selectedSegmentIndex]
            })
            numTextField1.text = "\(res)"
        }

    }
    
    func convert(num: Double , operation : (_ val : Double)-> Double)-> Double {
        return operation (num)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
   
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

