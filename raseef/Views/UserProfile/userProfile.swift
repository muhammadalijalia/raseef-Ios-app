//
//  userProfile.swift
//  raseef
//
//  Created by Teamx tec on 14/11/2022.
//

import SwiftUI
import ImageSlideshow

struct userProfile: View {
    //M Y ORDER
    @State private var current_order_enable = true
    @State private var past_order_enable = false
    @State private var reviews_order_enable = false
    
    /// MY service
     @State private var Message_enable = true
    @State private var payment_enable = false
    @State private var Support_enable = false
    @ObservedObject var dashBoardViewmodel = DashboardViewModel()
   
    @State var rating = 0.0
    let screenSize = UIScreen.main.bounds ;
    enum Dest: Hashable ,Codable{
       

        case CurrentOrderView
        case pastOrdersView
        case reviewsView
        case messageView
        case paymentView
         case Support

       }

     @State private var path: [Dest] = []




    var body: some View {
        
        NavigationStack(path: $path){

        //NavigationView{
            ZStack{
                
                
                GeometryReader{
                    geo in
                    VStack(spacing:0){
                        
                        Image(icon: .navbar)
                            .resizable()
                        
                            .frame(width: geo.size.width, height: geo.size.height * 0.28,alignment: .top)
                        
                            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        
                            .ignoresSafeArea()
                        
                            .overlay(
                                
                                VStack(spacing:12){
                                    VStack{
                                        Label{
                                            
                                            VStack(alignment:.leading){
                                                Text("Ayesha Khan")
                                                    .font(.system(.title, design: .rounded))
                                                Text("+923102987654")
                                                    .font(.system(.headline, design: .rounded))
                                            }  .foregroundColor(Color.white)
                                            
                                        }icon:{
                                            
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    Spacer()
                                    HStack(spacing:20){
                                        
                                        VStack(spacing:10){
                                            Text("05")
                                            Text("My Wishlist")
                                        }
                                        .foregroundColor(Color.white)
                                        HStack { Divider()
                                            
                                            
                                        }.frame(width:2,height: 50)
                                            .overlay(
                                                .white)
                                        
                                        VStack(spacing:10){
                                            Text("05")
                                            Text("My Merchants")
                                        }
                                        .foregroundColor(Color.white)
                                    }
                                }
                                
                                    .frame(height: 10)
                                    .padding(.horizontal,30)
                                    .padding(.bottom,25)
                                
                            )
                        
                        
                        Image(icon: .WHITE_BG)
                            .resizable()
                            .frame(width: geo.size.width, height: geo.size.height * 0.72,alignment: .top)
                            .ignoresSafeArea()
                            .overlay(
                                
                                ScrollView(.vertical,showsIndicators: false){
                                    
                                    VStack{
                                        
                                        LazyVStack(alignment:.leading,spacing:20){
                                            VStack{
                                                VStack{
                                                    HStack{
                                                        Text("My Orders")
                                                            .font(.system(size: 20,weight: .bold))
                                                        
                                                        Spacer()
                                                    }
                                                    HStack(spacing:25){
                                                        Button{
                                    self.path.append(.CurrentOrderView)
                                                            //self.path.removeAll()
                                                            self.current_order_enable = true
                                                            self.reviews_order_enable = false;
                                                            self.past_order_enable = false
                                                        }label:{
                                       
                                                            
                                                                VStack(spacing:15){
                                                                    
                                                                    Image(systemName: "bag")
                                                                        .resizable()
                                                                        .frame(width:20,height:20)
                                                                    Text("Current Orders")
                                                                }
                                                            
                                                        }
                                                        
                                                        .foregroundColor(current_order_enable ?Color.orange:Color.black)
                                                        
                                                        Button{
                        self.path.append(.pastOrdersView)
                                                            //self.path.removeAll()
                                                            self.current_order_enable = false
                                                            
                                                            self.past_order_enable = true
                                                            self.reviews_order_enable = false
                                                        }label:{
                                                            VStack(spacing:15){
                                                                
                                                                Image(systemName: "bag")
                                                                    .resizable()
                                                                    .frame(width:20,height:20)
                                                                Text("Past Orders")
                                                            }
                                                            
                                                        }
                                                        
                                                        .foregroundColor(past_order_enable ?Color.orange:Color.black)
                                                        Button{
                                      self.path.append(.reviewsView)
                                                            //self.path.removeAll()
                                                            self.current_order_enable = false
                                                            self.reviews_order_enable = true
                                                            self.past_order_enable = false
                                                            
                                                        }label:{
                                                            VStack(spacing:15){
                                                                Image(systemName: "bag")
                                                                    .resizable()
                                                                    .frame(width:20,height:20)
                                                                    .frame(width:20,height:20)
                                                                Text("Reviews")
                                                            }
                                                        }
                                                        
                                                        .foregroundColor(reviews_order_enable ?Color.orange:Color.black)
                                                        
                                                        
                                                        
                                                        
                                                    }
                                                    .font(.system(size: 15))
                                                }
                                                .padding(.horizontal,12)
                                                
                                                
                                            }
                                            .frame(width: screenSize.width * 0.88, height: screenSize.height * 0.15)
                                            
                                            .border(Color.gray, width: 1)
                                            
                                            VStack{
                                                
                                                VStack{
                                                    HStack{
                                                        Text("My Service")
                                                            .font(.system(size: 20,weight: .bold))
                                                        
                                                        Spacer()
                                                    }
                                                    HStack(spacing:25){
                                                        Button{
                                 self.path.append(.messageView)
                                                            //self.path.removeAll()
                                                            self.Message_enable = true
                                                            self.payment_enable = false
                                                            self.Support_enable = false
                                                        }label:{
                                                            VStack(spacing:15){
                                                                
                                                                Image(systemName: "bag")
                                                                    .resizable()
                                                                    .frame(width:20,height:20)
                                                                Text("Message")
                                                            }
                                                        }
                                                        
                                                        .foregroundColor(Message_enable ?Color.orange:Color.black)
                                                        
                                                        Button{
                                    self.path.append(.paymentView)
                                                            //self.path.removeAll()
                                                            self.Message_enable = false
                                                            
                                                            self.payment_enable = true
                                                            self.Support_enable = false
                                                        }label:{
                                                            VStack(spacing:15){
                                                                
                                                                Image(systemName: "bag")
                                                                    .resizable()
                                                                    .frame(width:20,height:20)
                                                                Text("Payment Options")
                                                            }
                                                            
                                                        }
                                                        
                                                        .foregroundColor(payment_enable ?Color.orange:Color.black)
                                                        Button{
                                                        self.path.append(.Support)
                                                            //self.path.removeAll()
                                                            self.Message_enable = false
                                                            
                                                            self.payment_enable = false
                                                            self.Support_enable = true
                                                        }label:{
                                                            VStack(spacing:15){
                                                                Image(systemName: "bag")
                                                                    .resizable()
                                                                    .frame(width:20,height:20)
                                                                Text("Support")
                                                            }
                                                        }
                                                        
                                                        .foregroundColor(Support_enable ?Color.orange:Color.black)
                                                        
                                                        
                                                        
                                                        
                                                    }
                                                    .font(.system(size: 15))
                                                }
                                                .padding(.horizontal,12)
                                                
                                            }
                                            .frame(width: screenSize.width * 0.88, height: screenSize.height * 0.15)
                                            
                                            .border(Color.gray, width: 1)
                                            
                                            
                                            VStack{
                                                Text("Keep Shopping")
                                                    .font(.system(size: 20,weight: .bold))
                                                
                                                ScrollView(.horizontal){
                                                    
                                                    LazyHStack{
                                                        ForEach(dashBoardViewmodel.P_Products,id:\.id)
                                                        {
                                                            index in
                                                            
                                                            AsyncImage(url: URL(string: index.image ?? "https://hws.dev/img/bad.png"))
                                                            { phase in
                                                                if let image = phase.image {
                                                                    image
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                    //   .scaledToFill()
                                                                    
                                                                }
                                                                else if phase.error != nil {
                                                                    Text("There was an error loading the image.")
                                                                } else {
                                                                    ProgressView()
                                                                    
                                                                    
                                                                }
                                                            }
                                                            .frame(width: screenSize.width * (0.425), height: 165)
                                                            .cornerRadius(5)
                                                            .overlay(RoundedRectangle(cornerRadius: 5)
                                                                .stroke(Color.gray, lineWidth: 1))
                                                            
                                                            .overlay(
                                                                VStack{
                                                                    HStack{
                                                                        Button{}label:{
                                                                            
                                                                            HStack(spacing:2){
                                                                                Image(icon: .star)
                                                                                    .resizable()
                                                                                    .renderingMode(.template)
                                                                                    .frame(width: 10, height: 10)
                                                                                    .foregroundColor(Color(hex:0xfa6108))
                                                                                Text("\(index.ratings ?? 0)")
                                                                                    .font(.system(size:8))
                                                                                    .foregroundColor(Color.black)
                                                                            }
                                                                            .padding(4)
                                                                            .background(Color(hex:0xffe9dd))
                                                                            .cornerRadius(20)
                                                                        }
                                                                        
                                                                        
                                                                        
                                                                        Spacer()
                                                                        Button{}label:{
                                                                            Image(icon: .heart)
                                                                                .resizable()
                                                                                .frame(width: 20, height: 20)
                                                                            //.offset(x:-150,y:-150)
                                                                        }
                                                                    }
                                                                    Spacer()
                                                                    HStack{
                                                                        Button{}label:{
                                                                            
                                                                            HStack(spacing:0){
                                                                                
                                                                                Text(index.name ?? "Name")
                                                                                    .font(.system(size:12,weight:.heavy))
                                                                                    .foregroundColor(Color.orange)
                                                                            }
                                                                            
                                                                        }
                                                                        
                                                                        
                                                                        
                                                                        Spacer()
                                                                        
                                                                        HStack(spacing:1){
                                                                            Text("AED")
                                                                                .font(.system(size: 8,weight:.heavy))
                                                                                .padding(.top,6)
                                                                            Text("\(index.price ?? 0)")
                                                                                .font(.system(size:12,weight:.heavy))
                                                                            
                                                                        }
                                                                        .foregroundColor(Color.orange)
                                                                        
                                                                        //.offset(x:-150,y:-150)
                                                                        
                                                                    } .foregroundColor(Color.white)
                                                                    
                                                                    HStack{
                                                                        
                                                                        Button{}label:{
                                                                            
                                                                            Image(icon: .plus_with_orange)
                                                                                .renderingMode(.template)                         .foregroundColor(Color.orange)
                                                                        }
                                                                    }
                                                                }
                                                                    .padding(.horizontal,8)             )
                                                            
                                                        }
                                                    }
                                                    
                                                }
                                                .frame(width:screenSize.width * 0.88)
                                                
                                            }
                                            
                                            VStack{
                                                Text("Popular Stores")
                                                    .font(.system(size: 20,weight: .bold))
                                                ScrollView(.horizontal){
                                                    
                                                    LazyHStack{
                                                        ForEach(dashBoardViewmodel.P_Shops,id:\.id)
                                                        {
                                                            index in
                                                            
                                                            Button{
                                                            }
                                                            
                                                        label:{
                                                            
                                                            VStack(spacing:3){
                                                                AsyncImage(url: URL(string: index.logo ?? "https://hws.dev/img/bad.png"))
                                                                { phase in
                                                                    if let image = phase.image {
                                                                        image
                                                                            .resizable()
                                                                    }
                                                                    else if phase.error != nil {
                                                                        Text("There was an error loading the image.")
                                                                    } else {
                                                                        ProgressView()
                                                                    }
                                                                }
                                                                .frame(width: 160, height: 160)
                                                                .overlay {
                                                                    Image(icon: .plus_with_orange)
                                                                        .resizable()
                                                                        .frame(width: 15, height: 15)
                                                                        .offset(x:65,y:-55)
                                                                }
                                                                VStack(alignment: .leading){
                                                                    HStack(spacing:0){
                                                                        
                                                                        
                                                                        Text(index.name ?? "shop.name")
                                                                            .font(.system(size:14))
                                                                        Spacer()
                                                                        (Text(Image(icon: .location_pin)) + Text("1Km"))
                                                                            .font(.system(size:13))
                                                                        
                                                                    }
                                                                    
                                                                    HStack{
                                                                        Text(index.settings.location.formattedAddress ?? "shop.settings.location.formattedAddress")
                                                                            .font(.system(size:11))
                                                                            .multilineTextAlignment(.leading)
                                                                            .lineLimit(nil)
                                                                        
                                                                        //   .padding(.leading,10)
                                                                            .frame(width:120)
                                                                        
                                                                    }
                                                                    //   HStack{
                                                                    var _: Void = UserDefaults.standard.set(index.rating, forKey: "rating")
                                                                    
                                                                    if UserDefaults.standard.double(forKey: "rating") != nil
                                                                    {
                                                                        Api_Rating2()
                                                                        
                                                                    }                  else{
                                                                        Text("\(index.rating ?? 0)")
                                                                    }
                                                                    
                                                                    
                                                                    //  }
                                                                }
                                                                .frame(maxWidth:150)
                                                                
                                                            }
                                                            
                                                            .frame(width: screenSize.width * 0.425)
                                                            .background(Color.white)
                                                            //.padding(.horizontal,0)
                                                            
                                                        }
                                                        }
                                                    }
                                                    
                                                }
                                                //.frame(maxWidth:350)
                                                .frame(width:screenSize.width * 0.88)
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    .padding(.horizontal,geo.size.width * 0.065)
                                    .padding(.bottom,10)
                                }
                                    .frame(maxHeight:geo.size.height)
                                
                                
                            )
                    }
                    
                    
                }
                
                
          
                
                //    }
 
                //
   
               
                
            }
            .navigationDestination(for: Dest.self) { data in
                switch data {
                case .CurrentOrderView:
                 CurrentOrders()
                        .navigationBarHidden(true)
                case .pastOrdersView:
                    PastOrders()
                        .navigationBarHidden(true)
                case .reviewsView:
                    Reviews_see()
                        .navigationBarHidden(true)

               case .messageView:
                    Message_View_1()
                        .navigationBarHidden(true)
//
                case .paymentView:
                   PaymentMethod()
                        .navigationBarHidden(true)
//
               


                case .Support:
                   PastOrders()
                        .navigationBarHidden(true)
                }
            }
            .navigationBarHidden(true)
            //.navigationTitle("Colors")
            .onAppear{

                Task{
                    await

                    dashBoardViewmodel.dashboard()


                }
            }
          
            
 
       // }
      



       }
    
    }
}

struct userProfile_Previews1: PreviewProvider {
    static var previews: some View {
        userProfile()
    }
}
