//
//  AlamofireViewController.swift
//  ChatChatChat
//
//  Created by admin on 10/16/18.
//  Copyright © 2018 admin.dinhtu. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class AlamofireViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage("https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")
        indicatorActivity.hidesWhenStopped = true
        // Do any additional setup after loading the view.
    }
    // MARK: - actions
    @IBAction func onDownload(_ sender: Any) {
        downloadFilePDF("https://developer.apple.com/programs/terms/apple_developer_agreement.pdf")
    }
    
    @IBAction func onView(_ sender: Any) {
        
    }
    // MARK: - functions
    func downloadImage(_ urlImage: String) {
        Alamofire.request(urlImage).downloadProgress(closure: { (progress) in
            print(progress.fractionCompleted)
            self.indicatorActivity.startAnimating()
        }).responseData { (response) in
            print(response.result)
            print(response.result.value)
            if let data = response.value {
                self.imageView.image = UIImage(data: data)
                self.indicatorActivity.stopAnimating()

            }
        }
    }
    
    func downloadFilePDF(_ url: String) {
        //--2.--//
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.annularDeterminate
        hud.label.text = "Loading..."
        //--2.--//
        
        //--1.--//
        
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL:NSURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
            print("***documentURL: ",documentsURL)
            let fileURL = documentsURL.appendingPathComponent("\(1).pdf")
            print("***fileURL: ",fileURL ?? "")
            return (fileURL!,[.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(url, to: destination).downloadProgress(closure: { (prog) in
            hud.progress = Float(prog.fractionCompleted)
        }).response { response in
            //print(response)
            hud.hide(animated: true)
            if response.error == nil, let filePath = response.destinationURL?.path {
                print("FILE PATH: ",filePath)
//                self.fileLocalURLDict[0] = filePath
            }
        }
        //--1.--//
        
    }

   
}
