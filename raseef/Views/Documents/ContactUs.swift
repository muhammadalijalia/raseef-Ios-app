//
//  ContactUs.swift
//  raseef
//
//  Created by Teamx tec on 18/11/2022.
//

import SwiftUI
import Combine
struct AdaptsToKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.currentHeight)
                .onAppear(perform: {
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
                        .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
                        .compactMap { notification in
                            withAnimation(.easeOut(duration: 0.16)) {
                                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                            }
                    }
                    .map { rect in
                        rect.height - geometry.safeAreaInsets.bottom
                    }
                    .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                    
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
                        .compactMap { notification in
                            CGFloat.zero
                    }
                    .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                })
        }
    }
}

extension View {
    func adaptsToKeyboard() -> some View {
        return modifier(AdaptsToKeyboard())
    }
}
struct ContactUs: View {
    @State var name = ""
    @State var email  = ""
    @State var subject = ""
    @State var Message = ""
    
    ///
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    var body: some View {
        
        NavigationView {
            ScrollView{
                ZStack(alignment: .top) {
                    Color.white
                    
                    
                    VStack(spacing:20){
                        
                        //                           Rectangle()
                        //                               .frame(height: 0)
                        //                               .background(
                        //                                Image(icon: .navbar)
                        //                                    .resizable()
                        //                                    .frame(width: 420, height: 100)
                        //                                   // .ignoresSafeArea()
                        //
                        //                               )
                        
                        
                        //when appply this image frame and set ignore outside
                        //.frame(width: 420, height: 250)
                        //.ignoresSafeArea()
                        
                        
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Your Name")
                            
                            TextField("", text: $name)
                                .padding(5)
                                .modifier(FieldsModifier())
                        }
                        
                        VStack(alignment:.leading, spacing:5){
                            Text("Your Email Address")
                            
                            TextField("", text: $email)
                                .padding(5)
                                .modifier(FieldsModifier())
                        }
                        VStack(alignment:.leading, spacing:5){
                            Text("Subject")
                            
                            TextField("", text: $subject)
                                .padding(5)
                                .modifier(FieldsModifier())
                            
                        }
                        VStack(alignment:.leading, spacing:5){
                            Text("Username")
                            TextField("", text: $Message)
                                .padding(40)
                                .modifier(FieldsModifier())
                        }
                        
                        
                        
                        VStack(alignment: .center){
                            Button{}label:{
                                
                                Text("Submit")
                                
                            }
                            .frame(maxWidth:300)
                            .filledButton()
                            .padding(.top,20)
                           
                        }
                        
                        
                        
                        
                        
                    }
                    
                    .padding(.horizontal, 30)
                    .padding(.top, 15)
                    .toolbar{
                        
                        ToolbarItem(placement: .principal)
                        {
                           
                            ZStack{
                               
                                Image(icon: .navbar)
                                    .resizable()
                                   
                                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.14)
                                    .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                    .ignoresSafeArea()
                                    .padding(.bottom, 25)
                                 
                                    .overlay(
                                        HStack{
                                            
                                            Image(icon: .leftArrow)
                                            Spacer()
                                            Text("Contact Us")
                                                .font(.system(size: 18))
                                            Spacer()
                                        }
                                            .foregroundColor(Color.white)
                                            .padding(.horizontal,30)
                                            .padding(.top, 20)
                                    )
                            }
                        }
                        
                    }
                  // .ignoresSafeArea(.keyboard)
                   // .adaptsToKeyboard()
                }
            }
           
             
        
        }
