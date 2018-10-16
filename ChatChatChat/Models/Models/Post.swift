//
//  Post.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation

class Post: NSObject {
    var userID: Int
    var id: Int
    var title: String
    var body: String
    
    init(_ postDto: PostsDTO) {
        self.userID = postDto.userID
        self.id = postDto.id
        self.title = postDto.title
        self.body = postDto.body
    }
}
