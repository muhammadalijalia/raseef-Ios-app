import Combine
import Foundation
import SwiftUI
import AlertToast
//import PhoneNumberKit
class NetworkCall: ObservableObject{
     @Published var isLoading = false;
     ///
   
    
     //@Published var loggedIn:Bool = false;
     
     @Published  var login_toast = false
     @Published  var login_toast_message = ""
 ////
    @Published var login_pressed = false
    
     @Published  var toast = false
     @Published  var toast_message = ""
  //  @Published var Errorresponse = [LoginErrorResponse]() = ""
     @Published var response = [LoginResponse]()
    //@ObservedObject var singinvalidation:SignInValidation = SignInValidation()
    @Published var isDashboardViewPresented: Bool = false
    @ObservedObject var LoginPostString = LoginRequest();
    func isValidPhone(email: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: email)
        }
    func login(email: String,password:String)
     {
         
         if (email == "" && password == "")
         {
             self.login_toast_message = "Email /Mobile Number should not be empty"+"\n"+"password field should contain minimum 7 characters";
             self.login_toast = true
       
         }
         else{
             let post_url :String ;
             //let postString : String;
             let postString: [String: String] ;
                      
             //(self.isValidEmail(email: email) == true)
             if ((self.isValidPhone(email: email) == false))
             {
                 //postString = "email="+email+"&password="+password;
                 postString =  ["email": email, "password": password]
                 post_url = Constants.LoginWithEmail;

             }
            
             else{
                 
                 postString  = ["contact": email, "password": password]
                  //postString = "contact="+email+"&password="+password;
                  post_url = Constants.LoginWithPhoneNo
             }

             
             

           
             
             let loginRequest = Request();
          
             loginRequest.post(urlString:post_url ,parameterString: postString)
             { [self]
                  
                 (string) in
                
                 
                 do {
                     let data = string.data(using: .utf8)!
                   
                     do {
                         if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                             
                             let statusCode = json["statusCode"] as? Int;
                             let message = json["message"] as? [String];
                             if statusCode == 400 {
                                 
                                 if message!.count > 1{
                                     
                                     let error_msg = message![0]+message![1];
                                     self.login_toast_message = error_msg;
                                      self.login_toast = true
                                 }
                                 else{
                                     
                                     let error_msg = message![0];
                                     self.login_toast_message = error_msg;
                                      self.login_toast = true
                               
                                 
                             }
                             }
                             
                                 
                                 
                    
                             else if (statusCode == 404)
                             
                             {
                                 let message = json["message"] as? String;
                               
                                 self.login_toast_message = message!;
                                 self.login_toast = true
                     
                             }
                        
                           
                            
                             else{
                                 let statusCode = json["status"] as? Int;
                                 if (statusCode == 401 || statusCode == 404)
                                 {
                                     let message = json["message"] as? String;
                                   
                                     self.login_toast_message = message!;
                                     self.login_toast = true
                                     
                                     
                                 }
                             
                                     
                                 else{
                                     
    //                                 let message = json["message"] as? String;
    //
    //                                 self.login_toast_message = message!;
    //                                 self.login_toast = true
                                  
                                      
                                       let myServiceResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
                                     
                                      DispatchQueue.main.async
                                     {
                                          self.isDashboardViewPresented = true
                                          self.isLoading = true
                                          var a  = myServiceResponse?.token
                                          
                                         }
                                 }
                                // self.login_toast_message   = myServiceResponse?.message as! String ;
                               
                                   
                                  
    //                               if(self.login_pressed)
    //                               {
    //                                    self.login_toast = true
    //                                    self.login_toast_message = "Email and Password does not match!"
    //                              }
                                                                                    
                                   
                                   
                              
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
    func validate(email: String) -> Bool {
            let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result = phoneTest.evaluate(with: email)
            return result
        }
    func isValidEmail(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
    }
//    func isValidEmail(email:String) -> Bool {
//        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
//        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
//        return emailTest.evaluate(with: email)
//    }
                 
//    func validate(email: String) -> Bool {
//              let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//              let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//              let result = phoneTest.evaluate(with: email)
//              return result
//          }
 func checkValidation(email: String) -> (Bool) {
//    if email.isEmpty {
//
//        return "Please provide email/phone number"
//    }
    
//    if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: email)) {
//
//        var res = true
//
//        return res
//       // return ("Invalid phone format\nFormat: +[country code][number]\neg: +923122459266",res)
//    }
     //|| email.contains("@")
    if email.starts(with: "+")  {
        
       // if email.starts(with: "+") {
       // func validate(value: String) -> Bool {
//           // let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
           // let result =  phoneTest.evaluate(with: value)
           // return result
     //  }
                    let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"

                   // let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
                    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                    let ans = String(phoneTest.evaluate(with: email))
                    var res = true
                    return res
                   // return (ans,res)
             

        
     //   }
//        if email.contains("@") {
//
//            if !NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: email) {
//                // focusedField = .email
//                return "Please provide a valid email address."
//            }
//        }
    }
//    else {
//
//        return "Please provide a valid email or a phone number."
//    }
    
//    if password.isEmpty {
//
//        return "Password field cannot be empty"
//    }
   // return nil
     var rsp = false
    // return ("not a problem",rsp)
     return rsp
}
          
                 
//    func isValidEmail(email: String) -> Bool {
//            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//            return emailTest.evaluate(with: LoginPostString.email)
//        }
             

    }
