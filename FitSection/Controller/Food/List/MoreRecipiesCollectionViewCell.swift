
import UIKit

class MoreRecipiesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipiesImageView: AyncImageView!
    @IBOutlet weak var recipieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    
    func initialSetUp () {
        self.contentView.setBorder(color: UIColor.black, width: 1.0, cornerRadius: 6.0)
    }
    
    func configure(model:Food) {
        recipieNameLabel.text =  model.calories
        recipiesImageView.loadAsyncFrom(url: model.imageUrl, placeholder: UIImage(named: "error_image"))
    }
}
