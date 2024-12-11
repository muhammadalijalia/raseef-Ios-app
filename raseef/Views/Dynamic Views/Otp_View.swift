////
////  ContentView.swift
////  Otp
////
////  Created by Teamx tec on 03/10/2022.
////
//
//////
////OTPView.swift
////PabdaOTP
////
////Created by Basel Baragabah on 02/03/2021.
////Copyright © 2021 Basel Baragabah. All rights reserved.
////
//
//import SwiftUI
//import OneTimeCodeTextField
//
//struct Otp_View: View {
//    // 5 minutes
//    @State private var timeRemaining = 300
//    @State private var isOtpMatching = false
//    @ObservedObject var ForgetVm = ForgetViewModel()
//    @ObservedObject var otpVM = OtpViewModel()
//    @ObservedObject var otpPostString = OtpForgetPasswordReq()
//    
//    @ObservedObject var FVm = ForgetViewModel()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//
//    var body: some View {
//        
//        NavigationLink("",destination: ResetPassword(),isActive: $otpVM.PushToResetView)
//        ScrollView(showsIndicators: false) {
//            Image(icon: .splash)
//                .resizable()
//                .frame(width: 65, height: 90, alignment: .center)
//                .padding(.top, 35)
//            
//            ///VSTACK
//            VStack{
//                HStack {
//                    Text("OTP")
//                        .titleText()
//                    Spacer()
//                }
//                .padding(.top, 50)
//                
//                HStack {
//                    Text("Please enter the OTP sent to your mobile number")
//                        .padding(.top, 1)
//                        .multilineTextAlignment(.leading)
//                        .font(.custom(ubuntu: .regular, style: .headline))
//                        .foregroundColor(.customDarkGray)
//                    Spacer()
//                }
//                
//                //Zstack
//                ZStack(alignment: .center) {
//                
//                    VStack {
////                        OTPTextFieldView {otp, completionHandler in
////
////
////                            UserDefaults.standard.set(otp, forKey: "otp")
////
////
////
////
////
////                        }
//                      // NewOtp()
//                    
//                      
//
//                        
//                    }
//                    
//                    
//                   
//                }  .padding(.top, 30)
//                    .padding(.bottom, 30)
//                
//                
//                Button {
//                
//                    print(FVm.forget_email)
//                    
//                    
//                 
//                  //  self.otpVM.VeryOtp(email: FVm.forget_email, token: FVm.forget_token)
//                    var a = ""
//          
//
//                    
//                } label: {
//                    Text("Register Verify Now")
//                        .frame(maxWidth: .infinity)
//                        .filledButton()
//                        .padding(.horizontal, 7.5)
//                }
//                
//                Text("Resend OTP in "+getTimer()+" seconds")
//                    .font(.custom(ubuntu: .medium, style: .body))
//                    .foregroundColor(.customDarkGray)
//                    .background(Color.clear)
//                    .padding(.top, 20)
//                    .padding(.bottom, 20)
//                
//                    .padding()
//                    .onReceive(timer) { _ in
//                        if timeRemaining > 0 {
//                            timeRemaining -= 1
//                        }
//                    }
//                Button {
//                    self.timeRemaining = 300
//                    ForgetVm.forget(email: FVm.forget_email)
//                }label: {
//                    Text("Resend Again?")
//                        .padding(.bottom, 20)
//                        .font(.custom(ubuntu: .medium, style: .body))
////                        .foregroundColor(otpVM.resendCodeCounter == 0 ? .customForeground : .customGray)
//                        .background(Color.clear)
//                }
//            .disabled(timeRemaining == 0 ? false : true)
//                
//                
//                
//            } .padding(.horizontal, 30)
//          
//            
//           
//            
//            
//        }
//        
//        VStack {
//            
////            HStack {
////                Text("Enter OTP")
////                    .font(.title2)
////                    .fontWeight(.medium)
////                    .foregroundColor(.green)
////                Spacer()
////            }
////            .padding(.leading)
//            
////            HStack {
////                Text("We send you a code via SMS to verify your account, please enter it in the box below.")
////                    .font(.body)
////                Spacer()
////            }
////            .padding(.leading)
////            .padding(.top,5)
////            .padding(.bottom, 30)
//            
////            VStack {
////                OTPTextFieldView { otp, completionHandler in
////
////                    if otp == "1234"
////                    { // this could be a network call
////                        completionHandler(true)
////                        isOtpMatching = true
////                    }
////                    else
////                    {
////                        completionHandler(false)
////                        isOtpMatching = false
////                    }
////
////                }
////
////
////                Text(getTimer())
////                    .padding()
////                    .onReceive(timer) { _ in
////                        if timeRemaining > 0 {
////                            timeRemaining -= 1
////                        }
////                    }
////
////                Button(action: {
////                    timeRemaining = 30
////                }, label: {
////                    Text("Request a new code")
////                        .font(.callout)
////                        .foregroundColor(.white)
////                })
////                .padding()
////                .frame(maxWidth: .infinity)
////                .background(Color.green)
////                .clipShape(RoundedRectangle(cornerRadius: 5))
////                .padding(.horizontal)
////
////            }
//            
//        }.fullScreenCover(isPresented: $isOtpMatching, content: {
//            LoginView()
//        })
//        
//    }
//    
//    func getTimer() -> String{
//        let minutes = Int(timeRemaining) / 60 % 60
//        let seconds = Int(timeRemaining) % 60
//        return String(format:"%02i:%02i", minutes, seconds)
//    }
//}
//
//struct OTPView_Previews1: PreviewProvider {
//    static var previews: some View {
//        Otp_View()
//    }
//}
