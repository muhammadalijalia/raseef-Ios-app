//
//  Setting.swift
//  raseef
//
//  Created by Teamx tec on 17/11/2022.
//

import SwiftUI

struct Setting: View {
    @State var name = ""
    
    @State var showsDatePicker = false
    @State var dates = ""
    @State var CVC = ""
    
    ////
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    
    ///
@State var toggleOn =  false
    var body: some View{
        GeometryReader{geo in
            NavigationView{
                ZStack(alignment:.top) {
                    Color.clear
                    Image(icon: .navbar)
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height * 0.14)
                        .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                    
                        .ignoresSafeArea(edges:.top)
                    
                    
                    HStack(spacing:100){
                        
                        
                        Button{}label:{
                            Image(icon: .leftArrow)
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        
                        
                        Text("SUPPORT")
                            .font(.title2)
                            ///.font(.system(size: 18,weight:.heavy))
                        
                        // Spacer()
                        //                                Text("MESSAGE")
                        //                                    .hidden()
                        
                        
                        
                        
                    }
                    .foregroundColor(Color.white)
                    
                    
                    
                    .padding(.trailing,geo.size.width * 0.31)
                    .padding(.vertical,geo.size.height * 0.032)
                    
                    
                    
                   
                        
                        VStack(alignment:.leading,spacing:13){
                            Group{
                            
                                Button{}label:{
                                    HStack(spacing:20){
                                        Image(systemName: "network")
                                            .resizable()
                                            .frame(width:25,height: 25)
                                        
                                        Text("Language")
                                        
                                    }}
                                .foregroundColor(Color.orange)
                            Divider()
                            HStack(spacing:20){
                                Image(icon: .notification_g)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width:25,height: 25)
                                    .foregroundColor(Color.orange)
                                Text("Notification")
                                
                                Spacer()
                                
                                Toggle("", isOn: $toggleOn)
                                               .toggleStyle(SwitchToggleStyle(tint: .green))
                            }
                            Divider()
                            HStack(spacing:20){
                                Image(icon: .star)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width:25,height: 25)
                                    .foregroundColor(Color.orange)
                                
                                Text("Rate Our App")
                                
                            }
                            Divider()
                            
                            HStack(spacing:20){
                                Image(icon: .faq)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width:25,height: 25)
                                    .foregroundColor(Color.orange)
                                
                                Text("FAQ")
                                
                            }
                            Divider()
                            
                            HStack(spacing:20){
                                Image(icon: .faq)
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width:25,height: 25)
                                    .foregroundColor(Color.orange)
                                
                                Text("About us")
                                
                            }
                            Divider()
                            
                       
                            
                      
                        }
                            Group{
                                HStack(spacing:20){
                                    Image(icon: .faq)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(Color.orange)
                                    
                                    Text("Terms & Conditions")
                                    
                                }
                                Divider()
                                HStack(spacing:20){
                                    Image(icon: .faq)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(Color.orange)
                                    
                                    Text("Privacy Policy")
                                    
                                }
                                Divider()
                                
                                HStack(spacing:20){
                                    Image(icon: .faq)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width:25,height: 25)
                                        .foregroundColor(Color.orange)
                                    
                                    Text("Contact Us")
                                    
                                }
                                Divider()
                            }
                            
                        }
                        
                        
                        .padding(.top,100)
                        .padding(.horizontal,30)
                        
                   
                    
                  
                }
                .toolbar {

                    ToolbarItem(placement:.bottomBar)
                    {
                        HStack(spacing:10){



                            Button{

                                self.navbarhome = true

                                self.navbarshop = false
                                self.navbarnotify = false
                                self.navbarprofile = false


                            }label: {
                                VStack{
                                    Image(icon: .home_g)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 30, height: 30)

                                    Text("Home")
                                       .opacity(self.navbarhome ? 1 : 0)
                                    //   .hidden(navbarhome)
                                }

                                .foregroundColor(self.navbarhome ?  Color(hex: 0xFA6109) : .gray)
                                //                               .framenavbar(width:  self.width , height:  self.height)
                                .frame(width: 65, height:  65)

                                .background(self.navbarhome ? Color(hex:0xffefe6) : .white)

                               .cornerRadius(25)

                            }






                            Button{
                                self.navbarhome = false
                                self.navbarshop = false
                                self.navbarnotify = false
                                self.navbarprofile = true

                            }label:{
                                VStack{
                                    Image(icon: .profile_g)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 30, height: 30)

                                    Text("profile")
                                        .opacity(self.navbarprofile ? 1 : 0)

                                }   .foregroundColor(self.navbarprofile ? Color(hex: 0xFA6109) : .gray)
                                    .frame(width: 65, height:  65)

                                    .background(self.navbarprofile ? Color(hex:0xffefe6) : .white)

                                   .cornerRadius(25)

                            }



                            Button{

                                self.navbarhome = false
                                self.navbarshop = true
                                self.navbarnotify = false
                                self.navbarprofile = false
                            }label: {
                                VStack{
                                    Image(icon: .bag_g)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 30, height: 30)

                                    Text("shopping")
                                        .opacity(self.navbarshop ? 1 : 0)


                                }
                                .foregroundColor(self.navbarshop ?  Color(hex: 0xFA6109) : .gray)
                                .frame(width: 65, height:  70)

                                .background(self.navbarshop ? Color(hex:0xffefe6) : .white)

                               .cornerRadius(25)
                            }




                            Button{
                                self.navbarhome = false
                                self.navbarshop = false
                                self.navbarnotify = true
                                self.navbarprofile = false

                            }label: {
                                VStack{
                                    Image(icon: .notification_g)
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 30, height: 30)

                                    Text("notification")
                                        .opacity(self.navbarnotify ? 1 : 0)


                                }   .foregroundColor(self.navbarnotify ? Color(hex: 0xFA6109) : .gray)
                                    .frame(width: 70, height:  70)

                                    .background(self.navbarnotify ? Color(hex:0xffefe6) : .white)

                                   .cornerRadius(25)
                            }






                        }

                        .font(.system(size:12))

                        .padding([.leading,.trailing],70)
                        // 0 hiden 30

                        .padding(.top,10)
                        .padding(.bottom,20)
                    //    .frame(width:4400,height:00)
                       .background(Color.white)
                       .padding(.top,0)
                       .padding(.bottom,0)

                    }
                        }
                .background(Color(hexadecimal6: 0xF5F5F5))
                
            }
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
