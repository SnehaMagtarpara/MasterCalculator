//
//  EMICalcolator.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class EMICalcolator: UIViewController {
    
    
    @IBOutlet weak var loanAmountTxt: UITextField!
    @IBOutlet weak var intrestAmountTxt: UITextField!
    @IBOutlet weak var timePeriodTxt: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func backButtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        calculateEmi()
    }
    
    
    @IBAction func ClearAllButtonAction(_ sender: Any) {
        loanAmountTxt.text?.removeAll()
        intrestAmountTxt.text?.removeAll()
        timePeriodTxt.text?.removeAll()
    }
    func calculateEmi()
    {
        guard let loanAmountStr = loanAmountTxt.text,
              let loanAmount = Double(loanAmountStr),
              let intrestAmountStr = intrestAmountTxt.text,
              let intestAmount = Double(intrestAmountStr),
              let timePeriodStr = timePeriodTxt.text,
              let timePeriod = Double(timePeriodStr) else{
            totalAmountLabel.text = "Please enter valid values"
            
            return
        }
        let monthlyIntrestRate = intestAmount / 12 / 100
        let numerator = loanAmount + monthlyIntrestRate * pow(1 + monthlyIntrestRate, timePeriod)
        let denominator = pow(1 + monthlyIntrestRate,timePeriod) - 1
        let emi = numerator / denominator
        
        totalAmountLabel.text = "Total Payable Amount: \(emi)"
    }
    func setProperty()
    {
        calculateButton.layer.cornerRadius = 15
        loanAmountTxt.layer.cornerRadius = 5
        loanAmountTxt.layer.borderColor = UIColor.gray.cgColor
        loanAmountTxt.layer.borderWidth = 1
        intrestAmountTxt.layer.cornerRadius = 5
        intrestAmountTxt.layer.borderColor = UIColor.gray.cgColor
        intrestAmountTxt.layer.borderWidth = 1
        timePeriodTxt.layer.cornerRadius = 5
        timePeriodTxt.layer.borderColor = UIColor.gray.cgColor
        timePeriodTxt.layer.borderWidth = 1
    }
}
