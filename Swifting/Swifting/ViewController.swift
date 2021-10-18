//
//  ViewController.swift
//  Swifting
//
//  Created by Mohammed Drame on 10/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       subviews()
    }
    
    func subviews() {
        logoView()
        aboutCryptonLabel()
        start_button_guester()
    }
    
    func logoView() {
        var logo_image_view = UIImageView()
        view.addSubview(logo_image_view)
        logo_image_view.translatesAutoresizingMaskIntoConstraints = false
        logo_image_view.image = UIImage(named: "logocopy.png")
        logo_image_view.adjustsImageSizeForAccessibilityContentSizeCategory = true
        logo_image_view.contentMode = .scaleAspectFit
        // constrant
        logo_image_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logo_image_view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        logo_image_view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logo_image_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func aboutCryptonLabel() {
        let aboutTittle = UILabel()
        view.addSubview(aboutTittle)
        aboutTittle.text = " Crypton is a one stop market place for all crypto related stuff."
        aboutTittle.translatesAutoresizingMaskIntoConstraints = false
        aboutTittle.font = UIFont(name: "Arial", size: 25)
        aboutTittle.adjustsFontForContentSizeCategory = true
        aboutTittle.numberOfLines =  100
        aboutTittle.textAlignment = .natural
        aboutTittle.adjustsFontSizeToFitWidth = true
        // constrant
        aboutTittle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutTittle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        aboutTittle.widthAnchor.constraint(equalToConstant: view.frame.size.width - 50).isActive = true
    }
    
    func start_button_guester() {
        var start_button = UIButton()
        view.addSubview(start_button)
        start_button.setTitle("SWIP TO START", for: .normal)
        start_button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        start_button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        start_button.translatesAutoresizingMaskIntoConstraints = false
        // constrant
        start_button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        start_button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        start_button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2).isActive = true
        start_button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
   
    

}

