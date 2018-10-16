//
//  PostViewController.swift
//  ChatChatChat
//
//  Created by admin on 10/15/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    // MARK: - Outlet and variable
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var label: UILabel!
    fileprivate let firstPresenter = FirstPresenter(postService: GetPostService())
    fileprivate var postsToDisplay = [ViewData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstPresenter.attachView(self)
        firstPresenter.getData()
        activityIndicator?.hidesWhenStopped = true
        
        self.tableview.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: PostTableViewCell = tableview.dequeueReusableCell(withIdentifier: idenfier, for: indexPath)
            as? PostTableViewCell else {
                return UITableViewCell()
        }
        let listIndex = postsToDisplay[indexPath.row]
        cell.postLabel.text = "\(listIndex.id)"
        return cell
    }
    
    
}
extension PostViewController: PostView {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
    }
    
    func setPosts(_ posts: [ViewData]) {
        postsToDisplay = posts
        self.label.text = postsToDisplay[0].body
        self.tableview.reloadData()
    }
    
    func setEmptyPosts() {
        print("empty posts")
        self.tableview.reloadData()
    }
    
    
}
