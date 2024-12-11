//
//  StoreProfile.swift
//  raseef
//
//  Created by Teamx tec on 25/10/2022.
//

import SwiftUI
import Combine
import Foundation
struct StoreProfile: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State var shop_id = ""
    @State var pushtoGrid = false
    @ObservedObject var getShopVm = GetShopsBySlugViewModel()
  
    @State var rating = 0.0
    private var gridItemLayout = [GridItem(.flexible())]
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink("",destination: Grid()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoGrid)
           
                GeometryReader { reader in
                   
                                VStack{
                                    
                                VStack(spacing:20){
                                    ZStack{
                                        NavigationLink("",destination:YourLocation()
                                            .navigationBarHidden(true)
                                                       ,isActive: $navbarhome)
                                        NavigationLink("",destination:ContentView()
                                           
                                                       ,isActive: $navbarprofile)
                                        NavigationLink("",destination:StoreProfile()
                                            .navigationBarHidden(true)
                                                       ,isActive: $navbarshop)
                                      NavigationLink("",destination:YourLocation()
                                            .navigationBarHidden(true)
                                                       ,isActive: $navbarnotify)
                                       NavigationLink("",destination:YourLocation()
                                            .navigationBarHidden(true)
                                                       ,isActive: $navbarhome)
                                        
                                        
                                        
                                        
                                        
                                      
                                            
   if let Curl = UserDefaults.standard.string(forKey: "StoreCoverImage")
        
                                         
                                        {
                         AsyncImage(url: URL(string: Curl) ) { image in
                             image
                                 .resizable()
                             // .aspectRatio(contentMode: .fit)

                                 .frame(maxWidth: reader.size.width,maxHeight:reader.size.height * 0.45, alignment: .center)
                                 .cornerRadius(30)
                         } placeholder: {
                             ProgressView()
                                 .frame(maxWidth: reader.size.width,maxHeight:reader.size.height * 0.45)
                         }


                                    }
                                      
                                        else{
                                            Image(icon: .StorePic)
                                                .resizable()
                                                .frame(width: .infinity, height: reader.size.height * 0.4)
                                                .cornerRadius(30)
                                            
                                        }
                                        
                                        HStack{
                                            Button{
                                                self.pushtoGrid.toggle()
                                                
                                            }label:{
                                                Image(icon: .back)
                                                    .resizable()
                                                    .frame(width: 40, height: 40)
                                                
                                            }
                                          
                                         Spacer()
                                             
                                            Image(icon: .plus_with_orange)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                //.offset(x:-150,y:-150)
                                               
                                        }
                                        .frame(width: reader.size.width * 0.86, height: reader.size.height * 0.01)
                                       // .padding(.bottom,110)
                                        .offset(x:0,y:-120)
                                      
                                    }
                                 
                              
                                    HStack(spacing:0){
                                        VStack{
                                            if let lurl = UserDefaults.standard.string(forKey: "StoreLogo")
                                                 
                                                                                  
                                                                                     {
                                                AsyncImage(url: URL(string:lurl)
                                                                                                    , content: { image in
                                                                                             image.resizable()
//                                                                                             .aspectRatio(contentMode: .fit)
                                                    
                                                }, placeholder: { ProgressView() })
                                                .frame(width: 85, height: 85)
                                                                                         
                                                                                     }
                                            else{
                                                Image(icon: .shoplogo)
                                                    .resizable()
                                                    .frame(width: 80, height: 80)
                                            }
                                        }
                                        .padding(.trailing,10)
                                   
                                        VStack(alignment:.leading,spacing:5){
                                                HStack(spacing:50)
                                                                                           {
                                                                                               if let name = UserDefaults.standard.string(forKey: "StoreName")
                                                                                               {
                                                                                                   Text(name)
                                                                                                       .font(.system(size:15))
                                                   
                                                                                                   (Text(Image(icon: .email_orange))+Text("  ")+Text(Image(icon: .location_pin))+Text("  ")+Text("1Km"))
                                                                                                       .font(.system(size:13))
                                                                                                   
                                                                                               }
                                                                                               else{
                                                                                                   Text("HEADLINE TITLE")
                                                                                                       .font(.system(size:15))
                                                   
                                                                                                   (Text(Image(icon: .email_orange))+Text("  ")+Text(Image(icon: .location_pin))+Text("  ")+Text("1Km"))
                                                                                                       .font(.system(size:13))
                                                                                                   
                                                                                               }
                                                                                               
                                                                                           }
                                            //  Spacer()
                                            if let address = UserDefaults.standard.string(forKey: "StoreAddress"),
                                               let rating = UserDefaults.standard.double(forKey: "StoreRating")
                                            {
                                                Text(address)
                                                                                             .font(.system(size:14))
                                                                                             .onAppear{
                                                                                                 self.rating = UserDefaults.standard.double(forKey: "StoreRating")
                                                                                             }
                                                HStack{
                                                 Api_Rating(rating: $rating)
                                                }
//                                                HStack{
////                                                    ForEach(0..<4, id: \.self)
////                                                    {i in
////
////                                                        Image(
////                                                            systemName: rating >= i ?"star":"star.fill")
////                                                        .resizable()
////                                                        .frame(width: 8,height:8)
////
////
////                                                    }
//                                                }
//
                                             
                                            }
                                            else{
                                                Text("Address")
                                                                                             .font(.system(size:14))
                                             
                                                                                         Text("* * * *")
                                                                                             .font(.system(size:10))
                                            }
                                              
                                                
                                            }
                                 
                            }
                                    .frame(width: reader.size.width * 0.8, height: reader.size.height * 0.07)
                                   
                                   .padding(.trailing,reader.size.width * 0.1)
                                  // .padding(.trailing,45)
                            
                                            Store_Categories_List()
                                              
                                    
                                // .padding(.trailing,30)
                              
                                   
                                   
                    
                                }
                               
                                .background(Color(hexadecimal: "fbfbfb"))
                              
                                .shadow(radius: 15)
                                   
                            
                           
                                      Store_Product_List()
//
                            }
                             // .padding(.bottom,350)
                   
              
           
            
        
                    
                }
            
                //.ignoresSafeArea(.keyboard)
                .background(Color(hexadecimal6: 0xF5F5F5))
                
                .toolbar {
          

                    ToolbarItem(placement:.bottomBar)
                    {
                        HStack(spacing:10){
                            
                            
                            
                            Button{
                                
                                self.navbarhome = true
                               
                                self.navbarshop = false
                                self.navbarnotify = false
                                self.navbarprofile = false
                                
//                                if (navbarhome == true)
//                                {
//                                    self.width = 50
//                                    self.height = 50
//                                }
//                                else{
//
//                                    self.width = 50
//                                    self.height = 50
//                                }
//
                            
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
             
           }
            .background(Color(hexadecimal6: 0xF5F5F5))
            .edgesIgnoringSafeArea(.all)

  
                
            
        }
    }
}

struct StoreProfile_Previews: PreviewProvider {
    static var previews: some View {
        StoreProfile()
        
    }
}
