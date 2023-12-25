//
//  AboutUs.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class AboutUs: UIViewController {
    
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.layer.borderWidth = 2
        shareButton.layer.borderColor = UIColor.white.cgColor
        shareButton.layer.cornerRadius = 10
        rateButton.layer.borderWidth = 2
        rateButton.layer.borderColor = UIColor.white.cgColor
        rateButton.layer.cornerRadius = 10
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
