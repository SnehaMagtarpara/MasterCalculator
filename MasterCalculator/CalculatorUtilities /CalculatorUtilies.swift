//
//  CalculatorUtilies.swift
//  MasterCalculator
//
//  Created by Frontlink Tech on 23/12/23.
//

import UIKit

class CalculatorUtilies: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var Cv: UICollectionView!
    
    var imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5")]
    var nameArray = ["Mutual Fund","Intrest","Discount","EMI","School Result"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backArrowButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalculatorUtilitiesCell
        cell.img.image = imageArray[indexPath.row]
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 125)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let navigation = storyboard?.instantiateViewController(withIdentifier: "MutualFundCalculate") as! MutualFundCalculate
            navigationController?.pushViewController(navigation, animated: true)
        }
        else if indexPath.row == 1
        {
            let navigation = storyboard?.instantiateViewController(withIdentifier: "IntrestCalculator") as! IntrestCalculator
            navigationController?.pushViewController(navigation, animated: true)
            
        }
        else if indexPath.row == 2
        {
            let navigation = storyboard?.instantiateViewController(withIdentifier: "DiscountCalculator") as! DiscountCalculator
            navigationController?.pushViewController(navigation, animated: true)
        }
        else if indexPath.row == 3
        {
            let navigation = storyboard?.instantiateViewController(withIdentifier: "EMICalcolator") as! EMICalcolator
            navigationController?.pushViewController(navigation, animated: true)
        }
        else 
        {
            let navigation = storyboard?.instantiateViewController(withIdentifier: "SchoolResult") as! SchoolResult
            navigationController?.pushViewController(navigation, animated: true)
        }
        
    }
}
