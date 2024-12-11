//
//  Reset_ViewModel.swift
//  Multivender
//
//  Created by TeamX Pakistan on 02/10/2022.
//


import Combine
import Foundation
import SwiftUI
//import AlertToast

class Reset_ViewModel: ObservableObject{
     @Published var isLoading = false;
     ///

    @ObservedObject var ResetPostString = ResetReq();
     //@Published var loggedIn:Bool = false;

     @Published  var login_toast = false
     @Published  var login_toast_message = ""
   @Published var login_pressed = false

     @Published  var toast = false
     @Published  var toast_message = ""

     @Published var response = [ResetPasswordResponse]()
    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
   // @Published var isDashboardViewPresented: Bool = false
    @Published var rsp = ""
    @Published var shouldHideResponse = false
    @Published var pushToLoginView : Bool = false
    func Reset(email: String,token: String,reset_new_password: String,reset_confirm_password: String)
     {

         if (reset_new_password == reset_confirm_password){
            // let postString = "email="+email+"&token="+token+"&password="+password;
             let postString: [String: String] = ["email": email, "token": token , "password": reset_new_password]
             let loginRequest = Request();
             loginRequest.post(urlString:Constants.ResetPassword ,parameterString: postString)
             {

                 (string) in


                 do {
                     let data = string.data(using: .utf8)!

                     do {
                         if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {

                             let success = json["success"] as? Bool;
                             let statusCode = json["statusCode"] as? Int ;
                              let message = json["message"] as? String;
                             if (statusCode == 400){

                                       var error_msg = message!;
                                 
                                 DispatchQueue.main.async {
                                     self.login_toast_message = error_msg;
                                     self.login_toast = true
                                     
                                 }


                             }
//                             else{
//
//                                 self.pushToLoginView = true
//                                 var error_msg = message!;
//                                 self.login_toast_message = error_msg;
//                                 self.login_toast = true
//
//                             }


                             else{
                                 let myServiceResponse = try? JSONDecoder().decode(ResetPasswordResponse.self, from: data)

                                DispatchQueue.main.async {
                                    self.pushToLoginView = ((myServiceResponse?.success) != nil)

                                   }


                             }




                                   }

                                         }
                      catch let error {
                           print(error)





                                         }

                                     }

                                 }


         }
         else{

             
             DispatchQueue.main.async {
                 self.login_toast_message = "New Password and Confirm Password Must be Match!";
                 self.login_toast = true
                 
             }

         }


//         let check = self.checkValidation(name:name,email:email,contact:contact,password:password,isAgreementSigned:isAgreementSigned)




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
