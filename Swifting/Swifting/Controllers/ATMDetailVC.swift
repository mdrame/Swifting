//
//  ATMDetailVC.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/27/21.
//

import UIKit

class ATMDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        atmDetailsWrapView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        dismissDetail()
        subViewLayouts()
    }
    /// Ths func adds subviews to main view
    ///
    private func subViewLayouts() {
        view.addSubview(infoStackView)
        infoStackViewConstraint()
        
        infoStackView.addSubview(businessName)
    }
    
    // MARK: UIKit Stuff
    @IBOutlet weak var atmDetailsWrapView: UIView!
    
    func dismissDetail() {
        let tapView = UITapGestureRecognizer(target: self, action: #selector(dismissAtmDetailView))
        view.addGestureRecognizer(tapView)
    }
    
    @objc func dismissAtmDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var infoStackView: UIStackView = {
        let converterSubViewsStackViews = UIStackView()
        converterSubViewsStackViews.translatesAutoresizingMaskIntoConstraints = false
        converterSubViewsStackViews.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        converterSubViewsStackViews.axis  = NSLayoutConstraint.Axis.vertical
        converterSubViewsStackViews.distribution  = UIStackView.Distribution.equalSpacing
        converterSubViewsStackViews.alignment = UIStackView.Alignment.center
        converterSubViewsStackViews.spacing   = 16.0
        return converterSubViewsStackViews
    }()
    
   private func infoStackViewConstraint() {
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: atmDetailsWrapView.safeAreaLayoutGuide.topAnchor, constant: 10),
            infoStackView.leadingAnchor.constraint(equalTo: atmDetailsWrapView.leadingAnchor, constant: 5),
//            converterSubViewsStackViews.heightAnchor.constraint(equalToConstant: view.frame.self.height - 10),
//            converterSubViewsStackViews.widthAnchor.constraint(equalToConstant: view.frame.size.width - 10),
            infoStackView.trailingAnchor.constraint(equalTo: atmDetailsWrapView.trailingAnchor, constant: -5),
            infoStackView.bottomAnchor.constraint(equalTo: atmDetailsWrapView.bottomAnchor, constant:  -5)
        ])
    }
    
    let businessName: UILabel = {
        let businessName = UILabel()
        businessName.text = "Crypto World"
        businessName.translatesAutoresizingMaskIntoConstraints = false
        businessName.backgroundColor = UIColor.green
//        NSLayoutConstraint.activate([
//            tas
//        ])
        return businessName
    }()
    
    private func businessNameConstraint() {
        NSLayoutConstraint.activate([
            businessName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            businessName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
//            converterSubViewsStackViews.heightAnchor.constraint(equalToConstant: view.frame.self.height - 10),
//            converterSubViewsStackViews.widthAnchor.constraint(equalToConstant: view.frame.size.width - 10),
            businessName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
    
    
    
   
   
    // Business Name
    // -------------------
    // Address
    // -------------------
    // ATM Details - Label
    // -------------------
    // Operator, website, phone, email, manufacturer
    // -------------------
    // Additional info
    // Trading coins - UIImage // in a stack view
    // get directiion button
    
  

}
