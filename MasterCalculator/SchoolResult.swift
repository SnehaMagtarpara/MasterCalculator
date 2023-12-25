//
//  SchoolResult.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class SchoolResult: UIViewController {
    
    
    @IBOutlet weak var totalMarksTextField: UITextField!
    @IBOutlet weak var yourTotalMarksTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        calculateSchoolResult()
    }
    
    @IBAction func cleaAllButtonAction(_ sender: Any) {
        totalMarksTextField.text?.removeAll()
        yourTotalMarksTextField.text?.removeAll()
    }
    func calculateSchoolResult()
    {
        guard let totalMarksStr = totalMarksTextField.text,
              let totalmarks = Double(totalMarksStr),
              let yourMarksStr = yourTotalMarksTextField.text,
              let yourMarks = Double(yourMarksStr) else {
            resultLabel.text = "Please enter valid values"

            return
        }
        let marks = (yourMarks * 100) / totalmarks
        let result = marks
        resultLabel.text = "Result: \(result)"
    }
    func setProperty()
    {
        calculateButton.layer.cornerRadius = 15
        totalMarksTextField.layer.cornerRadius = 5
        totalMarksTextField.layer.borderColor = UIColor.gray.cgColor
        totalMarksTextField.layer.borderWidth = 1
        yourTotalMarksTextField.layer.cornerRadius = 5
        yourTotalMarksTextField.layer.borderColor = UIColor.gray.cgColor
        yourTotalMarksTextField.layer.borderWidth = 1
      
    }
    
}
