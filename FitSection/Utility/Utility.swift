
import Foundation
import UIKit

func readJson(jsonFileName:String) -> Data? {
    var data:Data?
    do {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: "json") {
            data = try Data(contentsOf: file)
            
          } else {
            print("no file")
        }
    } catch {
        print(error.localizedDescription)
    }
    return data
}

let defaultStory = "Main"
let dietArray = ["Vegan","Meat based","Vegeterian"]

public enum DietType: String,CaseIterable {
    case vegan = "Vegan"
    case meatBased = "Meat based"
    case veg = "Vegeterian"
}

public enum HealthConditions: String,CaseIterable {
    case thyroid = "Thyroid"
    case hbp = "High blood pressure"
    case pcod = "PCOD"
    case diabetes = "Diabetes"
    case sleepDisorder = "Sleep disorder"
    case lactoseIntolerence = "Lactose intolerence"
    case eggs = "Egg allergy"
    case nutAllergy = "Nut allergy"
    case peanuts = "Peanut allergy"
    case shellfish = "Shellfish allergy"
    case wheat = "Glutton allergy"
    case soy = "Soy allergy"
    case fish = "Fish allergy"
}

let themeColor = UIColor.init(red: 29/255, green: 129/255, blue: 240/255, alpha: 1)
