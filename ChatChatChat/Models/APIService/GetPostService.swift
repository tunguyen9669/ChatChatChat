//
//  GetPostService.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation
import UIKit

class GetPostService {
    var postArr = [Post]()
    let services = PostServices()
    
    func getData(_ completion: @escaping([Post]) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        services.getPosts("2") { (result) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let posts):
                for item in posts {
                    self.postArr.append(Post(item))
                }
                print(1)
                completion(self.postArr)
            case .failure(let error):
                print("Fail get data")
                print(error)
            }
        }
    }
}
