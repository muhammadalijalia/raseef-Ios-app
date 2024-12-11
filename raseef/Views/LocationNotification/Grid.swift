//
//  Grid.swift
//  raseef
//
//  Created by Teamx tec on 25/10/2022.
//

import SwiftUI
import Foundation
import Combine
struct Grid: View {
    @State var searchText = ""
    
 //   @State var navbarhomeColor = false
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State var pushtoYourLocationView = false
    // for temp
    
  //  @State var pushtoLoginView = false
   
    @State var searchText2 = ""
    @StateObject private var shopListVM = ShopListViewModel()
  

    let data = (1...100).map { "Item \($0)" }

      let columns = [
          GridItem(.adaptive(minimum: 150))
      ]
    let column: [GridItem] =
                 Array(repeating: .init(.flexible()), count: 2)
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State var ShopSlug = ""
    @ObservedObject var getShopVm = GetShopsBySlugViewModel()
    @State var grid = false
    @StateObject var webS = Webservice()
   
    
   
    
@State var hasNextpage = false
    
 
    var body: some View {
   
        NavigationView{




            ZStack{
                NavigationLink("",destination: StoreProfile()
                    .navigationBarHidden(true)
                               ,isActive: $grid)
                NavigationLink("",destination: StoreProfile()
                    .navigationBarHidden(true)
                               ,isActive: $getShopVm.pushtoStore)
                NavigationLink("",destination: YourLocation()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoYourLocationView)
            
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
                        VStack(spacing:15){
                            VStack{
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    TextField("Search..",text: $searchText2)

                                        .onChange(of: searchText2) { value in
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
                                    .padding(.horizontal,40)
                            }

                    } .padding(.horizontal,0)





                    Image(icon: .navbar)
                        .resizable()

                        .frame(width: reader.size.width * 1,height: reader.size.height * 0.14, alignment: .top)
                        .ignoresSafeArea()

           
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 10) {
                  
                            ForEach(shopListVM.shops, id: \.id) { shop in
                                //           Section{
                                // HStack(spacing:15){
                                Button{
                                    // self.grid = true
                                    self.ShopSlug = shop.slug ?? "a"
                                    UserDefaults.standard.set(self.ShopSlug, forKey: "ShopSlug")
                                    let slug = UserDefaults.standard.string(forKey: "ShopSlug")
                                    
                                    //EXTEND WoRK
                                    // UserDefaults.standard.set(shop.id,forKey: "ShopID")
                                    Task
                                    {
                                        await
                                        
                                        getShopVm.getStoreprofile(slug: self.ShopSlug)
                                        print((UserDefaults.standard.string(forKey: "StoreId") ?? "No store id in grid") as String)
                                        //                                    getShopVm.GetShopsBySlug(slug: self.ShopSlug)
                                        
                                        //                                    await ProductsByShopVm.getProducts(shop_id: shop.id)
                                        getShopVm.pushtoStore = true
                                    }
                                    
                                    
                                    
                                    
                                }
                                
                            label:{
                                
                                VStack(){
                                    let u = URL(string:shop.logo ?? "")
                                    AsyncImage(url: u) { phase in
                                        if let image = phase.image  {
                                            image
                                                .resizable()
                                                .frame(width: 128, height: 120)
                                        } else if phase.error != nil {
                                            Image(systemName: "exclamationmark.triangle").padding()
                                            // the error here is "cancelled" on any view that wasn't visible at app launch
                                        } else {
                                            ProgressView().padding()
                                        }
                                    }
                                    //                                AsyncImage(url: u
                                    //                                           , content: { image in
                                    //                                    image.resizable()
                                    //                                        .renderingMode(.original)
                                    //                                    .aspectRatio(contentMode: .fit) }, placeholder: { ProgressView() })
                                    //                                // .resizable()
                                    ////                                        .frame(width: 120, height: 120)
                                    //
                                    //                               .frame(width: 128, height: 120)
                                    
                                    
                                    
                                    .overlay {
                                        Image(icon: .plus_with_orange)
                                            .resizable()
                                            .frame(width: 15, height: 15)
                                            .offset(x:50,y:-50)
                                    }
                                    VStack(alignment: .leading){
                                        HStack(spacing:10){
                                            
                                            
                                            Text(shop.name ?? "")
                                                .font(.system(size:13))
                                            //                                                                .padding(.leading,5)
                                            
                                            
                                            (Text(Image(icon: .location_pin)) + Text("1Km"))
                                                .font(.system(size:10))
                                            
                                        }
                                        Text(shop.settings?.location?.formattedAddress ?? "xxx")
                                            .font(.system(size:10))
                                        //.lineLimit(3)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(3)
                                        //   .padding(.leading,10)
                                            .frame(width:110, alignment: .leading)
                                        HStack(spacing:2){
                                            ForEach(0..<5)
                                            {i in
                                                
                                                Image(
                                                    
                                                    systemName: Int((shop.rating ?? 1)) <= i ?"star":"star.fill")
                                                .resizable()
                                                .frame(width: 8,height:8)
                                            }
                                            
                                            
                                        }
                                    }
                                }
                                
                                .frame(width: 160, height: 220)
                                .background(Color.white)
                                .padding(.horizontal,5)
                                
                               
                            }
                        
             
                                
                                //}
                                // }
                                // .listStyle(.insetGrouped)
                                
                    
                            }
                        if shopListVM.HasNext{
                            Button{
                                Task{
                                    await
                                    shopListVM.search(name: searchText2)
                                }
                            }label:{
                                ProgressView()
                                    .onAppear{
                                     
                                        
                                    }
                            }
                    }
                         
               
                         
                           
                   }
                    
//                    if shopListVM.membersListFull == false {
//                        Button{
//                            Task{
//                                await shopListVM.search(name: searchText2)
//
//                            }
//                        }label:{
//
//                            //ProgressView()
//                            Text("Click to More loading..")
////                                            .onAppear {
////                                                Task{
////                                                    await shopListVM.search(name: searchText2)
////
////                                                }
////                                            }
//                        }
//
//                    }

                    
                    
              }
                .padding(.vertical,100)
                .frame(height:reader.size.height * 1.25)
                }
                .ignoresSafeArea(.keyboard)
            //    .frame(height:reader.size.height)
            
             //   .background(Color(hexadecimal6: 0xF5F5F5))

                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                             self.pushtoYourLocationView = true
                        }label:{
                            Image(icon: .leftArrow)
                                .font(.largeTitle.bold())
                                .foregroundColor(Color.white)
                        }
                        .padding(.top,10)




                    }

                    ToolbarItem {
                    Text("PLACES NEAR BY")
                            .foregroundColor(Color.white)
                            .font(.system(size:20,weight: .bold))
                        .padding(.top,10)
                        .padding(.trailing,100)




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

           }
            .background(Color(hexadecimal6: 0xF5F5F5))
            .onAppear{
                
                Task{
                    
                    await shopListVM.search(name: searchText2)
                    
                    
                    
                    
                }
                    
               
            
              
                    
//                    let slug = UserDefaults.standard.string(forKey: "ShopSlug")
//                                   getShopVm.GetShopsBySlug(slug: slug ?? "No Slug")
               

            }

            }
       
    }
}

struct Grid_Previews: PreviewProvider {
 
    static var previews: some View {
        Grid()
    }
}
