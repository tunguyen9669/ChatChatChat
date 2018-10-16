//
//  ViewController.swift
//  ChatChatChat
//
//  Created by admin on 10/13/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet and variable
    var postArr = [Post]()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    var presenter: VCPresenter!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        presenter = VCPresenter()
        self.presenter.getData() { (data) in
            self.postArr = data
//            for item in self.postArr {
//                print(item.id)
//            }
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        presenter.delegate = self
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
//        navigationController?.navigationBar.isHidden = true
    }
    //
    
   
    
    // MARK: - Login
    @IBAction func onLogin(_ sender: Any) {
        print("Login")
        self.presenter.checkInput(emailTextField.text!, passwordTextField.text!)
       
        let post = PostViewController(nibName: "PostViewController", bundle: nil)
        navigationController?.pushViewController(post, animated: true)
    }
    

}
extension ViewController: VCDelegate {
    func getData() {
        //
    }
    
    func showMessage(_ message: String) {
        self.warningLabel.text = message
        self.warningLabel.isHidden = false
        self.warningLabel.textColor = UIColor.red
    }
    
    func userSuccesfullyLoggedIn() {
        self.warningLabel.isHidden = false
        self.warningLabel.textColor = UIColor.green
        self.warningLabel.text = "User Logged in"
    }
    
    
}

