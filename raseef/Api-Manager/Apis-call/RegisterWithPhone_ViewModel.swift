//
//  RegisterWithPhone_ViewModel.swift
//  Multivender
//
//  Created by Teamx tec on 30/09/2022.
//



import Combine
import Foundation
import SwiftUI
import ValidationComponents

class RegisterWithPhone_ViewModel: ObservableObject{
     @Published var isLoading = false;
     ///
   
    @ObservedObject var registerPostString = RegisterPhoneRequest();
     //@Published var loggedIn:Bool = false;
     
     @Published  var login_toast = false
     @Published  var login_toast_message = ""
   @Published var login_pressed = false
    
     @Published  var toast = false
     @Published  var toast_message = ""

     @Published var response = [RegisterphoneResponse]()
    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
   // @Published var isDashboardViewPresented: Bool = false
    @Published var rsp = ""
    @Published var shouldHideResponse = false
    @Published var PushToOtpView = false
    @Published var PushToLoginView = false
    @Published var ReuqestFromRegistrationViewModel = false

    func isValidPhone(contact: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: contact)
        }
    func isValidEmail(email: String) -> Bool {
      
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
    }
    func RegisterWithPhone(name: String,email: String,contact: String,password: String)
     {
         
         let pred = EmailValidationPredicate()
         let valid_email = pred.evaluate(with: email)
         //print(valid_email)
         
       //  let escapedText = someText.replacingOccurrences(of: "\n", with: "\\n")
//         let check = self.checkValidation(name:name,email:email,contact:contact,password:password,isAgreementSigned:isAgreementSigned)
        // let postString = "name="+name+"&contact="+"9232189326262"+"&password="+password+"&permission="+"customer";
         
         let postString: [String: String] ;
         if ((isValidEmail(email: email) == true))
         {
             postString = ["name": name,"contact":contact,"email":email,"password" :password]
             let loginRequest = Request();
             loginRequest.post(urlString:Constants.RegisterWithPhone ,parameterString: postString)
             {
              
                 (string) in
                
                 
                 do {
                     let data = string.data(using: .utf8)!
                   
                     do {
                        //let reg_email =  UserDefaults.standard.set(email,forKey: "email");
                         if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                             
                             let statusCode = json["statusCode"] as? Int ;
                             
                             let error = json["error"] as? String;
                             if (statusCode == 400){
                                
                                 if (error == "Bad Request"){
                                     let message = json["message"] as? [String];
                                     if message?.count == 1{
                                         
                                         let error_msg = message![0];
                                          self.login_toast_message = error_msg;
                                          self.login_toast = true
                                     }
                                     else if message?.count == 2{
                                         
                                         let error_msg = message![0]+"\n"+message![1];
                                          self.login_toast_message = error_msg;
                                          self.login_toast = true
                                     }
                                     else{
                                         let error_msg = message![0]+"\n"+message![1]+"\n"+message![2];
                                          self.login_toast_message = error_msg;
                                          self.login_toast = true
                                         
                                     }
                                 }
                                 else{
                                     let message = json["message"] as? String;
                                     let error_msg = message!;
                                     self.login_toast_message = error_msg;
                                     self.login_toast = true
                                    
                                 }
    //                             self.login_toast_message = message!;
    //                             self.login_toast = true
                              }
                             else{
                                 let myServiceResponse = try? JSONDecoder().decode(RegisterphoneResponse.self, from: data)
                               
                                DispatchQueue.main.async {
                                    let success  = myServiceResponse?.success
                                    let otp_id = myServiceResponse?.id
                                   
                                    let phone_number = myServiceResponse?.phoneNumber
                                    
                                    let s_id = myServiceResponse?.twilio.sid
                                    
                                    
                                   // self.ReuqestFromRegistrationViewModel = true
                                    UserDefaults.standard.set(otp_id, forKey: "otp_id")
                                    UserDefaults.standard.set(s_id,forKey: "s_id")
                                    UserDefaults.standard.set(phone_number, forKey: "phone_number")
                                  //  UserDefaults.standard.set(self.ReuqestFromRegistrationViewModel, forKey: "ReuqestFromRegistrationViewModel")
                                    UserDefaults.standard.set(success, forKey: "ReuqestFromRegistration")
                                    
                                    self.PushToOtpView = true
                                    
                                   }
                               
                                 
                             }  }}
                      catch let error {
                           print(error)
                                             
                                         
                                            
                                             
                                             
                                         }
                                         
                                     }
                                     
                                 }
                       
         }
         else if (contact == "" || email == "" || password == "")
         {
             
             self.login_toast_message = "No Fields can't be empty!"
             self.login_toast = true
             
         }
         else{
        
             self.login_toast_message = "Email pattern must be correct!"
             self.login_toast = true
         }
         
         
         
               
                             
                             
                 
                         }
                     
                     
                 
                 
          
                 
                 
             

//    func checkValidation(name:String,email:String,contact:String,password:String,isAgreementSigned:Bool) -> String? {
//     //print(registerPostString.$name)
//    if name.isEmpty {
//       // focusedField = .firstName
//        self.shouldHideResponse = true
//        rsp = "Please provide first name."
//        return rsp
//    }
////    if name.count < 3 {
////       // focusedField = .firstName
////        self.shouldHideResponse = true
////        rsp = "First name should be atleast 3 characters long."
////        return rsp
////    }
//    if name.count > 25 {
//       // focusedField = .firstName
//        self.shouldHideResponse = true
//         rsp = "First name cannot be more than 25 characters long."
//        return rsp
//    }
//
//    if email.isEmpty {
//       // focusedField = .emailAddress
//        self.shouldHideResponse = true
//         rsp = "Please provide email."
//        return rsp
//    }
////    if !NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: email) {
////        //focusedField = .emailAddress
////        rsp = "Please provide a valid email."
////        self.shouldHideResponse = true
////        return rsp
////    }
//    if contact.isEmpty {
//        //focusedField = .mobileNumber
//        rsp =  "Please provide phone number."
//        self.shouldHideResponse = true
//        return rsp
//    }
////         if contact.starts(with: "+")
////         {
////
////              let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
////
////             // let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
////              let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
////              let ans = String(phoneTest.evaluate(with: contact))
////              rsp = "true"
////              self.shouldHideResponse = true
////              return rsp
////         }
////    if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn:contact)) {
////        //focusedField = .mobileNumber
////         rsp = "Invalid phone format\nFormat: +[country code][number]\neg: +923122459266"
////        self.shouldHideResponse = true
////        return rsp
////    }
//
////    let flagPhoneNumberTextField = FPNTextField()
////    if (flagPhoneNumberTextField.getValidNumber(phoneNumber: mobileNumber) == nil) {
////
////        focusedField = .mobileNumber
////        return "Please provide valid phone number."
////    }
//    if password.isEmpty {
//       // focusedField = .password
//         rsp = "Password field cannot be empty."
//        self.shouldHideResponse = true
//        return rsp
//    }
////    if password.count < 8 {
////       // focusedField = .password
////        rsp = "Password should be atleast 8 characters long."
////        self.shouldHideResponse = true
////        return rsp
////    }
//    if password.count > 100 {
//       //focusedField = .password
//        rsp = "Password cannot be more than 100 characters long."
//        self.shouldHideResponse = true
//        return rsp
//    }
//    if !isAgreementSigned {
//      //  focusedField = nil
//        rsp = "Please agree to Terms & Condition and Privacy Policy to proceed."
//        self.shouldHideResponse = true
//        return rsp
//    }
//
//    return nil
//}
}
