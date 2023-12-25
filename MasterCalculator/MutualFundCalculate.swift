//
//  MutualFundCalculate.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class MutualFundCalculate: UIViewController {
    
    @IBOutlet weak var inverstmentTextField: UITextField!
    @IBOutlet weak var returnTextfield: UITextField!
    @IBOutlet weak var timePeriodTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func clearAllButtonAction(_ sender: Any) {
        calculateMutualFundValue()
    }
    
    @IBAction func clearAllButtpnAction(_ sender: Any) {
        inverstmentTextField.text?.removeAll()
        returnTextfield.text?.removeAll()
        timePeriodTextField.text?.removeAll()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func calculateMutualFundValue() {
        guard let initialInvestmentStr = inverstmentTextField.text,
              let initialInvestment = Double(initialInvestmentStr),
              let monthlyContributionStr = returnTextfield.text,
              let monthlyContribution = Double(monthlyContributionStr),
              let yearsStr = timePeriodTextField.text,
              let years = Int(yearsStr),
              let interestRateStr = inverstmentTextField.text,
              let interestRate = Double(interestRateStr) else {
            // Handle invalid input
            resultLabel.text = "Please enter valid values"
            return
        }
        let months = years * 12
        var futureValue = initialInvestment
        let monthlyInterestRate = interestRate / 12 / 100
        
        for _ in 0..<months {
            futureValue += monthlyContribution
            futureValue *= (1 + monthlyInterestRate)
        }
        resultLabel.text = "Future Value: \(futureValue)"
    }
    
    func setProperty()
    {
        calculateButton.layer.cornerRadius = 15
        inverstmentTextField.layer.borderWidth = 1
        inverstmentTextField.layer.borderColor = UIColor.gray.cgColor
        inverstmentTextField.layer.cornerRadius = 5
        returnTextfield.layer.borderWidth = 1
        returnTextfield.layer.borderColor = UIColor.gray.cgColor
        returnTextfield.layer.cornerRadius = 5
        timePeriodTextField.layer.cornerRadius = 5
        timePeriodTextField.layer.borderWidth = 1
        timePeriodTextField.layer.borderColor = UIColor.gray.cgColor
    }
}
