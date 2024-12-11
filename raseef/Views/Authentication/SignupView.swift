////
////  SignupView.swift
////  Multivender
////
////  Created by Teamx tec on 29/09/2022.
////
//

import SwiftUI
import AlertToast
struct SignupView: View {
    let screenSize = UIScreen.main.bounds;
    @ObservedObject var SignupRequest = RegisterWithPhone_ViewModel();
    @ObservedObject var registerPostString = RegisterPhoneRequest();
   
    @State private var navBarBackButtonIsHidden: Bool = false
    @State var pushToLoginView : Bool = false
    @State var PushtoPrivacyPolicy : Bool = false
    @State var PushtoTermsCondition : Bool = false
    @Environment(\.presentationMode) var presentation
    ///
    @State var pushToOtpView : Bool = false
    var body: some View {
        GeometryReader{geo in
           // NavigationView{
                ScrollView(showsIndicators: false) {
       
             
            
                ZStack{
                                        NavigationLink("", destination: LoginView()
                                            .navigationBarHidden(true)
                                                       , isActive: $pushToLoginView)
//                                            .navigationBarTitle("")
//                                            .navigationBarBackButtonHidden(true)
//                    NavigationLink("",destination:    OTPTextFieldView { otp, completionHandler in }
//                                                                  .navigationBarTitle("")
//                                                                  .navigationBarBackButtonHidden(true)
//
//                                                                 ,isActive: $SignupRequest.PushToOtpView)
                    NavigationLink("",destination:       Otp_SU_View { otp, completionHandler in }
                                                                  .navigationBarTitle("")
                                                                  .navigationBarBackButtonHidden(true)

                                                                 ,isActive: $SignupRequest.PushToOtpView)
                     VStack{
                          Image(icon: .Splash)
                           .resizable()
                           .cornerRadius(50)
                           .edgesIgnoringSafeArea(.all)
                           .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .top)
                           
                          
                          
                          Color.white
                             .frame(width: geo.size.width, height: geo.size.height * 0.8, alignment: .top)
                      
                     }
              
                     .frame(width: geo.size.width * 1, height: geo.size.height * 1, alignment: .top)
                     .offset(y:-40)
                      
                   
                     VStack(spacing:13){
                      
                          VStack{
                               Image(icon: .logo_white)
                                         .resizable()
                               
                          }
                          .frame(width: geo.size.width*0.25, height: geo.size.height*0.1, alignment: .top)
                          
                          .padding(.top,50)
                
                          ZStack{
                               Image(icon:.WHITE_BG)
                             .resizable()
              
                               
                             .cornerRadius(40)
                             .shadow(color: Color.gray, radius: 30, x: 0, y: 0)
                             .frame(width:geo.size.width * 0.9, height:geo.size.height * 0.8, alignment: .center)
               
                               
                               
                     
                              VStack{
                                  
                                  Text("SIGN UP")
                                         .titleText()
                                      .offset(y:-5)
                                   
                                         
                                  
                                  VStack(spacing:15){
                                     
                                      VStack(spacing:12){
                                          HStack{
       
                                               Text("Full Name")
                                                   .smallText()
                                               Spacer()
                                          }
                                         EmailText(systemIcon: .person, placeHolder: "Name", email: $registerPostString.name)
                                   
                                             .keyboardType(.namePhonePad)
                                    
                                             .foregroundColor(Color(hex: 0xFA6109))
           
           HStack{

                Text("Email Address")
                    .smallText()
                Spacer()
           }
                                         EmailText(icon: .email, placeHolder: "Email address", email: $registerPostString.email)
                                             .keyboardType(.emailAddress)
                                             .textContentType(.emailAddress)
         
           HStack{
         
                                                 Text("Mobile Number")
                                                     .smallText()
                                                 Spacer()
                                            }
         
         
                                       EmailText(icon: .mobile_model, placeHolder: "Mobile Number", email: $registerPostString.contact)
                                           .keyboardType(.phonePad)
                                           .textContentType(.telephoneNumber)
         
         
                                            HStack{
         
                                                 Text("Password")
                                                     .smallText()
                                                 Spacer()
                                            }
         
         
         
                                       PasswordText(placeHolder: "Password", password: $registerPostString.password)
         
                               
                                          
                                          
                                      }
                                         
                                      .padding(.top,50)
                                      .padding(.bottom,0)
                                      
                          
                                   
                                       VStack(spacing:30){
                                            Button {
                                           
                                           
                                                self.SignupRequest.RegisterWithPhone(name:registerPostString.name,email:registerPostString.email,contact:registerPostString.contact,password:registerPostString.password)
                                         navBarBackButtonIsHidden = true
                                                
                                    } label: {
                                           
                                 Text("Sign Up")
                            
                                    .frame(maxWidth: 300)
                                     .filledButton()
                    
                                                                  }
                                           
//                                    .fullScreenCover(isPresented: $SignupRequest.PushToOtpView, content: OtpView.init)
                             
                                                                    .alert(SignupRequest.login_toast_message, isPresented: $SignupRequest.login_toast) {
                                                                                                            HStack{
                                           
                                           
                                           
                                                                                 Button("Ok", role: .cancel, action: {
                                           
                                           
                                           
                                                                                 })
                                                                             }}
                            
                                           
                                    HStack {
                                            
                              Text("Already Registered? ")
                                  .font(.custom(opensans: .italic1, style: .headline))
                                      .foregroundColor(.customDarkGray)
                                   Button {
                                            self.pushToLoginView = true
                                            
                                                                              }
                                    label: {
                                          Text("Login")
                                       .textButton()
                                                                              }
//                                    .fullScreenCover(isPresented: $pushToLoginView, content: LoginView.init)
                                         
                                    }
                                            
                                       }
                                       .frame(width:280,height: 80)
                                       .padding(.top,20)
                                          
                                  }
                                  .frame(width: geo.size.width * 0.8,height: geo.size.height * 0.6, alignment: .center)
                    
                              }.padding(.bottom,10)
                              

                          }
                          .padding(.top,10)
                         

                     
                     }
                    
                     
              
   
                    }
                .background(Color.white)

             
                }
                .frame(height:geo.size.height * 1.05)
               .edgesIgnoringSafeArea(.all)
           // }
               .onAppear{
                   
                   UserDefaults.standard.removeObject(forKey: "requestfromforgetview");
                   
               }
        }
     
   
    }
}
//
struct SignupView_Previews2: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}


