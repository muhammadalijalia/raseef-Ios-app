////
////  OTP_V.swift
////  raseef
////
////  Created by Teamx tec on 02/11/2022.
////
//
//import Foundation
//import SwiftUI
//////
//////  OtpView.swift
//////  Multivender
//////
//////  Created by Teamx tec on 03/10/2022.
//////
////
////import SwiftUI
////
//struct OTP_V: View {
//    @Environment(\.presentationMode) var presentation
//    let screenSize = UIScreen.main.bounds.size;
//  ///  @ObservedObject var otpVM = OtpViewModel()
//    @ObservedObject var otpPostString = VerifyotpRequest()
//    //@FocusState private var focusedField: Field?
//    
//    @State private var navBarBackButtonIsHidden: Bool = false
//    
//    
//    /// <#Description#>
//    var body: some View {
//        NavigationView{
//            VStack{
//                
//              
//                    OTPTextField_View { otp, completionHandler in }
//                    
//                
//            }
//            
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarTitle("")
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//       
//            .frame(width: screenSize.width, height: screenSize.height)
//           
//        }
//     
//    
//    }
//}
////        ScrollView(showsIndicators: false) {
////
//////            NavigationLink("", destination: NewPasswordView(token: otpVM.token, phone: otpVM.phoneNumber), isActive: $otpVM.pushToNewPasswordView)
//////                .isDetailLink(false)
//////                .hidden()
////
////            Image(icon: .splash)
////                .resizable()
////                .frame(width: 65, height: 90, alignment: .center)
////                .padding(.top, 35)
////
////            VStack {
////
////
////                HStack {
////                    Text("OTP")
////                        .titleText()
////                    Spacer()
////                }
////                .padding(.top, 50)
////
////                HStack {
////                    Text("Please enter the OTP sent to your mobile number")
////                        .padding(.top, 1)
////                        .multilineTextAlignment(.leading)
////                        .font(.custom(ubuntu: .regular, style: .headline))
////                        .foregroundColor(.customDarkGray)
////                    Spacer()
////                }
////
//////                NavigationLink("", destination: SignUpView(), isActive: $otpVM.isDashboardViewPresented)
////
////                ZStack(alignment: .center) {
////                   TextField("", text: $otpPostString.code)
////
////                        .onChange(of: otpPostString.code) { text in
////
////                            if otpPostString.code.count == 6 {
////
////
////
////                                navBarBackButtonIsHidden = true
////
////
////                            }
////                        }
////                        .background(Color.clear)
////                        .frame(maxWidth: 0, maxHeight: 0, alignment: .center)
////                        .font(Font.system(size: 0))
////                        .accentColor(.clear)
////                        .foregroundColor(.clear)
////                        .multilineTextAlignment(.center)
////                    .keyboardType(.numberPad)
//////                        .onReceive(($otpPostString.code)) { _ in $otpVM.limitText(6) }
////
////                        .padding()
////                    HStack {
////                        ForEach(0..<6) { index in
////                            ZStack {
////                                Text(otpVM.getDigits(at: index))
////                                    .font(.custom(ubuntu: .regular, style: .subheadline))
////                                    .foregroundColor(.customLightBlack)
////                                    .padding(.vertical, 22)
////                                    .padding(.horizontal, 18)
////                                    .overlay(
////                                        RoundedRectangle(cornerRadius: 6)
////                                            .strokeBorder(
////                                                Color.customLightBlack,
////                                                style: StrokeStyle(lineWidth: 0.6))
////                                    )
////                            }
////                            Spacer()
////                        }
////                    }
////                }
////                .padding(.top, 30)
////                .padding(.bottom, 30)
////
////                Button {
////
////                    let forget_email = UserDefaults.standard.string(forKey: "forget_email")!
//////                    self.otpVM.VeryOtp(email: forget_email, token: String)
//////
////
////
////
////                } label: {
////                    Text("Register Verify Now")
////                        .frame(maxWidth: .infinity)
////                        .filledButton()
////                        .padding(.horizontal, 7.5)
////                }
////
////                Text("Resend OTP in \(otpVM.resendCodeCounter) seconds")
////                    .font(.custom(ubuntu: .medium, style: .body))
////                    .foregroundColor(.customDarkGray)
////                    .background(Color.clear)
////                    .padding(.top, 20)
////                    .padding(.bottom, 20)
////
////                Button {
////
////
////
////
////                    navBarBackButtonIsHidden = true
////
////                    otpVM.resendAgainButtonClicked { otpSent in
////
////                       if otpSent || 1==1 {
////                            // An otp has been send to \(phone number)
////                          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                         //      focusedField = .field
////                            }
////                           navBarBackButtonIsHidden = false
////
////                       }
////                      else {
////
////
////                   }
////                }
////                }label: {
////                    Text("Resend Again?")
////                        .padding(.bottom, 20)
////                        .font(.custom(ubuntu: .medium, style: .body))
////                        .foregroundColor(otpVM.resendCodeCounter == 0 ? .customForeground : .customGray)
////                        .background(Color.clear)
////                }
////            .disabled(otpVM.resendCodeCounter == 0 ? false : true)
////
////
////
////            }
////            .padding(.horizontal, 30)
////        }
//////        .fullScreenCover(isPresented: $otpVM.isDashboardViewPresented, content: SignUpView.init) // Change this later
//////        .onLoad {
//////                sendCode()
//////        }
//////        .toast(isPresenting: $otpVM.isPresentingToast, message: otpVM.toastMessage, backgroundColor: Color.black, textColor: Color.white, autoDismiss: .after(2), onDisappear: {
//////            otpVM.isPresentingToast = false
//////            otpVM.toastMessage = ""
//////        })
////
////    }
////}
////
////struct OtpView_Previews12: PreviewProvider {
////    static var previews: some View {
////        OtpView()
////    }
////}
