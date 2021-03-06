//
//  HealthIssueVC.swift
//  FitSection
//
//  Created by Kanchan Verma on 06/03/2021.
//

import UIKit

class HealthIssueVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var issuesView: UICollectionView!
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergy", for: indexPath) as! issuesCell
        cell.issueAllergy.text = HealthConditions.allCases[indexPath.row].rawValue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HealthConditions.allCases.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.issuesView.bounds.width
        return CGSize(width: screenWidth * 0.49, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issuesView.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("items selected \(HealthConditions.allCases[indexPath.row])")
        let cell = collectionView.cellForItem(at: indexPath) as! issuesCell
        //cell.contentView.backgroundColor = 
    }
}

class  issuesCell: UICollectionViewCell {
    
    @IBOutlet weak var issueAllergy: UILabel!
}
