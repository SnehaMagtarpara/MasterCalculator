//
//  ViewController.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stsrtButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var shareAppButton: UIButton!
    @IBOutlet weak var rateAppButton: UIButton!
    @IBOutlet weak var calculatorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "CalculatorUtilies") as! CalculatorUtilies
        navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func aboutUsButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "AboutUs") as! AboutUs
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Calculator") as! Calculator
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func setButtons()
    {
        stsrtButton.layer.borderWidth = 2
        stsrtButton.layer.borderColor = UIColor.white.cgColor
        stsrtButton.layer.cornerRadius = 10
        aboutUsButton.layer.borderWidth = 2
        aboutUsButton.layer.borderColor = UIColor.white.cgColor
        aboutUsButton.layer.cornerRadius = 10
        calculatorButton.layer.borderWidth = 2
        calculatorButton.layer.borderColor = UIColor.white.cgColor
        calculatorButton.layer.cornerRadius = 10
        shareAppButton.layer.borderWidth = 2
        shareAppButton.layer.borderColor = UIColor.white.cgColor
        shareAppButton.layer.cornerRadius = 10
        rateAppButton.layer.borderWidth = 2
        rateAppButton.layer.borderColor = UIColor.white.cgColor
        rateAppButton.layer.cornerRadius = 10
    }
}

