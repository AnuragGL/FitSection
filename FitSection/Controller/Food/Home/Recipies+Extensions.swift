
import Foundation
import UIKit

class Recipies_Extensions: UIViewController {
    
}

extension Recipies_Extensions {
    
    func pushNavigationController(storyBoardName : String, viewControllerIdentifier: String, caseValue : Int) {
        
        switch caseValue {
        
        case 1:
            break
        default:
            if let vc = UIStoryboard.init(name: storyBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerIdentifier) as? RecipielnfoVC{
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
