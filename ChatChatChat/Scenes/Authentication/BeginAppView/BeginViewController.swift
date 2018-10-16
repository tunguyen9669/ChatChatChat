//
//  BeginViewController.swift
//  ChatChatChat
//
//  Created by admin on 10/13/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import UIKit


class BeginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - actions
    @IBAction func onLogin(_ sender: Any) {
        let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @IBAction func alamofireExampleAction(_ sender: Any) {
        let viewcontroller = AlamofireViewController(nibName: "AlamofireViewController", bundle: nil)
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
}
