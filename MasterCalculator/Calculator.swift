//
//  Calculator.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class Calculator: UIViewController {
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButtton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var working = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperty()
        clearAll()
    }
    func clearAll()
    {
        working = ""
        calculatorWorking.text = ""
        calculatorResult.text = ""
    }
    @IBAction func acButtonAction(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backSpaceButtonAction(_ sender: Any) {
        if !working.isEmpty
        {
            working.removeLast()
            calculatorWorking.text = working
        }
    }
    func addToWorking(value:String)
    {
        working = working + value
        calculatorWorking.text = working
    }
    @IBAction func percentageButtonAction(_ sender: Any) {
        addToWorking(value: "%")
    }
    
    @IBAction func divideButtonAction(_ sender: Any) {
        addToWorking(value: "/")
    }
    
    @IBAction func mulButtonAction(_ sender: Any) {
        addToWorking(value: "*")
    }
    
    @IBAction func subButtonAction(_ sender: Any) {
        addToWorking(value: "-")
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        addToWorking(value: "+")
    }
    
    @IBAction func equalButtonAction(_ sender: Any) {
        if (validInput())
        {
            let checkWorkingForPrecent = working.replacingOccurrences(of: "%", with: "*0.01")
            let express = NSExpression(format: checkWorkingForPrecent)
            let result = express.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result:result)
            calculatorResult.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math on base ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            present(alert, animated: true)
        }
    }
    
    func formatResult(result:Double) -> String
    {
        if result.truncatingRemainder(dividingBy: 1) == 0
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    func validInput() -> Bool
    {
        var count = 0
        var charIndex = [Int]()
        for chara in working
        {
            if specialCharacter(char:chara)
            {
                charIndex.append(count)
            }
            count += 1
        }
        
        var previous : Int = 1
        
        for index in charIndex
        {
            if index == 0
            {
                return false
            }
            else if (index == working.count - 1)
            {
                return false
            }
            else if previous != 1
            {
                if index - previous == 1
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char:Character) -> Bool
    {
        if char == "%"
        {
            return true
        }
        else if char == "/"
        {
            return true
            
        }
        else if char == "*"
        {
            return true
            
        }
        else if char == "-"
        {
            return true
            
        }
        else if char == "+"
        {
            return true
            
        }
        else if char == "="
        {
            return true
        }
        return false
    }
    
    @IBAction func sevenButtonAction(_ sender: Any) {
        addToWorking(value: "7")
    }
    
    @IBAction func eightButtonAction(_ sender: Any) {
        addToWorking(value: "8")
    }
    
    @IBAction func nineButtonAction(_ sender: Any) {
        addToWorking(value: "9")
    }
    
    @IBAction func sixButtonAction(_ sender: Any) {
        addToWorking(value: "6")
    }
    
    @IBAction func fiveButtonAction(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    @IBAction func fourButtonAction(_ sender: Any) {
        addToWorking(value: "4")
    }
    
    @IBAction func oneButtonAction(_ sender: Any) {
        addToWorking(value: "1")
    }
    
    @IBAction func twoButtonAction(_ sender: Any) {
        addToWorking(value: "2")
    }
    
    @IBAction func threeButtonAction(_ sender: Any) {
        addToWorking(value: "3")
    }
    
    @IBAction func pointButtonAction(_ sender: Any) {
        addToWorking(value: ".")
    }
    
    @IBAction func zeroButtonAction(_ sender: Any) {
        addToWorking(value: "0")
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setProperty()
    {
        acButton.layer.cornerRadius = 35
        backButton.layer.cornerRadius = 35
        percentageButton.layer.cornerRadius = 35
        divideButton.layer.cornerRadius = 35
        mulButton.layer.cornerRadius = 35
        subButton.layer.cornerRadius = 35
        plusButton.layer.cornerRadius = 35
        equalButton.layer.cornerRadius = 35
        pointButton.layer.cornerRadius = 35
        zeroButton.layer.cornerRadius = 35
        oneButton.layer.cornerRadius = 35
        twoButton.layer.cornerRadius = 35
        threeButton.layer.cornerRadius = 35
        fourButton.layer.cornerRadius = 35
        fiveButton.layer.cornerRadius = 35
        sixButtton.layer.cornerRadius = 35
        sevenButton.layer.cornerRadius = 35
        eightButton.layer.cornerRadius = 35
        nineButton.layer.cornerRadius = 35
    }
}
