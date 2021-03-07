
import UIKit
import DropDown

protocol ReloadTableViewDelegate : class {
    func reloadTableViewCells()
}

class AddDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var contView : UIView!
    @IBOutlet weak var titleNameLabel : UILabel!
    @IBOutlet weak var descriptionTF : UITextField!
    @IBOutlet weak var starLabel : UILabel!
    @IBOutlet weak var buttonOutlet : UIButton!
    
    var weightArray = Array(25...130)
    var heightArray = Array(80...400)
    var neckArray = Array(14...26)
    var genderArray = ["Male","Female"]
    var ageArray = Array(10...90)
    
    let weightDropDown = DropDown()
    let heightDropDown = DropDown()
    let genderDropDown = DropDown()
    let ageDropDown = DropDown()
    let neckDropDown = DropDown()
    let waistDropDown = DropDown()
    
    var delegate : ReloadTableViewDelegate?
    
    var count = 0

    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
        switch sender.tag {
        case 0:
            print("Nothing: \("")")
            weightDropDown.dismissMode = .automatic
            weightDropDown.width = descriptionTF.frame.width
            weightDropDown.anchorView = descriptionTF
            weightDropDown.direction = .bottom
            weightDropDown.dataSource = weightArray.map {String($0)}

            weightDropDown.selectionAction = {(index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item + " " + "lbs"
                if self.descriptionTF.text != "" {
                    print("0: \("Filled")")

                }
            }
            weightDropDown.show()

        case 1:
            print("Nothing: \("")")
            heightDropDown.dismissMode = .automatic
            heightDropDown.width = descriptionTF.frame.width
            heightDropDown.anchorView = descriptionTF
            heightDropDown.direction = .bottom
            heightDropDown.dataSource = heightArray.map {String($0)}

            heightDropDown.selectionAction = {(index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item + " " + "inches"
                if self.descriptionTF.text != "" {
                    print("1: \("Filled")")

                }
            }
            heightDropDown.show()

        case 2:
            print("Nothing: \("")")
            genderDropDown.dismissMode = .automatic
            genderDropDown.width = descriptionTF.frame.width
            genderDropDown.anchorView = descriptionTF
            genderDropDown.direction = .bottom
            genderDropDown.dataSource = genderArray

            genderDropDown.selectionAction = { (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item
                if self.descriptionTF.text != "" {
                    print("2: \("Filled")")

                }
            }
            genderDropDown.show()
            
        case 3:
            print("Nothing: \("")")
            ageDropDown.dismissMode = .automatic
            ageDropDown.width = descriptionTF.frame.width
            ageDropDown.anchorView = descriptionTF
            ageDropDown.direction = .bottom
            ageDropDown.dataSource = ageArray.map {String($0)}

            ageDropDown.selectionAction = {(index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item + " " + "years"

                if self.descriptionTF.text != "" {
                    print("3: \("Filled")")

                }
            }
            ageDropDown.show()

        case 4:
            print("Nothing: \("")")
            neckDropDown.dismissMode = .automatic
            neckDropDown.width = descriptionTF.frame.width
            neckDropDown.anchorView = descriptionTF
            neckDropDown.direction = .bottom
            neckDropDown.dataSource = neckArray.map {String($0)}

            neckDropDown.selectionAction = {(index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item + " " + "inches"

                if self.descriptionTF.text != "" {
                    print("4: \("Filled")")

                }
            }
            neckDropDown.show()

        case 5:
            print("Nothing: \("")")
            waistDropDown.dismissMode = .automatic
            waistDropDown.width = descriptionTF.frame.width
            waistDropDown.anchorView = descriptionTF
            waistDropDown.direction = .bottom
            waistDropDown.dataSource = weightArray.map {String($0)}

            waistDropDown.selectionAction = {(index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                self.descriptionTF.text = item + " " + "inches"

                if self.descriptionTF.text != "" {
                    print("5: \("Filled")")

                }
            }
            waistDropDown.show()

        default:
            break
        }
    }

}

