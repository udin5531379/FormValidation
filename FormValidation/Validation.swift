//
//  Validation.swift
//  FormValidation
//
//  Created by Udin Rajkarnikar on 2/15/21.
//

import Foundation

class Validation{
    var email: String = ""
    var password: String = ""
    var retypePassword: String = ""
    var currentDate: Int = 0
    
    func doesPasswordMatch() -> Bool{
        return password == retypePassword
    }
    
    func isEmaiValid() -> Bool{
        let emailValidity = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailValidity.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool{
        let passwordValidity = NSPredicate(format: "SELF MATCHES %@", "(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,15})$")
        return passwordValidity.evaluate(with: password)
    }
    
//    func isUserOfSuitableAge() -> Bool {
//        
//    }
}
