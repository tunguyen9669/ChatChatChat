//
//  APIServiceAgent.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import CFNetwork

class APIServiceAgent: NSObject {
    func startRequest(_ request: DataRequest, completion: @escaping (JSON, NSError?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        request
            .responseJSON { (response: DataResponse<Any>) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    completion(json, nil)
                case .failure(let error as NSError):
                    completion(JSON.null, error)
                }
        }
    }

}
