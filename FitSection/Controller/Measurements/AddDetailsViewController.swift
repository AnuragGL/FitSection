
import UIKit
import DropDown

class AddDetailsViewController: UIViewController{

    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var progressHeaderPhotoView : UIView!
    
    var reloadTable = false {
        didSet {
            tableView.reloadData()
        }
    }
    
    var titleName = ["Body Weight","Body Height","Gender","Age","Neck","Waist"]
    
    var titlePlaceHolder = ["Body weight in lbs","Body Height in Inches","Male/Female","Age","Neck in Inches","Waist in Inches"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // gestureToView()
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        pushNavigationController(storyBoardName: defaultStory, viewControllerIdentifier: "DietPref", caseValue: 3)
    }
    
    
    func pushNavigationController(storyBoardName : String, viewControllerIdentifier: String, caseValue : Int) {
        let vc = UIStoryboard.init(name: storyBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerIdentifier)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension AddDetailsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if reloadTable {
           return titlePlaceHolder.count
        }
        
        return titlePlaceHolder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddDetailsTableViewCell", for: indexPath) as! AddDetailsTableViewCell
        cell.titleNameLabel.text = titleName[indexPath.row]
        cell.descriptionTF.placeholder = titlePlaceHolder[indexPath.row]
        cell.descriptionTF.tag = indexPath.row 
        cell.buttonOutlet.tag = indexPath.row
        cell.delegate = self
        if indexPath.row == 6 {
            cell.starLabel.isHidden = true
        }
        return cell
    }
}

extension AddDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row Value: \(titlePlaceHolder[indexPath.row])")
        print("Row: \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddDetailsTableViewCell", for: indexPath) as! AddDetailsTableViewCell
        cell.buttonPressed(cell.buttonOutlet)
    }
}

extension AddDetailsViewController : ReloadTableViewDelegate {
    
    func reloadTableViewCells() {
        reloadTable = true
    }
}
