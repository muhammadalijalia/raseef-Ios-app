//import SwiftUI
////import CocoaTextField
//import SwiftUIX
//
////import OneTimeCodeTextField
//
//public struct OTPTextFieldView: View {
//    
//    var maxDigits: Int = 6
//    @State private var timeRemaining = 300
//    //  @State var pin: String = ""
//    @State var isDisabled = false
//    @State var pushToConfirmationView = false
//    @ObservedObject var otp_forget_PostString = OtpForgetPasswordReq()
//    @ObservedObject var otpVM = OtpViewModel()
//    @ObservedObject var otp_Signup_PostString = VerifyotpRequest()
//   // @ObservedObject var otpPostString = OtpForgetPasswordReq()
//    var handler: (String, (Bool) -> Void) -> Void
//    //@ObservedObject var FVm = ForgetViewModel()
//    @ObservedObject var Rvm = RegisterWithPhone_ViewModel()
//    @ObservedObject var registerPostString = RegisterPhoneRequest();
//    @StateObject var otp_token = OTPRESPONSE()
//    @State var pushtoforgetView = false
//    @State var pushtosignupView  = false
//    @ObservedObject var FVm = ForgetViewModel()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    let  ReuqestFromRegistrationViewModel = UserDefaults.standard.bool(forKey: "ReuqestFromRegistration");
//  //  @State var PushToResetView = false
//    
//    public var body: some View {
//        
//        GeometryReader { reader in
//            
//            NavigationView{
//                ZStack(alignment: .top) {
//                    NavigationLink("",destination: ResetPassword()
//                        .navigationBarHidden(true)
//                        .navigationBarTitle("")
//                                   ,isActive: $otpVM.PushToResetView)
////                    NavigationLink("",destination: ResetPassword()
////                        .navigationBarHidden(true)
////                        .navigationBarTitle("")
////                                   ,isActive: $PushToResetView)
//                    
//                    NavigationLink("",destination: LoginView()
//                        .navigationBarHidden(true)
//                        .navigationBarTitle("")
//                                   ,isActive: $otpVM.PushToLoginView)
////                    NavigationLink("",destination: ForegtPassword()
////                        .navigationBarHidden(true)
////                                   ,isActive: $pushtoforgetView)
////                    NavigationLink("",destination: SignupView()
////                        .navigationBarHidden(true)
////                                   ,isActive: $pushtosignupView)
//                    
//                    ScrollView(showsIndicators: false) {
//                        
//                        VStack(alignment:.center, spacing: 20) {
//                            
//                            
//                            HStack {
//                                Text("ENTER RECOVERY CODE")
//                                    .titleText()
//                                Spacer()
//                            }
//                            .padding(.top, 40)
//                            
//                            HStack {
//                                Text("The reovery code was sent to your mobile number, please enter the code:")
//                                    .padding(.top, 2)
//                                
//                                    .multilineTextAlignment(.leading)
//                                    .font(.custom(opensans: .italic1, style: .headline))
//                                    .foregroundColor(.customDarkGray)
//                                
//                                Spacer()
//                            }
//                            .lineLimit(2)
//                            ZStack {
//                                pinDots
//                                backgroundField
//                                
//                            }
//                            
//                            
//                            
//                            
//                            Text("Resend OTP in "+getTimer()+" seconds")
//                                .font(.custom(opensans: .italic1, style: .body))
//                                .foregroundColor(.customDarkGray)
//                                .background(Color.clear)
//                                .padding(.top, 7)
//                                .padding(.bottom, 8)
//                            
//                                .padding()
//                                .onReceive(timer) { _ in
//                                    if timeRemaining > 0 {
//                                        timeRemaining -= 1
//                                    }
//                                }
//                            Button {
//                                self.timeRemaining = 300
//                         
//                                
//                                
//                                if (ReuqestFromRegistrationViewModel == true)
//                                {
//                                    let phone_number =  UserDefaults.standard.string(forKey: "phone_number")
//                                    self.Rvm.RegisterWithPhone(name:registerPostString.name,email:registerPostString.email,contact:registerPostString.contact,password:registerPostString.password)
//                                    
//                                }
//                                else
//                                {
//                                    let forget_email = UserDefaults.standard.string(forKey: "forgetEmail")
//                                    
//                                    FVm.forget(email: forget_email!)
//                                    
//                                    
//                                }
//                                
//                                
//                                //print("Digits"+self.getDigits(at: index))
//                                //print("SubmitPin()"+self.submitPin)
//                                
//                                
//                            }label: {
//                                Text("Resend Again?")
//                                    .padding(.bottom, 20)
//                                    .font(.custom(opensans: .italic1, style: .body))
//                                //                        .foregroundColor(otpVM.resendCodeCounter == 0 ? .customForeground : .customGray)
//                                    .background(Color.clear)
//                            }
//                            .disabled(timeRemaining == 0 ? false : true)
//                            Button {
//                              
//                            //maybe based on reg view model condition if not run
//                                ///CHECK OTP OF Register
//                                
//                             self.otpVM.VeryOtp(token:otp_token.token)
//                            
//                                
//                                
//                                ///CHECK OTP OF RESET PASSWORD
//                                
//                                
//                                
//                       
//                                
//                            
//                             //   PushToResetView.toggle()
//                                
//                            } label: {
//                                Text("Verify")
//                                //                    .frame(width: 200, height: 30 ,alignment: .center)
//                                    .padding([.leading,.trailing], 60)
//                                    .filledButton()
//                                
//                                
//                                // .padding(.top, 10)
//                            }
//                            .frame(width: 300, height: 50, alignment: .center)
//
//                        }
//                        .padding(.horizontal,10)
//                        .frame(width: reader.size.width, height: reader.size.height * 0.6)
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
////                                            print(otpVM.PushToResetView)
////                                            print(otpVM.PushToLoginView)
////                                            let frogetview = UserDefaults.standard.bool(forKey: "requestfromforgetview")
////
////                                            if frogetview{
////                                                self.pushtoforgetView = true
////                                            }
////                                            else{
////
////                                                self.pushtosignupView = true
////                                            }
//                                           
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
//                    }   .navigationBarTitle("")
//                }
//            }
//        }
//        .onTapGesture {
//
//            self.endTextEditing()
//            self.hideKeyboard()
//        }
//        
//     //  .ignoresSafeArea(.keyboard, edges: .bottom)
//       .ignoresSafeArea(.keyboard)
//        //.padding(.horizontal, 30)
//     //  .ignoresSafeArea(.keyboard, edges: .bottom)
//    }
//    
//    private var pinDots: some View {
//        HStack(spacing:15) {
//            ForEach(0..<maxDigits) { index in
//                ZStack {
//                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(.white)
//                    .padding()
//                        .background(RoundedRectangle(cornerRadius: 5)            .stroke(Color(.lightGray), lineWidth: 1))
//                        .frame(width: 30, height: 40)
//                    
//                    
//                    Text(self.getDigits(at: index))
//                        .font(.system(size: 25, weight: .thin, design: .default))
//                }
//                
//
//            }
//        }
//     
//        //.ignoresSafeArea(.keyboard)
//        .padding(.horizontal)
//    }
//    
//    private var backgroundField: some View {
//        let boundPin = Binding<String>(get: { self.otp_token.token }, set: { newValue in
//            self.otp_token.token = newValue
//            self.submitPin()
//            
//        })
//        
//        return CocoaTextField("", text: boundPin, onCommit: submitPin)
//         
//            .keyboardType(.numberPad)
//           // .isFirstResponder(true)
//            .foregroundColor(.clear)
//            .accentColor(.clear)
//            
//           
//            
//      
//
//    }
//    
//    
//
//    private func submitPin() {
//        guard self.otp_token.token.isEmpty else {
//            return
//        }
//        
//        if self.otp_token.token.count == maxDigits {
//            isDisabled = true
//            
//            handler(self.otp_token.token) { isSuccess in
//                if isSuccess {
//                    print("pin matched, go to next page, no action to perfrom here")
//                } else {
//                    self.otp_token.token = ""
//                    isDisabled = false
//                    print("this has to called after showing toast why is the failure")
//                }
//            }
//        }
//        
//        // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
//        // max digits, we remove the additional characters and make a recursive call.
//        if self.otp_token.token.count > maxDigits {
//            self.otp_token.token = String(self.otp_token.token.prefix(maxDigits))
//            submitPin()
//        }
//    }
//    
//    private func getDigits(at index: Int) -> String {
//        if index >= self.otp_token.token.count {
//            return ""
//        }
//        
//            return self.otp_token.token.digits[index].numberString
//    }
//    func getTimer() -> String{
//            let minutes = Int(timeRemaining) / 60 % 60
//            let seconds = Int(timeRemaining) % 60
//            return String(format:"%02i:%02i", minutes, seconds)
//        }
//}
//
//extension String {
//    
//    var digits: [Int] {
//        var result = [Int]()
//        
//        for char in self {
//            if let number = Int(String(char)) {
//                result.append(number)
//            }
//        }
//        
//        return result
//    }
//    
//}
//
//
//
//extension Int {
//    
//    var numberString: String {
//        
//        guard self < 10 else { return "0" }
//        
//        return String(self)
//    }
//}
//extension View {
//  func endTextEditing() {
//    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
//                                    to: nil, from: nil, for: nil)
//  }
//}
//extension View{
//func hideKeyboard() {
//    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//}
//}
//struct PasscodeField_Previews1: PreviewProvider {
//    static var previews: some View {
//        OTPTextFieldView { otp, completionHandler in }
//    }
//}
