//
//  FirstPresenter.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation

struct ViewData {
    var title: String
    var id: String
    var userID: String
    var body: String
}

protocol PostView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setPosts(_ posts: [ViewData])
    func setEmptyPosts()
}

class FirstPresenter {
    fileprivate let postService: GetPostService
    weak fileprivate var postView : PostView?
    
    init(postService: GetPostService){
        self.postService = postService
    }
    
    func attachView(_ view: PostView){
        postView = view
    }
    
    func detachView() {
        postView = nil
    }
    
    func getData(){
        self.postView?.startLoading()
        postService.getData{ [weak self] data in
            self?.postView?.finishLoading()
            if data.count == 0 {
                self?.postView?.setEmptyPosts()
            } else {
                let mappedPosts = data.map {
                    return ViewData(title: "\($0.title)", id: "\($0.id)", userID: "\($0.userID)", body: "\($0.body)")
                }
                self?.postView?.setPosts(mappedPosts)
            }
            
        }
    }
}
