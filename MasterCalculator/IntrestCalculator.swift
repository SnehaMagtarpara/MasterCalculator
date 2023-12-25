//
//  IntrestCalculator.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class IntrestCalculator: UIViewController {
    
    @IBOutlet weak var principalAmountTextField: UITextField!
    @IBOutlet weak var intrestRateTextField: UITextField!
    @IBOutlet weak var timePeriodTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        calculateIntrest()
    }
    @IBAction func clearAllButtonAction(_ sender: Any) {
        principalAmountTextField.text?.removeAll()
        intrestRateTextField.text?.removeAll()
        timePeriodTextField.text?.removeAll()
    }
    
    @IBAction func backuttonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func calculateIntrest()
    {
        guard let principalStr = principalAmountTextField.text,
              let principal = Double(principalStr),
              let intrestStr = intrestRateTextField.text,
              let intrestRate = Double(intrestStr),
              let timePeriodStr = timePeriodTextField.text,
              let timePeriod = Double(timePeriodStr) else {
            resultLabel.text = "Please enter valid values"
            
            return
        }
        
        let simpleInterest = (principal * intrestRate * timePeriod) / 100
        let interest =  (100 * simpleInterest) / (principal + timePeriod)
        let totalAmount = (100 * simpleInterest) / (principal + intrestRate)
        let amount = principal + simpleInterest
        
        resultLabel.text = "Result: \(amount)"
    }
    func setProperty()
    {
        calculateButton.layer.cornerRadius = 15
        principalAmountTextField.layer.cornerRadius = 5
        principalAmountTextField.layer.borderColor = UIColor.gray.cgColor
        principalAmountTextField.layer.borderWidth = 1
        intrestRateTextField.layer.cornerRadius = 5
        intrestRateTextField.layer.borderColor = UIColor.gray.cgColor
        intrestRateTextField.layer.borderWidth = 1
        timePeriodTextField.layer.cornerRadius = 5
        timePeriodTextField.layer.borderColor = UIColor.gray.cgColor
        timePeriodTextField.layer.borderWidth = 1
    }
}
