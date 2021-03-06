
import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.image = UIImage(named: "daxcoLabsIcon")
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
         initialSetups()
    }
  
    
    func initialSetups() {
        
        UIView.animate(withDuration: 1,delay: 0.4, options: .curveEaseIn, animations: { () -> Void in
                self.logoImageView.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
             
            }, completion: { (animation) in
                UIView.animate(withDuration: 1, animations: { () -> Void in
                    self.logoImageView.transform = .identity
                }, completion: { (animation) in
                      self.pushToRootController()
                })
            })
        }
   
    
    func pushToRootController() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddDetailsViewController") as? AddDetailsViewController
        let navigationVC = UINavigationController(rootViewController: vc!)
        
        
        UIApplication.shared.windows.first?.rootViewController = navigationVC
        UIApplication.shared.windows.first?.becomeKey()
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
