//
//  CryptonLabelAnimation.swift
//  Swifting
//
//  Created by Mohammed Drame on 3/19/22.
//

import Foundation
import UIKit



extension UILabel {
    
    func animate(newText: String, characterDelay: TimeInterval) {
           DispatchQueue.main.async {
               self.text = ""

               for (index, character) in newText.enumerated() {
                   DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                       self.text?.append(character)
                   }
               }
           }
       }
}
