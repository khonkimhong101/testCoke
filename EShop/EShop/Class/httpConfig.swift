//
//  httpConfig.swift
//  EShop
//
//  Created by Pathmazing on 3/15/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

var AlamofirerequestHttp: Request?

public class http {
    
    public class func cancelAllRequest(){
        AlamofirerequestHttp?.cancel()
    }
    
    public class func get(url:String ,parameters: [String: AnyObject], callback:@escaping (Bool, JSON) -> Void){
        let fullUrl = url
        let safeURL = fullUrl.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
//        AlamofirerequestHttp = Alamofire.request(safeURL!, method: .get,  parameters: parameters, encoding: JSONEncoding.default)
            AlamofirerequestHttp = Alamofire.request(safeURL!, method: .get,  parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                switch response.result {
                case .success:
                    callback(true, JSON(data: response.data!))
                case .failure:

                    callback(false, JSON(data: response.data!))
                }
        }
    }
}

