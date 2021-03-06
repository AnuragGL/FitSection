

import UIKit

extension UIViewController {
    
    func showAlert (error:String,message:String,okTitle:String) {
        let alert = UIAlertController(title: error, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: okTitle, style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

var asyncImagesCashArray = NSCache<NSString, UIImage>()

class AyncImageView: UIImageView {
    
    private var currentURL: NSString?
    
    func loadAsyncFrom(url: String, placeholder: UIImage?) {
        let imageURL = url as NSString
        if let cashedImage = asyncImagesCashArray.object(forKey: imageURL) {
            image = cashedImage
            return
        }
        image = placeholder
        currentURL = imageURL
        guard let requestURL = URL(string: url) else { image = placeholder; return }
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                if error == nil {
                    if let imageData = data {
                        if self?.currentURL == imageURL {
                            if let imageToPresent = UIImage(data: imageData) {
                                asyncImagesCashArray.setObject(imageToPresent, forKey: imageURL)
                                self?.image = imageToPresent
                            } else {
                                self?.image = placeholder
                            }
                        }
                    } else {
                        self?.image = placeholder
                    }
                } else {
                    self?.image = placeholder
                }
            }
            }.resume()
    }
}

extension UIView {
    
    func setCardView() {
        layer.cornerRadius = 5.0
        layer.borderColor  =  UIColor.black.cgColor
        layer.borderWidth = 0.5
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 0.5
        layer.shadowOffset = CGSize(width:0.2, height: 0.2)
        layer.masksToBounds = true
        
    }
    func setCorner(cornerRadius: CGFloat, clip:Bool) {
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clip
    }
    
    func setBorder(color: UIColor, width: CGFloat , cornerRadius: CGFloat){
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func drawShadow(shadowColor: UIColor = UIColor.black, opacity: Float = 0.5, offset: CGSize, radius: CGFloat , shouldRasterize : Bool = false) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = shouldRasterize
    }
}
