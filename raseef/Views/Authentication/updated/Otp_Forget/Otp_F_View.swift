//
//  Otp_F_View.swift
//  raseef
//
//  Created by Teamx tec on 02/11/2022.
//

import Foundation
import SwiftUI
//import CocoaTextField
import SwiftUIX
import Combine
//import OneTimeCodeTextField

public struct Otp_F_View: View {
    
    var maxDigits: Int = 6
    @State private var timeRemaining = 300
    //  @State var pin: String = ""
    @State var isDisabled = false
    @State var pushToConfirmationView = false
    @ObservedObject var otp_forget_PostString = OtpForgetPasswordReq()
    @StateObject var otpVM : Otp_VM = Otp_VM()
   // @ObservedObject var otpPostString = OtpForgetPasswordReq()
    var handler: (String, (Bool) -> Void) -> Void
    @ObservedObject var FVm = ForgetViewModel()
    @ObservedObject var Rvm = RegisterWithPhone_ViewModel()
    @State var pushforgetView = false
    @State var pushtosignupView  = false
    //@ObservedObject var FVm = ForgetViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
 @State private var PushToResetView = false
    
    public var body: some View {
        NavigationView{
        GeometryReader { reader in
            
           
                ZStack(alignment: .top) {
                  
                  
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack(alignment:.center, spacing: 20) {
                            
                            
                            HStack {
                                Text("ENTER Email CODE")
                                    .titleText()
                                Spacer()
                            }
                            .padding(.top, 40)
                            
                            VStack {
                                Text("The reovery code was sent to your email")
                                Text("please enter the code:")
                                    
                                    .padding(.top, 2)
                                
                                    .multilineTextAlignment(.leading)
                                    .font(.custom(opensans: .italic1, style: .headline))
                                    .foregroundColor(.customDarkGray)
                                
                                Spacer()
                            }
                            .lineLimit(2)
                            ZStack {
                                pinDots
                                backgroundField
                                
                            }
                            
                            
                            
                            
                            Text("Resend OTP in "+getTimer()+" seconds")
                                .font(.custom(opensans: .italic1, style: .body))
                                .foregroundColor(.customDarkGray)
                                .background(Color.clear)
                                .padding(.top, 7)
                                .padding(.bottom, 8)
                            
                                .padding()
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
                            Button {
                                self.timeRemaining = 300
                                
                                   
                           
                                    let forget_email = UserDefaults.standard.string(forKey: "forgetEmail")
                                    
                                        FVm.forget(email: forget_email!)
                                    
                                    
                              
                                
                                
                                //print("Digits"+self.getDigits(at: index))
                                //print("SubmitPin()"+self.submitPin)
                                
                                
                            }label: {
                                Text("Resend Again?")
                                    .padding(.bottom, 20)
                                    .font(.custom(opensans: .italic1, style: .body))
                                //                        .foregroundColor(otpVM.resendCodeCounter == 0 ? .customForeground : .customGray)
                                    .background(Color.clear)
                            }
                            .disabled(timeRemaining == 0 ? false : true)
                            Button {
                                UserDefaults.standard.set(otp_forget_PostString.token, forKey: "otp_forget_PostString.token")
                                ///CHECK OTP OF Register
                                
                                
                                
                                
                                ///CHECK OTP OF RESET PASSWORD
                                
                                
                                self.otpVM.VerifyForgetOtp(token: otp_forget_PostString.token)
                       
                                
                            
                             //   PushToResetView.toggle()
                                
                            } label: {
                                Text("Verify")
                                //                    .frame(width: 200, height: 30 ,alignment: .center)
                                    .padding([.leading,.trailing], 60)
                                    .filledButton()
                                
                                
                                // .padding(.top, 10)
                            }
                            .onReceive(otpVM.$PushToResetView)
                            {
                                PushToResetView in
                                self.PushToResetView  = PushToResetView
                                print(PushToResetView)
                            }
                            .frame(width: 300, height: 50, alignment: .center)

                            
                            Button{
                                
                              //  print(self.otpVM.PushToResetView)
                            }label:{
                                
                                Text("IN Forget reposne")
                            }
                        }
                        .padding(.horizontal,10)
                        .frame(width: reader.size.width, height: reader.size.height * 0.6)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                
                                ZStack{
                                    Image(icon: .navbar)
                                        .resizable()
                                        .cornerRadius(30)
                                        .frame(width: reader.size.width * 1.02,height: reader.size.height * 0.14, alignment: .top)
                                    
                                        .padding(.bottom,35)
                                    
                                    HStack{
                                        Button{
//                                            print(otpVM.PushToResetView)
//                                            print(otpVM.PushToLoginView)
                                         //   let frogetview = UserDefaults.standard.bool(forKey: "requestfromforgetview")

                                         //   if frogetview{
                                                self.pushforgetView = true
                                        //    }
//                                            else{
//
//                                                self.pushtosignupView = true
//                                            }
                                           
                                        }label:{
                                            Image(icon: .leftArrow)
                                                .resizable()                             //.font(.largeTitle.bold())
                                                .foregroundColor(Color.white)
                                                .frame(width:20, height: 20)
                                            //.padding(.bottom,10)
                                            
                                        }
                                        Spacer()
                                        
                                        Text("sdas")
                                            .hidden()
                                    }
                                    .frame(width: reader.size.width * 0.92,height: reader.size.height , alignment: .center)
                                    
                                }
                                
                                
                            }
                            
                        }
                    }   .navigationBarTitle("")
                }
//            NavigationLink("",destination: ResetPassword_View()
//                .navigationBarHidden(true)
//                .navigationBarTitle("")
//                           ,isActive: $otpVM.PushToResetView)
            
