
import UIKit

protocol RecipiesTableViewCellDelegate
{
    func foodCellClicked()
}

class RecipiesTableViewCell: UITableViewCell {

    @IBOutlet weak var recipieCollectionView: UICollectionView!
    var delegate: RecipiesTableViewCellDelegate?
    
    var recipieModelData:DaxkoFit?
    var recipieModelDataArray:[Food] =  [Food]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.recipieCollectionView.delegate = self
        self.recipieCollectionView.dataSource = self
        initialSetUp()
    }
    
    func initialSetUp() {
        self.recipieCollectionView.delegate = self
        self.recipieCollectionView.dataSource = self
        setupCollectionViewFlowLayout()
    }
    
    func configure(model:DaxkoFit,food:[Food]) {
        recipieModelData = model
        recipieModelDataArray = food
    }
    
    func getModelAtIndex(atIndex:Int)-> Food {
        return self.recipieModelDataArray[atIndex]
    }
    
    private func setupCollectionViewFlowLayout() {
        let flow = UICollectionViewFlowLayout()
        let screen = (UIScreen.main.bounds.size.width - 50)/3
        flow.itemSize = CGSize(width: screen, height: 135)
        flow.scrollDirection = .horizontal
        recipieCollectionView.collectionViewLayout = flow
    }
}

extension RecipiesTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numberOfItems = recipieModelData?.food.count {
          return numberOfItems
        }else {
           return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recipieCollectionView.dequeueReusableCell(withReuseIdentifier: "MoreRecipiesCollectionViewCell", for: indexPath) as! MoreRecipiesCollectionViewCell
        let modelTopass = getModelAtIndex(atIndex: indexPath.item)
        cell.configure(model: modelTopass)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section: \(indexPath.section)")
        print("Row: \(indexPath.row)")
        self.delegate?.foodCellClicked()
    }
}