//struct SignupView: View {
//    let screenSize = UIScreen.main.bounds;
//    @ObservedObject var SignupRequest = RegisterWithPhone_ViewModel();
//    @ObservedObject var registerPostString = RegisterPhoneRequest();
//
//    @State private var navBarBackButtonIsHidden: Bool = false
//    @State var pushToLoginView : Bool = false
//    @State var PushtoPrivacyPolicy : Bool = false
//    @State var PushtoTermsCondition : Bool = false
//    @Environment(\.presentationMode) var presentation
//    var body: some View {
//        NavigationView{
//            ScrollView(showsIndicators: false) {
//
//            ZStack{
//
//                      Image(icon: .Splash)
//                       .resizable()
//                       .cornerRadius(50)
//
//
//
//                .frame(width: screenSize.width,height: screenSize.height*0.5)
//                .padding(.bottom,700)
//                .edgesIgnoringSafeArea(.all)
//
//
//
//                VStack
//                {
//                    Image(icon: .logo_white)
//                     .resizable()
//
//                   .frame(width: screenSize.width*0.27,height: screenSize.height*0.1, alignment: .top)
//                   .padding(.top,25)
//                      ZStack{
////
//
//
//                        Image(icon:.WHITE_BG)
//                            .resizable()
//                            .cornerRadius(30)
//                            .shadow(color: Color.gray, radius: 30, x: 0, y: 0)
//                            .frame(width: screenSize.width*0.92, height: screenSize.height*0.72)
//                            .padding(.bottom,280)
//
//                          VStack {
//
//                              HStack {
//                                  Text("Sign Up")
//                                      .titleText()
//
//
//
//                              }
//                              .padding(.top, 65)
//
//                              VStack{
//
//                                  Text("Full Name")
//                                      .smallText()
//                                    //  .offset(x:-115)
//                                     .padding(.horizontal,-150)
//                                      .padding(.top,20)
//
//
//
//                              EmailText(systemIcon: .person, placeHolder: "Name", email: $registerPostString.name)
//                                 // .textContentType(.person)
//                                  .keyboardType(.namePhonePad)
//                               //  .padding(.top, 20)
//                                  .foregroundColor(Color(hex: 0xFA6109))
//
//
//
//
//
//
//
//
//                              Text("Email Address")
//                                  .smallText()
//                                 // .offset(x:-105)
//                                  .padding(.horizontal,-150)
//                                  .padding(.top,20)
//                              EmailText(icon: .email, placeHolder: "Email address", email: $registerPostString.email)
//                                  .keyboardType(.emailAddress)
//                                  .textContentType(.emailAddress)
//                                  .padding(.top, 0)
//
//
//                              Text("Mobile Number")
//                                  .smallText()
//                                 // .offset(x:-105)
//                                  .padding(.horizontal,-150)
//                                  .padding(.top,20)
//                              EmailText(icon: .mobile_model, placeHolder: "Mobile Number", email: $registerPostString.contact)
//                                  .keyboardType(.phonePad)
//                                  .textContentType(.telephoneNumber)
//                                  .padding(.top, 0)
//                                //  .focused($focusedField, equals: .mobileNumber)
//
//
//                              Text("Password")
//                                  .smallText()
//                                 // .offset(x:-105)
//                                  .padding(.horizontal,-150)
//                                  .padding(.top,20)
//                              PasswordText(placeHolder: "Password", password: $registerPostString.password)
//                                  .padding(.top, 0)
//                                  //.focused($focusedField, equals: .password)
//
//
//                              }
//
//
//                              Button {
//
//
//                                self.SignupRequest.RegisterWithPhone(name:registerPostString.name,contact:registerPostString.contact,password:registerPostString.password)
//                                 navBarBackButtonIsHidden = true
//
//                              } label: {
//
//                                  Text("Sign Up")
//                                      .frame(maxWidth: .infinity)
//                                      .filledButton()
//                                      .padding(.horizontal, 7.5)
//                                      .padding(.top, 25)
//                              }
//                              .alert(SignupRequest.login_toast_message, isPresented: $SignupRequest.login_toast) {
//                                  HStack{
//
//
//
//                                      Button("Ok", role: .cancel, action: {
//
//
//
//                                      })
//                                  }
//                              }
////
//                              HStack {
//
//                                  Text("Already Registered? ")
//                                      .font(.custom(opensans: .italic1, style: .headline))
//                                      .foregroundColor(.customDarkGray)
//                                  Button {
//                                      self.pushToLoginView = true
//
//                                  } label: {
//                                      Text("Login")
//                                          .textButton()
//                                  }
//                                  NavigationLink("", destination: LoginView(), isActive: $pushToLoginView)
//                              }
//                              .padding(.top, 30)
//                              .padding(.bottom, 0)
//
//                          }
//
//                          .padding(.horizontal, 40)
//                          .padding(.bottom,330)
//
////                        VStack(spacing:0){
////
////                  Text("SIGN UP")
////                                .titleText()
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////                        }
//
////                        .frame(width: screenSize.width*0.95, height: screenSize.height*0.05)
////
////                        .padding(.bottom,75)
//
//                    }
//
//                }
//
//                }
//
//
//
//
//            }.navigationBarHidden(true)
//                .edgesIgnoringSafeArea(.all)
//
////            ScrollView(showsIndicators: false) {
////                GeometryReader { geometry in
////
////                ZStack{
////
////
////                        Image(icon: .Splash)
////                                   .resizable()
////
////                                 //  .scaledToFit()
////                                   .cornerRadius(50)
////
////
////                                    .frame(width: geometry.size.width,
////                                           height: geometry.size.height * 35
////                                           )
////
////                                //    .padding(.bottom,600)
////
////
//////                                        VStack{
////
////                                        Image(icon: .logo_white)
////                                                    .resizable()
////                                                   // .scaledToFill()
////        .frame(width: ScreenSize.width*0.8,height: ScreenSize.height*0.15, alignment: .top)
////
////
////                                        Image(icon: .New_Restauant)
////                                                       .resizable()
////
////                                                     //  .scaledToFit()
////                                                       .cornerRadius(50)
////
////
////                                            .frame(width: ScreenSize.width * 0.9,
////                                                   height: ScreenSize.height / 1.5
////                                                               )
////
////
////
////                                     //   }
////
////
////
////
////
////                }
////
////
////
////
////            }
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
//////                NavigationLink("",destination: LoginView()
//////                                .navigationBarHidden(true)
//////                                 .navigationBarTitle("")
//////                               ,isActive: $pushToLoginView)
//////
//////                NavigationLink("",destination: OtpView()
//////                                .navigationBarTitle("")
//////                               ,isActive: $SignupRequest.PushToOtpView)
//////                NavigationLink("",destination: PrivacyPolicyView() ,isActive: $PushtoPrivacyPolicy)
//////                NavigationLink("",destination: TermsCondition() ,isActive: $PushtoTermsCondition)
//////                Image(icon: .splash)
//////                    .resizable()
//////                    .frame(width: 65, height: 90, alignment: .center)
//////                    .padding(.top, 15)
//////
//////                VStack {
//////
//////                    HStack {
//////                        Text("Sign Up")
//////                            .titleText()
//////                        Spacer()
//////
//////
//////    //                    Label(SignupRequest.rsp, systemImage: "exclamationmark")
//////    //                        .opacity(SignupRequest.shouldHideResponse ? 0: 1)
//////    //                        .frame(width: 30, height: 25, alignment: .trailing)
//////                    }
//////                    .padding(.top, 40)
//////
//////                    EmailText(icon: .name, placeHolder: "Name", email: $registerPostString.name)
//////                        .textContentType(.name)
//////                        .keyboardType(.namePhonePad)
//////                        .padding(.top, 20)
//////
//////                   //     .focused($focusedField, equals: .firstName)
//////
//////    //                EmailText(icon: .name, placeHolder: "Last Name", email: $SignupRequest.lastName)
//////    //                    .textContentType(.name)
//////    //                    .keyboardType(.namePhonePad)
//////    //                    .padding(.top, 25)
//////                      //  .focused($focusedField, equals: .lastName)
//////
//////                    EmailText(icon: .email, placeHolder: "Email address", email: $registerPostString.email)
//////                        .keyboardType(.emailAddress)
//////                        .textContentType(.emailAddress)
//////                        .padding(.top, 25)
//////                    //    .focused($focusedField, equals: .emailAddress)
//////
//////                    EmailText(icon: .mobileNumber, placeHolder: "Mobile Number", email: $registerPostString.contact)
//////                        .keyboardType(.phonePad)
//////                        .textContentType(.telephoneNumber)
//////                        .padding(.top, 25)
//////                      //  .focused($focusedField, equals: .mobileNumber)
//////
//////                    PasswordText(placeHolder: "Password", password: $registerPostString.password)
//////                        .padding(.top, 25)
//////                        //.focused($focusedField, equals: .password)
//////
//////
//////                    HStack {
//////
//////                        Button {
//////                            registerPostString.isAgreementSigned.toggle()
//////                        } label: {
//////                            Image(systemIcon: registerPostString.isAgreementSigned ? .checkbox : .box)
//////                                .font(.custom(ubuntu: .regular, style: .headline))
//////                        }
//////                        Text("I hereby understand and agree to ")
//////
//////                        Spacer()
//////                    }
//////                    .foregroundColor(.customDarkGray)
//////                    .font(.custom(ubuntu: .regular, style: .subheadline))
//////                    .padding(.leading, 0)
//////                    .padding(.top, 10)
//////
//////                    HStack(spacing: 4) {
//////                        Button {
//////                            self.PushtoTermsCondition = true
//////                        } label: {
//////                            Text("Terms & Conditions")
//////                                .font(.custom(ubuntu: .medium, style: .subheadline))
//////                                .foregroundColor(.customLightBlack)
//////                        }
//////
//////                        Text("and")
//////                            .font(.custom(ubuntu: .regular, style: .subheadline))
//////                            .foregroundColor(.customDarkGray)
//////
//////                        HStack {
//////                            Button {
//////                                self.PushtoPrivacyPolicy = true
//////                            } label: {
//////                                Text("Privacy Policy")
//////                                    .font(.custom(ubuntu: .medium, style: .subheadline))
//////                                    .foregroundColor(.customLightBlack)
//////                            }
//////
//////                        }
//////                        Spacer()
//////                    }
//////                    .padding(.leading, 25)
//////
//////                    Button {
//////
//////
//////                        self.SignupRequest.RegisterWithPhone(name:registerPostString.name,contact:registerPostString.contact,password:registerPostString.password)
//////                       navBarBackButtonIsHidden = true
//////
//////                    } label: {
//////
//////                        Text("Continue")
//////                            .frame(maxWidth: .infinity)
//////                            .filledButton()
//////                            .padding(.horizontal, 7.5)
//////                            .padding(.top, 25)
//////                    }
//////                    .alert(SignupRequest.login_toast_message, isPresented: $SignupRequest.login_toast) {
//////                        HStack{
//////
//////
//////
//////                            Button("Ok", role: .cancel, action: {
//////
//////
//////
//////                            })
//////                        }
//////                    }
//////
//////                    HStack {
//////
//////                        Text("Joined us before? ")
//////                            .font(.custom(ubuntu: .regular, style: .headline))
//////                            .foregroundColor(.customDarkGray)
//////                        Button {
//////                            self.pushToLoginView = true
//////
//////                        } label: {
//////                            Text("Login")
//////                                .textButton()
//////                        }
//////                        NavigationLink("", destination: LoginView(), isActive: $pushToLoginView)
//////                    }
//////                    .padding(.top, 20)
//////                    .padding(.bottom, 15)
//////
//////                }
//////
//////                .padding(.horizontal, 30)
//////
////            }
//////
////            .preferredColorScheme(.light)
//////            .navigationBarTitle("")
////           .navigationBarHidden(true)
//////            .navigationBarBackButtonHidden(true)
////            .navigationBarTitleDisplayMode(.inline)
////            .navigationBarTitle("")
////          .edgesIgnoringSafeArea([.all])
//
//
//
////            .background(Color.customBackground)
//            //.frame(width: ScreenSize.width, height: ScreenSize.height)
//////            .navigationBarItems(leading:
//////                         Button(action: {
//////                self.pushToLoginView = true
//////                         }) {
//////                             Image(icon: .leftArrow)
//////                                 .resizable()
//////                                 .frame(width: 20, height: 20)
//////
//////                         }
//////                     )
//        }
//
//    }
//}
////
//struct SignupView_Previews1: PreviewProvider {
//    static var previews: some View {
//        SignupView()
//    }
//}
