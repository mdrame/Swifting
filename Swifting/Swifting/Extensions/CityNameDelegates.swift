//
//  CityNameDelegates.swift
//  Swifting
//
//  Created by Mohammed Drame on 11/26/21.
//

import Foundation
import UIKit

extension ATMsViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Fetch atm for city name in textfield")
        getAtms()
        cityName.resignFirstResponder()
        return true
    }
    
    
    
}
