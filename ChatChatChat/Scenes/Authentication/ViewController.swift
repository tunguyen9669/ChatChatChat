//
//  ViewController.swift
//  ChatChatChat
//
//  Created by admin on 10/13/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    


}

