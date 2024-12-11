//
//  Otp_VM.swift
//  raseef
//
//  Created by Teamx tec on 02/11/2022.
//



import Combine
import Foundation
import SwiftUI

class Otp_VM: ObservableObject{
     @Published var isLoading = false;
     ///
   
    
     //@Published var loggedIn:Bool = false;
   
     @Published  var login_toast = false
     @Published  var login_toast_message = ""
   @Published var login_pressed = false
    
     @Published  var toast = false
     @Published  var toast_message = ""

    
    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
    @Published var isDashboardViewPresented: Bool = false
    
    @Published var PushToResetView : Bool = false
    @Published var PushToLoginView : Bool = false
    @ObservedObject var otpPostString = VerifyotpRequest()
//    private func checkValidation() -> String? {
//
//        if otpPostString.code.isEmpty {
//            return "OTP required."
//        }
//        else if otpPostString.code.count < 6 {
//            return "Please provide all 6 OTP digits."
//        }
//        return nil
//    }
//
//    func limitText(_ upper: Int) {
//        if otpPostString.code.count > upper {
//            otpPostString.code = String(otpPostString.code.prefix(upper))
//        }
//    }
    
   // UserDefaults.standard.removeObject(forKey: "ReuqestFromRegistration")
    var ReuqestFromRegistration : Bool?
    
    func VerifyRegOtp(code:String)
    {
      
        var postString:[String:String] = [:];
        var posturl = "";
        let loginRequest = Request();
    
          
            /////REGISTER VIEW MODEL
            let otp_id : String? = UserDefaults.standard.string(forKey: "otp_id");
            let s_id : String? = UserDefaults.standard.string(forKey: "s_id");
            let phone_number: String? =  UserDefaults.standard.string(forKey: "phone_number");
           
            postString = ["otp_id":otp_id!,"code":code,"phone_number":phone_number!,"sid":s_id!];
        posturl = Constants.VerifyPhoneRegistration;
            
            loginRequest.post(urlString:posturl,parameterString: postString)
            {

                (string) in


                do {
                    let data = string.data(using: .utf8)!

                    do {
                        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {

                            let statusCode = json["statusCode"] as? Int ;

                            if (statusCode == 400){

   //                             let myServiceResponse = try? JSONDecoder().decode(OtpForgetPasswordReq.self, from: data)

                                let message = json["message"] as? String;
                                DispatchQueue.main.async {
             
                                    self.login_toast_message = message!;
                                    self.login_toast = true
                                   
                                   }
                                
                       
                            }
                            else{
                             //   let myServiceResponse = try? JSONDecoder().decode(OtpSignupResponse.self, from: data)
                                DispatchQueue.main.async {
             
                                    self.PushToLoginView = true
                                   
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
    func VerifyForgetOtp(token:String)
     {
         var postString:[String:String] = [:];
         var posturl = "";
         let loginRequest = Request();

        let forget_email: String? = UserDefaults.standard.string(forKey: "otp_forget_PostString.email");
 
        postString = ["email": forget_email!,"token":token]
        posturl = Constants.VerifyForgetPassword;
        loginRequest.post(urlString:posturl,parameterString: postString)
        {

            (string) in


            do {
                let data = string.data(using: .utf8)!

                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {

                        let success = json["success"] as? Bool ;

                        if (success == true){

                          //  let myServiceResponse = try? JSONDecoder().decode(OtpForgetPasswordRes.self, from: data)

                           DispatchQueue.main.async {
        
                               self.PushToResetView = true
                              }

                        }
                        else{

                            let message = json["message"] as? String;

                            self.login_toast_message = message!;
                            self.login_toast = true

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
                     
                 
                 
          
                 
                 
             

