//
//  Validation.swift
//  FormValidation
//
//  Created by Udin Rajkarnikar on 2/15/21.
//

import Foundation

class Validation: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var retypePassword: String = ""
    @Published var chosenDate: Int = 0
    
    func doesPasswordMatch() -> Bool{
        return password == retypePassword
    }
    
    func isEmaiValid() -> Bool{
        let emailValidity = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailValidity.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool{
        let passwordValidity = NSPredicate(format: "SELF MATCHES %@", "^.{4,8}$")
        return passwordValidity.evaluate(with: password)
    }
    
    func isUserOfSuitableAge() -> Bool {
        if ((Calendar.current.component(.year, from: Date())) - chosenDate) >= 18 {
            return true
        } else {
            return false
        }
    }
    
    //String according to validations
    
    func validEmail() -> String {
        if isEmaiValid() {
            return ""
        } else {
            return "Email is not valid"
        }
    }
    
    func  validPassword() -> String {
        if isPasswordValid(){
            return ""
        } else {
            return "Password not valid"
        }
    }
    
    func doesPasswordMatchString() -> String {
        if doesPasswordMatch(){
            return ""
        } else {
            return "Password does not match"
        }
     }
    
    
}
