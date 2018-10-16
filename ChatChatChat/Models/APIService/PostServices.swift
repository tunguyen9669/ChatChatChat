//
//  PostServices.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostServices: APIServiceObject{
    func getPosts(_ term: String, completion: @escaping (Result<[PostsDTO]>) -> Void) {
        let request = APIRequestProvider.shareInstance.getDataResult()
        serviceAgent.startRequest(request) { (json, error) in
            if let error = error {
                completion(Result.failure(error))
            } else {
                var posts = [PostsDTO]()
                for item in json.arrayValue {
                    posts.append(PostsDTO(item))
                }
                completion(Result.success(posts))
            }
        }
}
}
