////
////  ResetPassword.swift
////  Multivender
////
////  Created by TeamX Pakistan on 02/10/2022.
////
//
//import SwiftUI
//
//struct ResetPassword_View: View {
//    @ObservedObject var ResetpostString = ResetReq();
//   @ObservedObject var Resetview = Reset_VM();
//    @ObservedObject var otpPostString = VerifyotpRequest()
//    @State var a = ""
//    @State var b = ""
//    @State var pushtoOtpView = false
//    var body: some View {
//        GeometryReader { reader in
//            NavigationView{
//                ZStack(alignment: .top) {
//
//
//
//
//                    NavigationLink("", destination:  Otp_SU_View { otp, completionHandler in }
//                        .navigationBarHidden(true)
//                        .navigationBarHidden(true)
//                                   , isActive: $pushtoOtpView)
//                    //            NavigationLink("", destination: OTPView(phoneNumber: forgotPasswordVM.phone, token: forgotPasswordVM.token, isRegistering: false), isActive: $forgotPasswordVM.pushToOTPView)
//                    NavigationLink("",destination: Login_View()
//                        .navigationBarHidden(true)
//                        .navigationBarTitle("")
//
//                                   ,isActive: $Resetview.pushToLoginView)
//
//                    ScrollView(showsIndicators: false) {
//                        VStack(spacing:30) {
//                            VStack(spacing:12)
//                            {
//                                HStack {
//                                    Text("CREATE PASSWORD")
//                                        .titleText()
//                                    Spacer()
//                                }
//
//
//                                HStack {
//                                    Text("Your new password must be diffrent from previously used password.")
//                                        .smallText()
//                                    Spacer()
//                                }
//
//
//                            } .padding(.top, 80)
//
//                            VStack{
//                                HStack{
//                                    Text("New Password")
//                                        .smallText()
//                                    Spacer()
//                                }
//                                Reset_p(placeHolder:"New Password",reset_password: $ResetpostString.password)
////                                TextField("New Password", text: $ResetpostString.password)
////                                PasswordText(placeHolder:"New Password",password: $ResetpostString.password)
//                                    .textContentType(.password)
////                                    .keyboardType(.default)
////                                    .padding(.top, 0)
//                            }
//                            //                                                .focused($focusedField, equals: .password)
//                            VStack{
//                                HStack{
//                                    Text("Confirm Password")
//                                        .smallText()
//                                    Spacer()
//                                }
//                                
//                                Reset_p(placeHolder:"Confirm Password",reset_password: $ResetpostString.confirm_password)
////                                TextField("Confirm Password", text: $ResetpostString.reset_new_confirm_password)
////                                PasswordText(placeHolder:"Confirm Password",password: $ResetpostString.confirm_password)
////                                    //.textContentType(.)
////                                    .keyboardType(.default)
////                                    .padding(.top, 0)
//                            }
//                            //                                                .focused($focusedField, equals: .password)
//
//                            Button {
//                                //HOW TO SWITCH ON THIS SCREEN?
//                                // Email+token+password konsa bhaijna hy
//
//
//                                let email: String? = UserDefaults.standard.string(forKey: "otpPostString.email");
//                                let otp_token = UserDefaults.standard.string(forKey: "otpPostString.token") ;
//
//                                ResetpostString.token = otp_token!;
//                                ResetpostString.email = email!;
//                                                    Resetview.Reset(email: ResetpostString.email,token:ResetpostString.token,password:ResetpostString.password,
//                                                                    confirm_password:ResetpostString.confirm_password)
//
//                            }
//                        label: {
//                            Text("Save")
//                                .frame(maxWidth: .infinity)
//                                .filledButton()
//                                .padding(.horizontal, 7.5)
//                        }.padding(.top,40)
//                                .alert(Resetview.login_toast_message, isPresented: $Resetview.login_toast) {
//                                    HStack{
//
//
//
//                                        Button("Ok", role: .cancel, action: {
//
//
//
//                                        })
//                                    }
//                                }
//
//                        }
//                        .padding(.horizontal,10)
//                         .padding(.bottom, 40)
//
//                        .toolbar {
//                            ToolbarItem(placement: .principal) {
//
//                                ZStack{
//                                    Image(icon: .navbar)
//                                        .resizable()
//                                        .cornerRadius(30)
//                                        .frame(width: reader.size.width * 1.02,height: reader.size.height * 0.14, alignment: .top)
//
//                                        .padding(.bottom,35)
//
//                                    HStack{
//                                        Button{
//                                            self.pushtoOtpView = true
//                                        }label:{
//                                            Image(icon: .leftArrow)
//                                                .resizable()                             //.font(.largeTitle.bold())
//                                                .foregroundColor(Color.white)
//                                                .frame(width:20, height: 20)
//                                            //.padding(.bottom,10)
//
//                                        }
//                                        Spacer()
//
//                                        Text("sdas")
//                                            .hidden()
//                                    }
//                                    .frame(width: reader.size.width * 0.92,height: reader.size.height , alignment: .center)
//
//                                }
//
//
//                            }
//
//                        }
//                    }
//                    .navigationBarTitle("")
//
//
//
//
//                }
//                .preferredColorScheme(.light)
//                //        .navigationBarHidden(false)
//                //        .navigationBarBackButtonHidden(false)
//                //.navigationBarTitleDisplayMode(.inline)
//                // .background(Color.customBackground)
////                .onTapGesture
////                {
////                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
////                }
//
//            }
//        }
//
//    }
//}
//
//struct ResetPassword_View_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPassword_View()
//    }
//}