                    NavigationLink("",destination: ResetPassword()
                        .navigationBarHidden(true)
                        .navigationBarTitle("")
                                   ,isActive: $PushToResetView)
            
     
            ///back button
//            NavigationLink("",destination: ForgetPassword_View()
//                .navigationBarHidden(true)
//                           ,isActive: $pushtoforgetView)
            }
        }
        .onTapGesture {

            self.f_endTextEditing()
            self.f_hideKeyboard()
        }
        
     //  .ignoresSafeArea(.keyboard, edges: .bottom)
       .ignoresSafeArea(.keyboard)
        //.padding(.horizontal, 30)
     //  .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private var pinDots: some View {
        HStack(spacing:15) {
            ForEach(0..<maxDigits) { index in
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.white)
                    .padding()
                        .background(RoundedRectangle(cornerRadius: 5)            .stroke(Color(.lightGray), lineWidth: 1))
                        .frame(width: 30, height: 40)
                    
                    
                    Text(self.getDigits(at: index))
                        .font(.system(size: 25, weight: .thin, design: .default))
                }
                

            }
        }
     
        //.ignoresSafeArea(.keyboard)
        .padding(.horizontal)
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.otp_forget_PostString.token }, set: { newValue in
            self.otp_forget_PostString.token = newValue
            self.submitPin()
            
        })
        
        return CocoaTextField("", text: boundPin, onCommit: submitPin)
         
            .keyboardType(.numberPad)
           // .isFirstResponder(true)
            .foregroundColor(.clear)
            .accentColor(.clear)
            
           
            
      

    }
    
    

    private func submitPin() {
        guard self.otp_forget_PostString.token.isEmpty else {
            return
        }
        
        if self.otp_forget_PostString.token.count == maxDigits {
            isDisabled = true
            
            handler(self.otp_forget_PostString.token) { isSuccess in
                if isSuccess {
                    print("pin matched, go to next page, no action to perfrom here")
                } else {
                    self.otp_forget_PostString.token = ""
                    isDisabled = false
                    print("this has to called after showing toast why is the failure")
                }
            }
        }
        
        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
        // max digits, we remove the additional characters and make a recursive call.
        if self.otp_forget_PostString.token.count > maxDigits {
            self.otp_forget_PostString.token = String(self.otp_forget_PostString.token.prefix(maxDigits))
            submitPin()
        }
    }
    
    private func getDigits(at index: Int) -> String {
        if index >= self.otp_forget_PostString.token.count {
            return ""
        }
        
            return self.otp_forget_PostString.token.f_digits[index].f_numberString
    }
    func getTimer() -> String{
            let minutes = Int(timeRemaining) / 60 % 60
            let seconds = Int(timeRemaining) % 60
            return String(format:"%02i:%02i", minutes, seconds)
        }
}

extension String {
    
    var f_digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        
        return result
    }
    
}



extension Int {
    
    var f_numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}
extension View {
  func f_endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
extension View{
func f_hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
}
//struct Otp_F_View_Previews1: PreviewProvider {
//    static var previews: some View {
//        Otp_F_View { otp, completionHandler in }
//    }
//}