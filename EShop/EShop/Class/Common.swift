//
//  Common.swift
//  EShop
//
//  Created by Pathmazing on 3/15/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

func getHeader() -> [String:String]{
    
    let headers: HTTPHeaders = [
        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        "Accept": "application/json"
    ]
    return headers
}

var screenSize = UIScreen.main.bounds

func getHeightImage(defaulHeight: CGFloat, defaulWidth: CGFloat, newWeidth: CGFloat) -> CGFloat{

    return newWeidth *  defaulHeight / defaulWidth
    //    return newWeidth *  175 / 375
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIImage {
    class func imageWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
extension UIImageView{
    func loadImage(url : String, _ placeHolderImage : String = "", _ indicator : Bool = false, handler: (() -> ())?){
        self.kf.indicatorType = .activity
        
        if handler == nil{
            self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(named: placeHolderImage), options: [.transition(ImageTransition.fade(1))])
            
        }else{
            kf.setImage(with: (NSURL(string: url) as! Resource?), placeholder: UIImage(named: placeHolderImage), options:  [.transition(.fade(1))], progressBlock: nil, completionHandler: { (image, error, cache, imageUrl) in
                if error != nil {
                    handler!()
                }
            })
        }
    }
}

