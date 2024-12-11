////
////  SignupViewModel.swift
////  SwufitUI Validation and MVVM
////
////  Created by Stewart Lynch on 2020-05-09.
////  Copyright © 2020 CreaTECH Solutions. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//class SignInValidation: ObservableObject {
//
//    @ObservedObject var LoginPostString = LoginRequest();
//    @Published var pushToForgotPasswordView: Bool = false
//  
//    
//    @Published var pushToSignUpView: Bool = false
//    // MARK: - Validation Functions
//    
//    @Published var match = "Email and Password Match"
//    @Published var Notmatch = "Invalid Credentials"
//    
//    func isPasswordValid() -> Bool {
//        // criteria in regex.  See http://regexlib.com
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
//                                       "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
//        return passwordTest.evaluate(with: LoginPostString.password)
//    }
//    
//    func isEmailValid() -> Bool {
//        // criteria in regex.  See http://regexlib.com
//        let emailTest = NSPredicate(format: "SELF MATCHES %@",
//                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
//        return emailTest.evaluate(with: LoginPostString.email)
//    }
//    
// 
//    
//    var isSignInComplete: Bool {
//        if !isPasswordValid() ||
//        !isEmailValid() {
//            return false
//        }
//        return true
//    }
//    
//    // MARK: - Validation Prompt Strings
//    
//    
//    var emailPrompt: String {
//        if isEmailValid() {
//            return ""
//        } else {
//            return "Enter a valid email address"
//        }
//    }
//    
//    var passwordPrompt: String {
//        if isPasswordValid() {
//            return ""
//        } else {
//            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
//        }
//    }
//    
//  
//    
//        var EmailAndPassword: Bool{
//           
//            if isEmailValid() && isPasswordValid(){
//    
//                return true
//            }
//            else{
//    
//                return false
//    
//            }
//    
//    
//        }
//    
//    func signIn() {
//        // perform signin functions then clear fields
//        LoginPostString.email = ""
//        LoginPostString.password = ""
//        
//       
//    }
//}
