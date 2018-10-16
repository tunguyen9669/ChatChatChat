//
//  VCPresenter.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import Foundation
import  UIKit
protocol VCDelegate {
    func showMessage(_ message: String)
    func userSuccesfullyLoggedIn()
    func getData()
}

class VCPresenter: NSObject {
    var postArr = [Post]()
    let services = PostServices()
    var delegate: VCDelegate!
    
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
    
    func checkInput(_ username: String, _ password: String) {
        if username.count != 0 {
            if password.count != 0 {
                vertify(username, password)
            } else {
                self.delegate.showMessage("Password should not be empty")
            }
        } else {
            self.delegate.showMessage("Username should not be empty")
        }
    }
    
    fileprivate func vertify(_ username: String, _ password: String) {
        if username == "tund7@gmail.com" && password == "123456" {
            // you can login now
            let user = User(email: "tund7@gmail.com", password: "123456", gender: "Male")
            self.delegate.userSuccesfullyLoggedIn()
        } else {
            self.delegate.showMessage("Please enter invalid your username and password")
        }
    }
}
