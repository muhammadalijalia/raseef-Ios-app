//
//  Rate_Our_App.swift
//  raseef
//
//  Created by Teamx tec on 18/11/2022.
//

import SwiftUI


struct Rate_Our_App: View {
   
    @State private var rating : Double = 0.0
    var body: some View {
        GeometryReader{geo in
            NavigationView{
                ZStack(alignment:.top) {
                    Color.clear
                    Image(icon: .navbar)
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height * 0.14)
                        .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                    
                        .ignoresSafeArea(edges:.top)
                    
                    
                    HStack(spacing:0){
                        
                        
                        Button{}label:{
                            Image(icon: .leftArrow)
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        
                      
                        Spacer()
                        
                        Text("RATE OUR APP" )
                            .font(.system(size: 20,weight: .regular))
                        Spacer()
                        Text("")
                            .hidden()
                    }
                    .foregroundColor(Color.white)
                    
                    
                    
                   .padding(.horizontal,geo.size.width * 0.07)
                    .padding(.vertical,geo.size.height * 0.032)
                 
                    
                    
                    
                   
                        
                    VStack(spacing:25){
                        
                        Image(icon: .AppRate)
                            .resizable()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.5)
                            .border(.red, width: 1, cornerRadius: 10)
                        
                        Text("How Would You Rate Our App\n\t\t Experience ?")
                            .font(.system(size: 18,weight: .semibold))
                        HStack{
                            Api_Rating(rating: $rating)
                               
                        }
//                        Text(rating != nil ? "Your rating is :\(rating!)" : "")
//                            .hidden()
//                        Button("Review the app") {
//                                 requestReview()
//                             }
                        
                        Button{}label:{
                            
                            Text("Submit")
                                .frame(maxWidth:250)
                                .filledButton()
                        }
                    }
                        
                        
                        .padding(.top,80)
                        .padding(.horizontal,30)
                        
                        
                   
                    
                  
                }
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
                
                .background(Color(hexadecimal6: 0xF5F5F5))
                
            }
        }    }
}

struct Rate_Our_App_Previews: PreviewProvider {
    static var previews: some View {
     Rate_Our_App()
    }
}