//        GeometryReader{geo in
//            NavigationView{
//                ZStack(alignment:.top) {
//
//                       // Color.clear
//                        Image(icon: .navbar)
//                            .resizable()
//                            .frame(width: geo.size.width, height:100)
//                            .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
//                            .ignoresSafeArea()
//
//
//
//
//
//                    HStack(spacing:0){
//
//
//                        Button{}label:{
//                            Image(icon: .leftArrow)
//                                .resizable()
//                                .frame(width: 15, height: 15)
//                        }
//
//
//
//                        Spacer()
//
//                        Text("CONTACT US")
//                            .font(.system(size: 20,weight: .regular))
//
//                        Spacer()
//                        Text("")
//                            .hidden()
//
//                    }
//                    .foregroundColor(Color.white)
//
//                    .ignoresSafeArea(.keyboard)
//
//                   .padding(.horizontal,geo.size.width * 0.07)
//                    .padding(.vertical,geo.size.height * 0.03)
//
//
//
//
//
//                    VStack(spacing:40){
//                        VStack(spacing:18)
//                        {
//                            VStack(alignment:.leading, spacing:5){
//                                Text("Your Name")
//
//                                TextField("", text: $name)
//                                    .padding(5)
//                                    .modifier(FieldsModifier())
//                            }
//
//                            VStack(alignment:.leading, spacing:5){
//                                Text("Your Email Address")
//
//                                TextField("", text: $email)
//                                    .padding(5)
//                                    .modifier(FieldsModifier())
//                            }
//                            VStack(alignment:.leading, spacing:5){
//                                Text("Subject")
//
//                                TextField("", text: $subject)
//                                    .padding(5)
//                                    .modifier(FieldsModifier())
//
//                            }
//                            VStack(alignment:.leading, spacing:5){
//                                Text("Username")
//                                TextField("", text: $Message)
//                                    .padding(40)
//                                    .modifier(FieldsModifier())
//                            }
//
//
//
//
//                        }
//
//                        VStack(alignment: .center){
//                            Button{}label:{
//
//                                Text("Submit")
//
//                            }
//                            .frame(maxWidth:300)
//                            .filledButton()
//
//                        }
//                    }
//
//
//
//                        .padding(.top,100)
//                        .padding(.horizontal,20)
//                        .adaptsToKeyboard()
//
//
//
//
//                }
//
//                .toolbar {
//
//                    ToolbarItem(placement:.bottomBar)
//                    {
//                        HStack(spacing:10){
//
//
//
//                            Button{
//
//                                self.navbarhome = true
//
//                                self.navbarshop = false
//                                self.navbarnotify = false
//                                self.navbarprofile = false
//
//
//                            }label: {
//                                VStack{
//                                    Image(icon: .home_g)
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//
//                                    Text("Home")
//                                       .opacity(self.navbarhome ? 1 : 0)
//                                    //   .hidden(navbarhome)
//                                }
//
//                                .foregroundColor(self.navbarhome ?  Color(hex: 0xFA6109) : .gray)
//                                //                               .framenavbar(width:  self.width , height:  self.height)
//                                .frame(width: 65, height:  65)
//
//                                .background(self.navbarhome ? Color(hex:0xffefe6) : .white)
//
//                               .cornerRadius(25)
//
//                            }
//
//
//
//
//
//
//                            Button{
//                                self.navbarhome = false
//                                self.navbarshop = false
//                                self.navbarnotify = false
//                                self.navbarprofile = true
//
//                            }label:{
//                                VStack{
//                                    Image(icon: .profile_g)
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//
//                                    Text("profile")
//                                        .opacity(self.navbarprofile ? 1 : 0)
//
//                                }   .foregroundColor(self.navbarprofile ? Color(hex: 0xFA6109) : .gray)
//                                    .frame(width: 65, height:  65)
//
//                                    .background(self.navbarprofile ? Color(hex:0xffefe6) : .white)
//
//                                   .cornerRadius(25)
//
//                            }
//
//
//
//                            Button{
//
//                                self.navbarhome = false
//                                self.navbarshop = true
//                                self.navbarnotify = false
//                                self.navbarprofile = false
//                            }label: {
//                                VStack{
//                                    Image(icon: .bag_g)
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//
//                                    Text("shopping")
//                                        .opacity(self.navbarshop ? 1 : 0)
//
//
//                                }
//                                .foregroundColor(self.navbarshop ?  Color(hex: 0xFA6109) : .gray)
//                                .frame(width: 65, height:  70)
//
//                                .background(self.navbarshop ? Color(hex:0xffefe6) : .white)
//
//                               .cornerRadius(25)
//                            }
//
//
//
//
//                            Button{
//                                self.navbarhome = false
//                                self.navbarshop = false
//                                self.navbarnotify = true
//                                self.navbarprofile = false
//
//                            }label: {
//                                VStack{
//                                    Image(icon: .notification_g)
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//
//                                    Text("notification")
//                                        .opacity(self.navbarnotify ? 1 : 0)
//
//
//                                }   .foregroundColor(self.navbarnotify ? Color(hex: 0xFA6109) : .gray)
//                                    .frame(width: 70, height:  70)
//
//                                    .background(self.navbarnotify ? Color(hex:0xffefe6) : .white)
//
//                                   .cornerRadius(25)
//                            }
//
//
//
//
//
//
//                        }
//
//                        .font(.system(size:12))
//
//                        .padding([.leading,.trailing],70)
//                        // 0 hiden 30
//
//                        .padding(.top,10)
//                        .padding(.bottom,20)
//                    //    .frame(width:4400,height:00)
//                       .background(Color.white)
//                       .padding(.top,0)
//                       .padding(.bottom,0)
//
//                    }
//                        }
//
//                .background(Color(hexadecimal6: 0xF5F5F5))
//
//            }
//
//        }
    }
}

struct ContactUs_Previews: PreviewProvider {
    static var previews: some View {
        ContactUs()
    }
}
