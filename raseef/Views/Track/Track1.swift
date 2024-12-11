//
//  Track1.swift
//  raseef
//
//  Created by Teamx tec on 14/11/2022.
//

import SwiftUI
import MapKit
import SwiftUIMapView
struct Track1: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State private var hovered = false
    @State private var currentLocation = CLLocationCoordinate2D()
    @State var grid = false
    @State var pushtoLoginView = false
    //@ObservedObject var viewModel = GetShops_List()
   // @ObservedObject var model = MovieListViewModel()
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 66, longitude: -33), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State var searchText = ""
    @StateObject private var shopListVM = ShopListViewModel()
    @State var pushtoGridView = false
    
    ///// SheetButton Bg
    @State var sheet_btn_bg = false
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
                        Text("Location")
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
                    
                       
                        
                 
                        .sheet(isPresented: $shopListVM.showSheet) {
                                                  
                                                       if #available(iOS 16, *) {
                                                           VStack(alignment:.leading,spacing:10){
                                              HStack(spacing:20){
                                                 
                                                                   Button{
                                                                       self.sheet_btn_bg.toggle()
                                                                   }label:
                                                                   {
                                                                       Label("Walk",systemImage: "figure.walk")
                                                                   }
                                               
                                                                   .padding(9)
                                                                   .foregroundColor(sheet_btn_bg ? Color.gray: Color.white)                      .background(sheet_btn_bg ? Color.white:Color(hex: 0xFA6109))
                                                                                            .cornerRadius(15)
                                                                                            .shadow(color: .black, radius: 2)
                                                                   
                                                                       
                                                                       Button{
                                                                           
                                                                           self.sheet_btn_bg.toggle()
                                                                       }label:
                                                                   {
                                             Label("Car",systemImage: "car")
                                                                   }
                                                                   .padding(9)             .background(sheet_btn_bg ? Color(hex: 0xFA6109):Color.white)
                                                                   .foregroundColor(sheet_btn_bg ? Color.white: Color.gray)
                                                                   .cornerRadius(15)
                                                                   .shadow(color: .black, radius: 2)
                                                                   Spacer()
                                                               }
                                              
                                                               Text("Laundary Bazar")
                                                                   HStack{
                                                                 Text("Abc,xyz,321,Dubai")
                                                                                            
                                                                           .lineLimit(2)
                                                                                        Spacer()
                                                                                        Button{}label:{
                                                                                            Text("Go Now")
                                                                                                .frame(maxWidth:90)
                                                                                                .filledButton()
                                                                                            
                                                                                        }
                                                                                    }
                                                               
                                            Text("1 km away")
                                          
                                                          
                                          
                                                           }

                                  .padding(.horizontal,22)

//                                             sheet.smallestUndimmedDetentIdentifier = .mediu
                                                           .presentationDetents([.medium, .fraction(0.27)])

                                                         }
                                                               else {
                                                             VStack{
                                                                 Text("SHEET IS OPEN")
                                                             }
                                                         }
                                                  




                                                           }
                    
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
//                            .sheet(isPresented: $shopListVM.showSheet) {
//                                ZStack{
//                                    if #available(iOS 16, *) {
//                                        VStack{
//                                           Text("dasdas")
//                                        }
//                                              .presentationDetents([.medium, .fraction(0.1)])
//
//                                      }
//                                            else {
//                                          VStack{
//                                              Text("dasdas")
//                                          }
//                                      }
//                                }
//
//
//
//
//                                        }
                      
                    
                       
                    }
                       
                
                       
                    
            
    

             
//                    Button{
//
//                        self.grid.toggle()
//                    }label:{
//
//                        Text("Grid")
//                            .frame(maxWidth:200)
//                            .filledButton()
//
//                    }
//                    .padding(.horizontal,100)
                    //480 for 8
                   // .padding(.top,450)
//                    TabView {
//                        Text("Home Tab")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
//                            .tabItem {
//                                Image(systemName: "house")
//                                Text("Home")
//                            }
//
//                        Text("Bookmark Tab")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
//
//                            .tabItem {
//                                Image(systemName: "person")
//                                Text("profile")
//                            }
//
//
//                        Text("Video Tab")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
//                            .tabItem {
//                                Image(systemName: "bag")
//                                Text("Shopping")
//                            }
//
//                        Text("Profile Tab")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
//
//                            .tabItem {
//                                Image(systemName: "bell.badge")
//                                Text("Notification")
//                            }
//                    }  .frame(width: 420, height: 220)
//                        .padding(.top,600)
                }
         
            }
            .accentColor(Color(hex: 0xFA6109))
            .onAppear{
                Task
                {
             await   shopListVM.search(name: searchText)
                }
            }
        }
    }
}

struct Track1_Previews: PreviewProvider {
    static var previews: some View {
        Track1()
    }
}
