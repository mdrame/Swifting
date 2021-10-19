//
//  ViewController.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/14/21.
//

import UIKit
import AVFoundation
import Foundation

class OnboardingViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       subviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        video_player()
    }
    
    func subviews() {
//        logoView()
        cryptonLabel()
        aboutCryptonLabel()
        start_button_parent_view()
        start_button()
    }
    // video logo
    func video_player() {
        guard let url = URL(string: "crypton.mov") else {
            print("Video not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "crypton", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: view.frame.size.width / 2 - 90, y: 120, width: view.frame.size.width / 2, height: view.frame.size.width / 2)
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        player.isMuted = true
        player.play()
    }
    
    func logoView() {
        var logo_image_view = UIImageView()
        view.addSubview(logo_image_view)
        logo_image_view.translatesAutoresizingMaskIntoConstraints = false
        logo_image_view.image = UIImage(named: "crypton.png")
        logo_image_view.adjustsImageSizeForAccessibilityContentSizeCategory = true
        logo_image_view.contentMode = .scaleAspectFit
        // constrant
        logo_image_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logo_image_view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        logo_image_view.widthAnchor.constraint(equalToConstant: 400).isActive = true
        logo_image_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func cryptonLabel()->UILabel {
        let cryptonLabel = UILabel()
        view.addSubview(cryptonLabel)
        cryptonLabel.text = "C R Y P T O N"
        cryptonLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptonLabel.font = UIFont(name: "Arial", size: 50)
        cryptonLabel.adjustsFontForContentSizeCategory = true
        cryptonLabel.numberOfLines =  100
        cryptonLabel.textAlignment = .center
        cryptonLabel.adjustsFontSizeToFitWidth = true
        cryptonLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cryptonLabel.font = UIFont.boldSystemFont(ofSize: 55)
        // constrant
        cryptonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cryptonLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cryptonLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        return cryptonLabel
    }
    
    func aboutCryptonLabel() {
        let aboutTittle = UILabel()
        view.addSubview(aboutTittle)
        aboutTittle.text = "ONE STOP SHOP"
        aboutTittle.translatesAutoresizingMaskIntoConstraints = false
        aboutTittle.font = UIFont(name: "Arial", size: 25)
        aboutTittle.adjustsFontForContentSizeCategory = true
        aboutTittle.numberOfLines =  100
        aboutTittle.textAlignment = .center
        aboutTittle.adjustsFontSizeToFitWidth = true
        aboutTittle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // constrant
        aboutTittle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutTittle.topAnchor.constraint(equalTo: cryptonLabel().bottomAnchor, constant: 15).isActive = true
        aboutTittle.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
    func start_button_parent_view() {
        let layout = UIView()
        view.addSubview(layout)
        layout.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layout.layer.cornerRadius = 10
        layout.layer.borderWidth = 2
        layout.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.2895976027)
        layout.translatesAutoresizingMaskIntoConstraints = false
        // Constraints
        layout.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        layout.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        layout.heightAnchor.constraint(equalToConstant: 90).isActive = true
        layout.widthAnchor.constraint(equalToConstant: view.frame.size.width - 30).isActive = true
        
        
    }
    
    func start_button() {
        let start_button = UIButton()
        view.addSubview(start_button)
        start_button.setTitle("> SWIP TO START >", for: .normal)
        start_button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        start_button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        start_button.translatesAutoresizingMaskIntoConstraints = false
        start_button.isUserInteractionEnabled = true
        start_button.layer.cornerRadius = 10
        start_button.flash()
//        start_button.addTarget(self, action: #selector(start_button_swipe), for: .touchUpInside)
        add_swipe_gesture(view: start_button)
        // constrant
        start_button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90).isActive = true
        start_button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        start_button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2 - 30).isActive = true
        start_button.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    }
    
    func add_swipe_gesture(view: UIButton) {
        let swip_gesture = UISwipeGestureRecognizer(target: self, action: #selector((handle_swipe(sender:))))
        swip_gesture.direction = .right
//        swip_gesture.numberOfTouchesRequired =  1
        
        view.addGestureRecognizer(swip_gesture)
    }
    
    @objc func handle_swipe(sender: UISwipeGestureRecognizer) {
        let fileView = sender.view!
        switch sender.state {
        case .ended:
            // perform segue & resent button x
            print("Perfor segue to Home ViewController")
            UIView.animate(withDuration: 0.2) {
                fileView.transform = CGAffineTransform(translationX: 180, y: 0)
            }
           
        default:
            print("Pls swift left")
        }
        
    }
    
//    @objc func start_button_swipe() {
//        print("Button Swipe")
//    }
    
   
    

}

