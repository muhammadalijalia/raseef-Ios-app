//
//  Terms_Condition.swift
//  raseef
//
//  Created by Teamx tec on 18/11/2022.
//

import SwiftUI

struct Terms_Condition: View {
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
                    
                    
                    HStack(spacing:100){
                        
                        
                        Button{}label:{
                            Image(icon: .leftArrow)
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        
                      
                        Spacer()
                        
                        
                        
                    }
                    .foregroundColor(Color.white)
                    
                    
                    
                   .padding(.leading,geo.size.width * 0.06)
                    .padding(.vertical,geo.size.height * 0.032)
                    
                    
                    
                   
                        
                    VStack(alignment:.leading,spacing:13){
                        
                        HStack{
                            Text("Terms & Condition")
                             //   .font(.largeTitle)
                                .font(.system(size:30,weight:.bold))
                            
                     Spacer()
                        }
                        ScrollView{
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus massa at nisi aliquam venenatis. Curabitur efficitur augue a metus lacinia rhoncus eget a felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin eget erat est. Vestibulum a nibh enim. Vivamus ac sem eget sapien feugiat fermentum malesuada et lacus. Cras rutrum lorem sit amet elit pretium, sodales pulvinar lacus congue. Ut egestas ultrices pulvinar. Morbi cursus cursus tellus, a porttitor lectus condimentum ac. Quisque posuere arcu vehicula, placerat nulla vel, rhoncus purus. Cras nibh erat, lacinia at viverra vel, cursus quis odio. Pellentesque ex odio, tempor semper luctus vel, tristique non tellus.Suspendisse potenti. Praesent consectetur dui aliquam, egestas arcu vel, cursus nulla. Duis interdum, massa eu rutrum interdum, mauris lacus ultricies augue, et posuere magna eros vel diam.Suspendisse potenti. Praesent consectetur dui aliquam, egestas arcu vel, cursus nulla. Duis interdum, massa eu rutrum interdum,Suspendisse potenti. Praesent consectetur dui aliquam, egestas arcu vel, cursus nulla. Duis interdum, massa eu rutrum interdum, mauris lacus ultricies augue, et posuere magna eros vel diam.Suspendisse potenti. Praesent consectetur dui aliquam, egestas arcu vel, cursus nulla. Duis interdum, massa eu rutrum interdum.")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 16, weight: .regular))
                        }
                    }
                        
                        
                        .padding(.top,100)
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
        }
    }
}

struct Terms_Condition_Previews: PreviewProvider {
    static var previews: some View {
        Terms_Condition()
    }
}
//
//  Terms&Privacy.swift
//  raseef
//
//  Created by Teamx tec on 18/11/2022.
//



