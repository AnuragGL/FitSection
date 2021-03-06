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
        var dietSelected = DietType.init(rawValue: dietArray[indexPath.row])
        
    }
}
