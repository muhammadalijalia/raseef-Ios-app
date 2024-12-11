////
////  Login_VIew.swift
////  raseef
////
////  Created by Teamx tec on 02/11/2022.
////
//
//import Foundation
//
//import SwiftUI
//
//struct Login_View: View {
//    let screenSize = UIScreen.main.bounds;
//    @ObservedObject var networkcall : NetworkCall = NetworkCall()
//    @ObservedObject var LoginPostString = LoginRequest();
//   
//    @State private var navBarBackButtonIsHidden: Bool = false
//    @State var pushToLoginView : Bool = false
//    @State var pushToConfirmationView = false
//    @State var pushToSignUpView = false
//    @State var PushtoPrivacyPolicy : Bool = false
//    @State var PushtoTermsCondition : Bool = false
//    @State var checked = false
//    @Environment(\.presentationMode) var presentation
//    enum FocusField: Hashable {
//        case field
//      }
//
//      @FocusState private var focusedField: FocusField?
//
//    var body: some View {
//       
//        NavigationView{
//            ScrollView(showsIndicators: false) {
//            
//            ZStack{
//                NavigationLink("",destination: YourLocation()
//                             .navigationTitle("")
//                             .navigationBarBackButtonHidden(true)
//
//                        ,isActive:
//                      $networkcall.isDashboardViewPresented)
//                            NavigationLink("", destination: Signup_View()
//                                            .navigationBarHidden(true)
//                                             .navigationBarTitle("")
//
//                                           , isActive: $pushToSignUpView)
////                NavigationLink("", destination: Confirmation_View()
////                  .navigationTitle("")
////                  .navigationBarHidden(true)
////                               , isActive: $pushToConfirmationView)
//                NavigationLink("", destination: ForgetPassword_View()
//                  .navigationTitle("")
//                  .navigationBarHidden(true)
//                               , isActive: $pushToConfirmationView)
//         
//                      Image(icon: .Splash)
//                       .resizable()
//                       .cornerRadius(50)
//                   
//                  
//
//                .frame(width: screenSize.width,height: screenSize.height*0.45)
//                .padding(.bottom,700)
//                .edgesIgnoringSafeArea(.all)
//                .offset(y:-20)
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
//                            .shadow(color: Color.gray, radius: 20, x: 0, y: 0)
//                            .frame(width: screenSize.width*0.92, height: screenSize.height*0.67)
//                            .padding(.bottom,180)
//                           
//                          VStack {
//                              
//                              HStack {
//                                  Text("Login")
//                                      .titleText()
//                                 
//                                  
//                                   
//                              }
//                              .padding(.top, 65)
//                              
//                              VStack{
//                           Text("Email Address / Phone Number")
//                                  .smallText()
//                                 // .offset(x:-105)
//                                  .padding(.horizontal,-150)
//                                  .padding(.top,20)
////                                  EmailText(icon: .mobile_model, placeHolder: "Email address / Mobile number",email: $LoginPostString.email)
////                                  .keyboardType(.emailAddress)
////                                  .textContentType(.emailAddress)
////                                  .padding(.top, 0)
//                        
//                                  Login(icon: .mobile_model, placeHolder: "Email address / Mobile number",login_email: $LoginPostString.email)
//                      
//                             Text("Password")
//                                  .smallText()
//                                 // .offset(x:-105)
//                                  .padding(.horizontal,-150)
//                                  .padding(.top,20)
//                                  Login_p(placeHolder:"Password",login_password: $LoginPostString.password)
//                                      .keyboardType(.default)
//                                    
//                                  .padding(.top, 0)
//                                  .focused($focusedField, equals: .field)
//                              
//                              
//                              }
//                              HStack {
//                                  Image(systemName: checked ? "checkmark.square.fill" : "square")
//                                             .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
//                                             .onTapGesture {
//                                                 self.checked.toggle()
//                                             }
//                                  Text("Remember me")
//                                  Spacer()
//                                  Button {
//                                      pushToConfirmationView.toggle()
//                                  } label: {
//                                      Text("Forgot Password?")
//                                          .font(.custom(opensans: .italic2, style: .subheadline))
//                                          .foregroundColor(Color(hex: 0xFA6109
//))
//                                          .background(Color.clear)
//                                  }
//                                  .padding(5)
////                                  .fullScreenCover(isPresented: $pushToConfirmationView, content: ConfirmationView.init)
//                              }
//                              .padding(.bottom, 0)
//                              
//                              Button {
//                                  self.networkcall.login(email:LoginPostString.email,password:LoginPostString.password)
///// NEW USER
//                                  
//                                
//                                
//                              } label: {
//                                  
//                                  Text("Log In")
//                                      .frame(maxWidth: .infinity)
//                                      .filledButton()
//                                      .padding(.horizontal, 7.5)
//                                      .padding(.top, 25)
//                 
//                                  
//                              }
//                              .fullScreenCover(isPresented:  $networkcall.isDashboardViewPresented, content: YourLocation.init)
//                              .alert(networkcall.login_toast_message, isPresented: $networkcall.login_toast) {
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
//                                  Text("Or Sign in with ")
//                                      .font(.custom(opensans: .italic1, style: .headline))
//                                      .foregroundColor(.customDarkGray)
//                              
//                        
//                              }
//                              .padding(.top, 30)
//                              .padding(.bottom, 30)
//                              HStack(spacing:30) {
//                              //    Spacer()
//                        
//                                    
//                                    
//                                        Button {
//    
//                                        } label: {
//                                            Image(icon: .facebook)
//                                                .padding([.top,.bottom],5)
//                                                .padding([.leading,.trailing],15)
//                                                .border(.gray, width: 1)
//                                        }
//                                    
//                              
//                                  Button {
//                             
//                                  } label: {
//                                      Image(icon: .google)
//                                          .padding(5)
//                                          .border(.gray, width: 1)
//                                  }
//                                  
//                                  Button {
//                       
//                                  } label: {
//                                      Image(icon: .facebook)
//                                          .padding([.top,.bottom],5)
//                                          .padding([.leading,.trailing],15)
//                                          .border(.gray, width: 1)
//                                  }
//                                  
//                               
//                              }
//                              HStack{
//                              Text("Don't have an account?")
//                              
//                                  Button{
//                                      
//                                      self.pushToSignUpView = true
//                                  }label:{
//                                      Text("SignUp")
//                                  }
////                                  .fullScreenCover(isPresented: $pushToSignUpView, content: SignupView.init)
//                              }
//                              .padding(.top,15)
//                             // .padding(.horizontal, 60)
//                          }
//                          
//                          .padding(.horizontal, 40)
//                          .padding(.bottom,270)
//                          
//
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
//            }
//            .navigationBarHidden(true)
//                //.edgesIgnoringSafeArea(.all)
//            .ignoresSafeArea()
//        }
//      
//     
//            
//
//        
//   
//    }
//}
////
//struct Login_View_Previews1: PreviewProvider {
//    static var previews: some View {
//        Login_View()
//    }
//}
