//
//  ValidateViewModel.swift
//  Columbus Digital
//
//  Created by carlos on 02/05/22.
//

import Foundation

class ValidateViewModel {
    var text : String = ""
    // MARK: - Validation Functions
    func isEmailValid(email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9ñÑ_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    func validatePhoneLength(phone : String) -> Bool {
        if phone.count != 10 {
            return false
        }
        else{
            return true
        }
    }
}
