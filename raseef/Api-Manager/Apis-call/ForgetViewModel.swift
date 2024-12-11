//
//  ForgetViewModel.swift
//  Multivender
//
//  Created by Teamx tec on 29/09/2022.
//

import SwiftUI

import Combine
import Foundation
import SwiftUI
//import AlertToast

class ForgetViewModel: ObservableObject{
     @Published var isLoading = false;
     ///
   
    
     //@Published var loggedIn:Bool = false;
     
     @Published  var login_toast = false
     @Published  var login_toast_message = ""
   @Published var login_pressed = false
    
     @Published  var toast = false
     @Published  var toast_message = ""
    @Published var responses = [ForgetResponse]()
    
    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
    @Published var isDashboardViewPresented: Bool = false
    
    @Published var PushToOtpView : Bool = false
    @Published var user_email = "";
    @Published var forget_token = "";
    @ObservedObject var otp_forget_PostString = OtpForgetPasswordReq()
    func forget(email: String)
     {
         
        // var user_id :String = ""
         
         
         //let postString = "user=DON&password=.45auto";
         // let postString = "email="+email;
         let postString: [String: String] = ["email": email]
         let forgetemail = email
         UserDefaults.standard.set(forgetemail, forKey: "forgetEmail")
         let loginRequest = Request();
         loginRequest.post(urlString:Constants.ForgetPassword ,parameterString: postString)
         {
              
             (string) in
            
             
             do {
                 let data = string.data(using: .utf8)!
               
                 do {
                     if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                         
                         let success = json["success"] as? Bool ;
                         
                         if (success == true){
                             
                             let myServiceResponse = try? JSONDecoder().decode(ForgetResponse.self, from: data)
                           
                             DispatchQueue.main.async { [self] in
//                                let token  = myServiceResponse?.token
//
//                                UserDefaults.standard.set(token, forKey: "forget_token")
                                 self.forget_token = myServiceResponse!.token
                                 
                                // self.user_email = myServiceResponse!.email
                                 
                                 self.otp_forget_PostString.email = myServiceResponse!.email
                                 UserDefaults.standard.set(otp_forget_PostString.email,forKey:"otp_forget_PostString.email")
                                 
                                 self.PushToOtpView = myServiceResponse!.success
                       
                                 
                                //self.PushToOtpView = true
                               }

                         }
                         else{
                             
                             let message = json["message"] as? String;
                             DispatchQueue.main.async { [self] in
                                 self.login_toast_message = message!;
                                 self.login_toast = true
                                 
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
                     }
                     
                 
                 
          
                 
                 
             

