////
////  OtpViewModel.swift
////  Multivender
////
////  Created by Teamx tec on 03/10/2022.
////
//
//import Foundation
//
////private func checkValidation() -> String? {
////
////    if verificationCode.isEmpty {
////        return "OTP required."
////    }
////    else if verificationCode.count < 6 {
////        return "Please provide all 6 OTP digits."
////    }
////    return nil
////}
////
////func limitText(_ upper: Int) {
////    if verificationCode.count > upper {
////        verificationCode = String(verificationCode.prefix(upper))
////    }
////}
////
////func getPin(at index: Int) -> String {
////    guard self.verificationCode.count > index else {
////        return ""
////    }
////    return self.verificationCode[index]
////}
////
////  ForgetViewModel.swift
////  Multivender
////
////  Created by Teamx tec on 29/09/2022.
////
//
//import SwiftUI
//
//import Combine
//import Foundation
//import SwiftUI
////import AlertToast
//
////extension Int {
////
////    var numberString: String {
////
////        guard self < 10 else { return "0" }
////
////        return String(self)
////    }
////}
////extension String {
////
////    var digits: [Int] {
////        var result = [Int]()
////
////        for char in self {
////            if let number = Int(String(char)) {
////                result.append(number)
////            }
////        }
////
////        return result
////    }
////
////}
//class OtpViewModel: ObservableObject{
//     @Published var isLoading = false;
//     ///
//   
//    
//     //@Published var loggedIn:Bool = false;
//    @Published var resendCodeCounter = 30
//    @Published var resendCodeTimer = Timer()
//     @Published  var login_toast = false
//     @Published  var login_toast_message = ""
//   @Published var login_pressed = false
//    
//     @Published  var toast = false
//     @Published  var toast_message = ""
//
//    
//    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
//    @Published var isDashboardViewPresented: Bool = false
//    
//    @Published var PushToResetView : Bool = false
//    @Published var PushToLoginView : Bool = false
//    @Published var PushToNewView : Bool = false
//    @ObservedObject var otpPostString = VerifyotpRequest()
//
//    var ReuqestFromRegistration : Bool?
//    
// 
//    func VeryOtp(token:String)
//     {
//
//       
//         
//         self.ReuqestFromRegistration = UserDefaults.standard.bool(forKey: "ReuqestFromRegistration");
//         var postString:[String:String] = [:];
//         var posturl = "";
//         let loginRequest = Request();
//         if (ReuqestFromRegistration == true)
//         {
//
//         
//          
//           
//             /////REGISTER VIEW MODEL
//             let otp_id : String? = UserDefaults.standard.string(forKey: "otp_id");
//             let s_id : String? = UserDefaults.standard.string(forKey: "s_id");
//             let phone_number: String? =  UserDefaults.standard.string(forKey: "phone_number");
//            
//             postString = ["otp_id":otp_id!,"code":token,"phone_number":phone_number!,"sid":s_id!];
//         posturl = Constants.VerifyPhoneRegistration;
//             
//             loginRequest.post(urlString:posturl,parameterString: postString)
//             {
//
//                 (string) in
//
//
//                 do {
//                     let data = string.data(using: .utf8)!
//
//                     do {
//                         if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//
//                             let statusCode = json["statusCode"] as? Int ;
//
//                             if (statusCode == 400){
//
//    //
//
//                                 let message = json["message"] as? String;
//
//                                 self.login_toast_message = message!;
//                                 self.login_toast = true
//                        
//                             }
//                             else{
//                                 DispatchQueue.main.async {
//              
//                                     self.PushToLoginView = true
//                                    }
//
//
//                             }
//
//
//
//
//                                   }
//
//                                         }
//                      catch let error {
//                           print(error)
//
//
//
//
//
//                                         }
//
//                                     }
//
//                                 }
//             
//     }
//    else{
//        
//     
//        let forget_email : String? = UserDefaults.standard.string(forKey: "forgetEmail")
//     
//        print(forget_email ?? "No Forget Email")
//        postString = ["email": forget_email!,"token":token]
//        posturl = Constants.VerifyForgetPassword;
//        loginRequest.post(urlString:posturl,parameterString: postString)
//        {
//
//            (string) in
//
//
//            do {
//                let data = string.data(using: .utf8)!
//
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                        //self.PushToNewView.toggle()
//                       // print(self.PushToNewView)
////                        let success = json["success"] as? Bool ;
////
////                        if (success == true){
////
//////                             let myServiceResponse = try? JSONDecoder().decode(OtpForgetPasswordReq.self, from: data)
////
////                           DispatchQueue.main.async {
////
////                               self.PushToResetView = true
////                              }
////
////                        }
////                        else{
////
////                            let message = json["message"] as? String;
////
////                            self.login_toast_message = message!;
////                            self.login_toast = true
////
////                        }
//
//                        let statusCode = json["statusCode"] as? Int ;
//
//                        if (statusCode == 400){
//
////
//
//                            let message = json["message"] as? String;
//                            DispatchQueue.main.async {
//         
//                                self.login_toast_message = message!;
//                                self.login_toast = true
//                               }
//
//                          
//                   
//                        }
//                        else{
//                            DispatchQueue.main.async {
//         
//                                self.PushToResetView.toggle()
//                             //   self.PushToNewView.toggle()
//                               }
//
//
//                        }
//                        
//
//
//
//                              }
//
//                                    }
//                 catch let error {
//                      print(error)
//
//
//
//
//
//                                    }
//
//                                }
//
//                            }
//    }
//    
//    
//      
//         
//       
//         
//
//
//
//
//                         }
//                     }
//                     
//                 
//                 
//          
//                 
//                 
//             
//
