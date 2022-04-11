//
//  MainNavigationController.swift
//  Swifting
//
//  Created by Mohammed Drame on 4/7/22.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        if isLoggedIn() {
            print("User is loged in")
            viewControllers = [DashBoardVC()]
        } else {
            print("First timmer: send to unboarding")
            perform(#selector(showOnboardingVC), with: nil, afterDelay: 0.00)
        }

    }
    
    fileprivate func isLoggedIn()->Bool {
        return true
    }
    
   @objc func showOnboardingVC () {
        let onboardingController = OnboardingViewController()
       onboardingController.modalPresentationStyle = .fullScreen
        present(onboardingController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
