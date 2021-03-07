//
//  DietPref.swift
//  FitSection
//
//  Created by Kanchan Verma on 06/03/2021.
//

import UIKit

class DietPref: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dietArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dietOption", for: indexPath) as! FoodPrefCell
        cell.dietType.layer.borderColor = UIColor.init(red: 0,
                                                       green: 0,
                                                       blue: 0,
                                                       alpha: 1.0).cgColor
        cell.dietType.text = dietArray[indexPath.row]
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoodPrefCell
        cell.dietType.textColor = themeColor
        cell.dietType.layer.borderColor = themeColor.cgColor
        UserSelecetion.shared.dietType = DietType.init(rawValue: cell.dietType.text!) ?? DietType.vegan
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoodPrefCell
        cell.dietType.textColor = .black
        cell.dietType.layer.borderColor = UIColor.black.cgColor
    }
}
