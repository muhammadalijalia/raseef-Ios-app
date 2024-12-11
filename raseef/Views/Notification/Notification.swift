//
//  Notification.swift
//  raseef
//
//  Created by Teamx tec on 17/11/2022.
//

import SwiftUI

struct Notification: View {
    @State var name = ""
    
    @State var showsDatePicker = false
    @State var dates = ""
    @State var CVC = ""
    
    ////
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @ObservedObject var noti_VM = NotificationViewModel()
    @ObservedObject var ext = Extensions()
    var body: some View{
        NavigationView{
        GeometryReader{geo in
         ScrollView{
                        LazyVStack(alignment:.leading){
                            
                            ForEach(noti_VM.notifications,id:\.id)
                            { notify in
                                HStack{
                                    Circle()
                                        .fill(.orange)
                                        .overlay(
                                            
                                            Image(icon: .notification)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        )
                                        .frame(height:  50)
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text(notify.docDescription ?? "Your order has been placed successfully")
                                        
                                    
                                        Text(ext.timeAgo(time: notify.createdAt ?? "2022-12-05T07:07:15.933Z"))
                                    }.font(.system(size: 16))
                                        .padding(.horizontal,5)
                                }
                                Divider()
                            }
                            
                            
                        }
                        
                    }
                    
                    .padding(.horizontal,geo.size.width * 0.05)
                    
                    .toolbar{
                        
                        ToolbarItem(placement: .principal)
                        {
                           
                            ZStack{
                               
                                Image(icon: .navbar)
                                    .resizable()
                                   
                                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                                    .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                    .ignoresSafeArea()
                                    .padding(.bottom, 30)
                                 
                                    .overlay(
                                        HStack{
                                            
                                            Image(icon: .leftArrow)
                                            Spacer()
                                            Text("Notification")
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
                .onAppear{
                    let user_id = "636d3bc88994f221ac889ce4"
                    Task
                    {
                        
                        await
                        noti_VM.getNotifications(user_id:user_id)
                    }
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


struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
