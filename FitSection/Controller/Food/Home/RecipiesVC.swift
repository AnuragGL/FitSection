
import UIKit
import Charts

protocol RecipiesVCDelegate:class {
    func passSelectedReciepeType(ID:Int)
}


let recipiesStroryBoardName = "Recipies"
let recipiesVC = "RecipiesVC"

class RecipiesVC: Recipies_Extensions {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var headerFoodArray = ["Indian","Chiniese","Continetal","Veg","Non Veg", "By You"]
    
    var sectionTitle = ["Breakfast","Lunch","Dinner"]
    
    let macros = ["Pro", "Carb", "Fat"]
    let recomendedNutrition = [120.0, 80.0, 60.0]
    
    let viewModel = CustomReciepeViewModel()
    weak var delegate:RecipiesVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setChart(dataPoints: macros, values: recomendedNutrition)
        self.initialSetUp()
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [PieChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Recomended Calories : 1500 cal/day")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Meals"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = "Back"
    }
    
    func initialSetUp() {
        self.viewModel.delegate = self
        viewModel.parseJsonData()
        tableView.tableFooterView = UIView()
    }
    
}

extension RecipiesVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipiesTableViewCell", for: indexPath) as! RecipiesTableViewCell
        let modelArray = viewModel.cellForRowAtIndex(indexpath:indexPath)
        cell.configure(model: viewModel.modelAtItem(Index: indexPath.section), food: modelArray)
        cell.delegate = self
        return cell
    }
}

extension RecipiesVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.modelAtItem(Index: section).name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension RecipiesVC : RecipiesTableViewCellDelegate {
    func foodCellClicked() {
        if let vc = UIStoryboard.init(name: recipiesStroryBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: recipiesInfoVC) as? RecipielnfoVC{
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension RecipiesVC:CustomReciepeViewModelDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}
