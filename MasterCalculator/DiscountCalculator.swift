//
//  DiscountCalculator.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class DiscountCalculator: UIViewController {
    
    
    @IBOutlet weak var totalAmountTxt: UITextField!
    @IBOutlet weak var discountTxt: UITextField!
    @IBOutlet weak var aftreDiscountTxt: UILabel!
    @IBOutlet weak var calculatorButton: UIButton!
    
    @IBOutlet weak var saveAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        calculateDicsountAmount()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clerAllButtonAction(_ sender: Any) {
        totalAmountTxt.text?.removeAll()
        discountTxt.text?.removeAll()
        
    }
    func calculateDicsountAmount()
    {
        guard let totalAmountStr = totalAmountTxt.text,
              let totalAmount = Double(totalAmountStr),
              let discountStr = discountTxt.text,
              let discount = Double(discountStr) else {
            saveAmountLabel.text = "Please enter valid values"
            
            return
        }
        let discountAmount = (totalAmount * discount) / 100
        let amountAfterDiscount = totalAmount - discountAmount
        aftreDiscountTxt.text = "After Discount Amount: \(amountAfterDiscount)"
        saveAmountLabel.text = "Saved Amount: \(discountAmount)"
    }
    func setProperty()
    {
        calculatorButton.layer.cornerRadius = 15
        totalAmountTxt.layer.cornerRadius = 5
        totalAmountTxt.layer.borderColor = UIColor.gray.cgColor
        totalAmountTxt.layer.borderWidth = 1
        discountTxt.layer.cornerRadius = 5
        discountTxt.layer.borderColor = UIColor.gray.cgColor
        discountTxt.layer.borderWidth = 1
        
    }
    
}
