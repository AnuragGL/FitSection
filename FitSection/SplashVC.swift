//
//  SplashVC.swift
//  Daxko_FitSection
//
//  Created by Sajal Gupta on 19/11/2019.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.image = UIImage(named: "daxkoLaunch")
        navigationController?.navigationBar.isHidden = true
    
        self.titleLabel.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        self.titleLabel.transform = CGAffineTransform(translationX: 1, y: self.view.frame.maxX + 100)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
         initialSetups()
    }
  
    
    func initialSetups() {
   
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut ,animations: {
            self.titleLabel.transform = .identity
          
        }, completion: { (animation) in
        })

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

//extension UILabel {
//    func pulsate() {
//
//           let pulse = CASpringAnimation(keyPath: "transform.scale")
//           pulse.duration = 0.7 //0.6
//           pulse.fromValue = 1.25
//           pulse.toValue = 1.0
//           pulse.autoreverses = false
////           pulse.repeatCount = 1
////           pulse.initialVelocity = 0.5
//           pulse.damping = 1.0
//
//           layer.add(pulse, forKey: "pulse")
//       }
//}
