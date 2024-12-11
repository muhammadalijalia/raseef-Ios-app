//
//  YourLocation.swift
//  raseef
//
//  Created by Teamx tec on 24/10/2022.
//

import SwiftUI
import MapKit
import SwiftUIMapView
struct YourLocation: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State private var hovered = false
    @State private var currentLocation = CLLocationCoordinate2D()
    @State var grid = false
    @State var pushtoLoginView = false

    @State var searchText = ""
    @StateObject private var shopListVM = ShopListViewModel()
    @State var pushtoGridView = false
    
    var body: some View {
    
        NavigationView{
            
            
            ZStack() {
                  NavigationLink("",destination: Grid()
                      .navigationBarHidden(true)
  
            ,isActive: $pushtoGridView)
               

               NavigationLink("",destination: LoginView()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoLoginView)
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
                
          
                GeometryReader { reader in
                    Image(icon: .navbar)
                        .resizable()

                        .frame(width: reader.size.width * 1,height: reader.size.height * 0.13, alignment: .top)
                        .overlay(
                        Text("Your Location")
                            .offset(y:30)
                            .font(.system(size:20,weight:.bold))
                            .foregroundColor(Color.white)
                        )
                        .ignoresSafeArea()


                }
               
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                             self.pushtoLoginView = true
                        }label:{
                            Image(icon: .leftArrow)
                            //.font(.largeTitle.bold())
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.top,10)
                        
               
                        
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                             self.pushtoGridView = true
                        }label:{
                            Image(systemName: "square.grid.3x3")
                                
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                    }

                    ToolbarItem(placement:.bottomBar)
                    {
                        HStack(spacing:11){
                            
                            
                            
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
                     
                        .font(.system(size:11))
                       
                        .padding([.leading,.trailing],70)
                        // 0 hiden 30
                      .padding(.top,0)
                      
                    //    .frame(width:4400,height:00)
                       .background(Color.white)
                        
                       .padding(.bottom,30)
                      
                    }

                   
                }
                
                GeometryReader{
                    geo in
                
               
                    MapView(mapType: .standard,showsUserLocation: true)
                 
                    VStack(spacing:20){
                        
                       
                            VStack{
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    TextField("Search..",text: $searchText)
                                        
                                        .onChange(of: searchText) { value in
                                           Task {
                                                if !value.isEmpty &&  value.count > 0 {
                                                    await shopListVM.search(name: value)
                                                } else {
                                                     shopListVM.shops.removeAll()
                                                }
                                            }
                                        }
                                    
                                }
                           
                                .padding()
                                    
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .padding(.top,30)
                                    .padding(.horizontal,30)
                            }
                            .sheet(isPresented: $shopListVM.showSheet) {
                        if #available(iOS 16, *) {
                            VStack{
                                List(shopListVM.shops, id: \.id) { shop in
                                    Section{
                                        HStack {
                                            let u = URL(string:shop.logo ?? "")
                                            AsyncImage(url: u
                                                       , content: { image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                   //                                 .frame(maxWidth: 60)
                                                
                                            }, placeholder: {
                                                ProgressView()
                                            })
                                            .frame(width: 100, height: 120, alignment: .center)
                                            VStack(alignment:.leading){
                                                Text(shop.name ?? "sss")
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                Text(shop.settings?.location?.formattedAddress ?? "sss")
                                                    .lineLimit(4)
                                                    .font(.system(size: 10, weight: .light, design: .default))
                                                HStack(spacing:0){
                                                    Image(systemName: "mappin.and.ellipse")
                                                        
                                                    Text("1Km")
                                                        .font(.system(size: 12, weight: .light, design: .default))
                                                }
                                               
                                                
                                                HStack{
                                                    ForEach(0..<5)
                                                    {i in
                                                        
                                                        Image(
                                                           
                                                           systemName:  Int((shop.rating ?? 1)) <= i ?"star":"star.fill")
                                                        .resizable()
                                                        .frame(width: 20,height:20)
                                                    }
                                                    
                                                    //            .foregroundColor(rating >= i ? Color.yellow: Color.gray)
                                                    
                                                }
                                            }
                                            //.frame(maxWidth:100,maxHeight: 100)
                                            
                                            .frame(width: 150, height: 70, alignment: .center)
                                            
                                        }
                                        .overlay(
                                            
                                            Image(systemName: "plus")
                                                .foregroundColor(Color.orange)
                                                .offset(x:170,y:-50)
                                        )
                                        
                                    }
                                }
                            }
                                  .presentationDetents([.medium, .fraction(0.7)])
                          }
                                else {
                              VStack{
                                  List(shopListVM.shops, id: \.id) { shop in
                                      Section{
                                          HStack {
                                              let u = URL(string:shop.logo ?? "")
                                              AsyncImage(url: u
                                                         , content: { image in
                                                  image.resizable()
                                                      .aspectRatio(contentMode: .fit)
                     //                                 .frame(maxWidth: 60)
                                                  
                                              }, placeholder: {
                                                  ProgressView()
                                              })
                                              .frame(width: 100, height: 120, alignment: .center)
                                              VStack(alignment:.leading){
                                                  Text(shop.name ?? "")
                                                      .font(.system(size: 18, weight: .bold, design: .default))
                                                  Text(shop.settings?.location?.formattedAddress ?? "")
                                                      .lineLimit(4)
                                                      .font(.system(size: 10, weight: .light, design: .default))
                                                  HStack(spacing:0){
                                                      Image(systemName: "mappin.and.ellipse")
                                                          
                                                      Text("1Km")
                                                          .font(.system(size: 12, weight: .light, design: .default))
                                                  }
                                                 
                                                  
                                                  HStack{
                                                      ForEach(0..<5)
                                                      {i in
                                                          
                                                          Image(
                                                             
                                                             systemName:  Int((shop.rating ?? 1)) <= i ?"star":"star.fill")
                                                          .resizable()
                                                          .frame(width: 20,height:20)
                                                      }
                                                      
                                                      //            .foregroundColor(rating >= i ? Color.yellow: Color.gray)
                                                      
                                                  }
                                              }
                                              //.frame(maxWidth:100,maxHeight: 100)
                                              
                                              .frame(width: 150, height: 70, alignment: .center)
                                              
                                          }
                                          .overlay(
                                              
                                              Image(systemName: "plus")
                                                  .foregroundColor(Color.orange)
                                                  .offset(x:170,y:-50)
                                          )
                                          
                                      }
                                  }
                              }
                          }
                           
                                           
                                        }
                      
                    
                       
                    }
                       
                
                       
                    
            
    

             
                    Button{

                        self.grid.toggle()
                    }label:{

                        Text("Grid")
                            .frame(maxWidth:200)
                            .filledButton()

                    }
                    .padding(.horizontal,100)
                    //480 for 8
                    .padding(.top,450)

                }
         
            }
            .onAppear{
                Task
                {
             await   shopListVM.search(name: searchText)
                }
            }
        }
    }
    
  
}

struct YourLocation_Previews2: PreviewProvider {
    static var previews: some View {
        YourLocation()
    }
}


