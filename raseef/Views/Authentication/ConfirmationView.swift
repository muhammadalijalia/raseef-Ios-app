////
////  ConfirmationView.swift
////  Multivender
////
////  Created by Teamx tec on 29/09/2022.
////
//
import SwiftUI
//struct NavigationConfigurator: UIViewControllerRepresentable {
//    var configure: (UINavigationController) -> Void = { _ in }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//        UIViewController()
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//        if let nc = uiViewController.navigationController {
//            self.configure(nc)
//        }
//    }
//
//}
struct ConfirmationView: View {
    let screenSize = UIScreen.main.bounds;
    @ObservedObject var SignupRequest = RegisterWithPhone_ViewModel();
    @ObservedObject var registerPostString = RegisterPhoneRequest();
   // @Binding var sms_no : Bool
   //var forgetpassword = ForegtPassword()
    @State private var navBarBackButtonIsHidden: Bool = false
    @State var pushforgetview = false
    @State var pushToLoginView : Bool = false
    @State var PushtoPrivacyPolicy : Bool = false
    @State var PushtoTermsCondition : Bool = false
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) var colorScheme
    @State var pushtoForgetPasswordView = false

    var body: some View {
        GeometryReader { reader in
        NavigationView {
            ZStack(alignment: .top) {
                //                Color(hex: 0xd3d3d5)
                //                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    NavigationLink("",destination: LoginView()
                        .navigationBarHidden(true)
                                   ,isActive: $pushToLoginView)
                    
                    NavigationLink("",destination:ForegtPassword()
                        .navigationBarHidden(true)
                                   ,isActive: $pushforgetview)
//                    NavigationLink("",destination:ForegtPassword()
//                        .navigationBarHidden(true)
//                                   ,isActive: $pushToforgetView)
                    VStack(spacing:20){
                        
                        HStack {
                            
                            Text("Confirmation View")
                                .titleText()
                            Spacer()
                        }
                        .padding(.top, 50)
                        
                        Text("Select which contact details should we use to reset your password:")
                            .smallText()
                        
                        
                        Button {
                            self.pushforgetview = true
                            
                        } label: {
                            VStack{
                                
                                
                                HStack(spacing:20){
                                    
                                    Image(icon: .mobile_model)
                                        .resizable()
                                        .frame(width: 25, height: 50)
                                    
                                    VStack(spacing:05){
                                        Text("via email:")
                                            .padding(.trailing,60)
                                        Text("****@gmail.com")
                                        
                                        
                                    } .smallText()
                                    
                                    
                                    
                                    
                                } .padding(.trailing,100)
                                
                            }
                            
                            .frame(width: screenSize.width * 0.9, height: screenSize.height*0.1, alignment: .center)
                            
                            .background(Color(hex: 0xF5F5F5))
                            
                            .padding(.top,20)
                        }
                        
                        
                        
                    }
                    
                    .padding(.horizontal,10)
                    
                    .padding(.bottom, 40)
                    
                    
                    
                    .navigationBarTitle("")
                    
                    
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
                                        self.pushToLoginView = true
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
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("")
                   
                    .onTapGesture
                    {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
                   
            }
       
                
            }
              }

      }
   
    }

//
struct ConfirmationView_Previews1: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
