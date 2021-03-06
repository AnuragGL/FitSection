
import UIKit

let recipiesInfoVC = "RecipielnfoVC"

class RecipielnfoVC: UIViewController {

    var sectionTitle = ["Nutritional Info","Ingredients","Prepration Method"]
    
    
    var nutritionArray = ["Protein","Fats","Carbs"]
    var nutritionInfoValueArray = ["20g","30g","13g"]
    var ingredientsArray = ["3 tbsp olive oil","2 sweet potatoes, peeled and cut into medium chunks","2 tsp smoked paprika", "2 tsp ground cumin"]
    var preprationArray = ["Heat the oven to 200C/180C fan/gas 6. Put the sweet potato in a roasting tin and drizzle over 1½ tbsp oil, 1 tsp smoked paprika and 1 tsp ground cumin. Give everything a good mix so that all the chunks are coated in spices, season with salt and pepper, then roast for 25 mins until cooked.","Meanwhile, heat the remaining oil in a large saucepan over a medium heat. Add the onion, carrot and celery. Cook for 8-10 mins, stirring occasionally until soft, then crush in the garlic and cook for 1 min more. Add the remaining dried spices and tomato purée. Give everything a good mix and cook for 1 min more.", "Add the red pepper, chopped tomatoes and 200ml water. Bring the chilli to a boil, then simmer for 20 mins."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RecipielnfoVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return nutritionArray.count
        case 1:
            return ingredientsArray.count
        case 2:
            return preprationArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipieInfoTableViewCell", for: indexPath) as! RecipieInfoTableViewCell
        cell.textLabel?.textColor = colorset()
        cell.textLabel?.font.withSize(15)
        cell.textLabel?.numberOfLines = 0
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = nutritionArray[indexPath.row]
            cell.macrosInfo.text = nutritionInfoValueArray[indexPath.row]
            return cell
        case 1:
            cell.textLabel?.text = ingredientsArray[indexPath.row]
            cell.macrosInfo.isHidden = true
            return cell
        case 2:
            cell.textLabel?.text = preprationArray[indexPath.row]
            cell.macrosInfo.isHidden = true
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func colorset() -> UIColor {
       return UIColor(red: 0/255, green: 117/255, blue: 227/255, alpha: 1.0)
    }
}

extension RecipielnfoVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
      }
    
}
