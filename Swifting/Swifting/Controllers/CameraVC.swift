//
//  CameraVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 6/9/22.
//

import UIKit
import Foundation

class CameraVC: UIViewController,  URLSessionDownloadDelegate {
    
    
    // Instances
    let webServer = Networking()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uploadVideo)
        print("Camera ViewController loaded")
        view.addSubview(spinner)
        view.addSubview(taskLabelLabel)
        view.addSubview(uploadTaskLabel)
        
        // Do any additional setup after loading the view.
    }
    lazy var spinner : UIActivityIndicatorView = {
        let spinner =  UIActivityIndicatorView(frame: CGRect(x: 200, y: 200, width: 30, height: 40))
        //        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.style = .large
        return spinner
    }()
    
    func spinnerConstraint() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    let taskLabelLabel: UILabel = {
        let taskLabelLabel = UILabel(frame: CGRect(x: 30, y: 300, width: 360, height: 150))
        taskLabelLabel.text = "Upload in progress... Come back when completed."
        taskLabelLabel.isHidden = true
        taskLabelLabel.numberOfLines = 5
        //        taskLabelLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabelLabel
    }()
    
    let uploadTaskLabel: UILabel = {
        let taskLabelLabel = UILabel(frame: CGRect(x: 207, y: 430, width: 100, height: 50))
        taskLabelLabel.text = "0 %"
        taskLabelLabel.textAlignment = .center
        taskLabelLabel.isHidden = true
        taskLabelLabel.numberOfLines = 5
        taskLabelLabel.backgroundColor = .white
        taskLabelLabel.layer.cornerRadius = 4
        taskLabelLabel.layer.borderWidth = 2
        taskLabelLabel.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //        taskLabelLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabelLabel
    }()
    
    lazy var uploadVideo: UIButton = {
        let uploadVideo = UIButton(frame: CGRect(x: view.frame.size.width/2 - 120.000, y: 600, width: 200, height: 100))
        //        uploadVideo.translatesAutoresizingMaskIntoConstraints = false
        uploadVideo.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        //        uploadVideo.addTarget(self, action: #selector(uploadVieoAction(self.uploadVideo)), for: .touchUpInside)
        uploadVideo.layer.cornerRadius = 10
        uploadVideo.layer.borderWidth = 7
        uploadVideo.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        uploadVideo.layer.shadowRadius = 4
        uploadVideo.setTitle("P O S T", for: .normal)
        uploadVideo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        uploadVideo.titleLabel?.font =  UIFont(name: "Arial", size: 35)
        uploadVideo.setTitleColor(.white, for: .normal)
        uploadVideo.addTarget(self, action: #selector(benpress),for: .touchUpInside)
        return uploadVideo
    }()
    
    @objc func benpress()
    {
        uploadVideo.backgroundColor = #colorLiteral(red: 0.006399281323, green: 0.3014996052, blue: 0.4349797368, alpha: 1)
        spinner.startAnimating()
        print("Start spinner")
        taskLabelLabel.isHidden = false
        uploadTaskLabel.isHidden = false
        print("posting video")
        uploadVideo.isUserInteractionEnabled = false
        // Send this to background thread
        DispatchQueue.global().async {
//            sleep(3)  // change code to asyncAfter 📌
            let configuration = URLSessionConfiguration.default
            let operationQueue = OperationQueue()
            let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
            
            let downloadTask = session.downloadTask(with: URL(string: "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg")!)
            downloadTask.resume()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            let percentDownloaded = totalBytesWritten / totalBytesExpectedToWrite
            print(percentDownloaded)
            // update the percentage label
            
            print("Session progress")
            self.uploadTaskLabel.isHidden = false
            self.uploadTaskLabel.text = "\(percentDownloaded * 100) %"
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Video POSTED SUCCESFULLY 🎉")
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.taskLabelLabel.text = "Video Posted Successsfully 🎉"
            
            // Create pop up.
            let alertController = UIAlertController(title: "Video Posted ✅",
                                                    message: "Go to video",
                                                    preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default) { goToDestination in
                // perorm segue to destination
                print("Go to destination")
                let vc = CameraVC()
                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: false, completion: nil)
//               let destinationvc =  self.navigationController?.viewControllers[1]
//                self.present(destinationvc!, animated: false, completion: nil)
//
            }
            alertController.addAction(ok)
            alertController.addAction(UIAlertAction(title: "CANCEL", style: .cancel))
            self.present(alertController, animated: false, completion: nil)

            
        }
        
    }
    
    
}



