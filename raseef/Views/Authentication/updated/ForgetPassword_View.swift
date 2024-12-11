////
////  ForegtPassword.swift
////  Multivender
////
////  Created by Teamx tec on 27/09/2022.
////
//
//import SwiftUI
//
//struct ForgetPassword_View: View {
//    @ObservedObject var ForgetPostString = ForgetRequest();
// @ObservedObject var Forgetview = ForgetViewModel();
//    @State public var sms_no: Bool = false
//    @State var pushToConfirmationView = false
//    @State var requestfromforgetview = false
//    //
//    @State var pushtoOtpView = false
//    var body: some View {
//        NavigationView {
//        GeometryReader { reader in
//       
//            ZStack(alignment: .top) {
////                Color(hex: 0xd3d3d5)
////                    .edgesIgnoringSafeArea(.all)
//
//
//
//                ScrollView(showsIndicators: false) {
//
//        //            NavigationLink("", destination: OTPView(phoneNumber: forgotPasswordVM.phone, token: forgotPasswordVM.token, isRegistering: false), isActive: $forgotPasswordVM.pushToOTPView)
//
////                    NavigationLink("", destination: Confirmation_View()
////                     .navigationBarHidden(true)
////                     .navigationTitle("")
////                     .navigationBarBackButtonHidden(true)
////                                   ,isActive: $pushToConfirmationView)
//                    NavigationLink("", destination:Login_View()
//                     .navigationBarHidden(true)
//                     .navigationTitle("")
//                     .navigationBarBackButtonHidden(true)
//                                   ,isActive: $pushToConfirmationView)
//                    NavigationLink("", destination:  Otp_F_View { otp, completionHandler in }
//                .navigationBarHidden(true)
//                .navigationTitle("")
//                .navigationBarBackButtonHidden(true)
//                              ,isActive: $Forgetview.PushToOtpView)
//
//
//
//                    VStack {
//
//                        HStack {
//                            Text("Forgot")
//                                .titleText()
//                            Spacer()
//                        }
//                        .padding(.top, 75)
//
//                        HStack {
//                            Text("Password?")
//                                .titleText()
//                            Spacer()
//                        }
//                        HStack
//                        {
//                            Text("Don't worry! It happens. Please enter the address associated with your account.")
//                              //  .font(.custom(ubuntu: .regular, style: .headline))
//                                .foregroundColor(.customDarkGray)
//                                .padding(.top, 10)
//                                .multilineTextAlignment(.leading)
//                            Spacer()
//                        }
//
//
//                        forget(icon: .eMobail, placeHolder: "Email address",forget_email: $ForgetPostString.forget_email)
////                            EmailText(icon: .eMobail, placeHolder: "Email address",email: $ForgetPostString.forget_email)
////
//                                .keyboardType(.emailAddress)
//                                .textContentType(.emailAddress)
//                                .padding(.top, 20)
////            //                    .focused($focusedField, equals: .user)
//                                .padding(.bottom, 30)
//
//
//
//
//
//
//                        Button {
//
//                       Forgetview.forget(email: ForgetPostString.forget_email)
//                            self.requestfromforgetview.toggle()
//                            UserDefaults.standard.set(self.requestfromforgetview,forKey: "requestfromforgetview")
//
//                        }
//                    label: {
//                            Text("Send")
//                                .frame(maxWidth: .infinity)
//                                .filledButton()
//                                .padding(.horizontal, 7.5)
//                        }
//                    .alert(Forgetview.login_toast_message, isPresented: $Forgetview.login_toast) {
//                            HStack{
//
//
//
//                                Button("Ok", role: .cancel, action: {
//
//
//
//                                })
//                            }
//                        }
//
//                    }
//                    .padding(.horizontal, 10)
//                    .padding(.bottom, 40)
//                }
//
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarTitle("")
//
//                .onTapGesture
//                {
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
//                }
//                .onAppear(perform: {
//
//                    UserDefaults.standard.removeObject(forKey: "ReuqestFromRegistration");
//                })
//
//
//
//
//
//
//
//
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//
//                            ZStack{
//                                Image(icon: .navbar)
//                                    .resizable()
//                                    .cornerRadius(30)
//                                    .frame(width: reader.size.width * 1.02,height: reader.size.height * 0.14, alignment: .top)
//
//                                    .padding(.bottom,35)
//
//                                                                HStack{
//                                                                    Button{
//                                                                                                      self.pushToConfirmationView = true
//                                                                                                  }label:{
//                                                                                                      Image(icon: .leftArrow)
//                                                                                                          .resizable()                             //.font(.largeTitle.bold())
//                                                                                                          .foregroundColor(Color.white)
//                                                          .frame(width:20, height: 20)
//                                                                                                      //.padding(.bottom,10)
//
//                                                                                                  }
//                                                                    Spacer()
//
//                                                                    Text("sdas")
//                                                                       .hidden()
//                                                                }
//                                                                .frame(width: reader.size.width * 0.92,height: reader.size.height , alignment: .center)
//
//                            }
//
//
//                                }
//
//                    }
//
//            }
//
//
//            }
//              }
//
//
//
//    }
//}
//
//struct ForgetPassword_View_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgetPassword_View()
//
//    }
//}
//
