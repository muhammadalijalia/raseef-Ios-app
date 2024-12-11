//
//  Store_Product_Detail_0.swift
//  raseef
//
//  Created by Teamx tec on 27/10/2022.
//

import SwiftUI
import CoreData
//
//  Store_Product_Detail.swift
//  raseef
//
//  Created by Teamx tec on 27/10/2022.
//

import SwiftUI
extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}
struct RoundedCornersShape0: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

 
struct Store_Product_Simple: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
    @State var radiocheck1 = false
    @State var radiocheck2 = false
    @State var radiocheck3 = false
    @State var no_of_product_card : Int = 1
    @State var showDescription = false
    @State var showReviews = false
    @StateObject var product_listVm = ProductTypeListViewModel()
    @ObservedObject var product_reviewVm = ProductReviewsViewModel()
    @State var a : Double = 0
    @State var rate : Double = 0.0
    
    @State var pushtoStoreProfile = false
 
    @State var pushtoAddtoCart = false

////////////////// COREDATA
    ///
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var coreDM: ProductListManager = ProductListManager.shared

    @State private var product_list: [MyProductCardList] = [MyProductCardList]()
    private func populateList() {
        product_list = coreDM.getAllList()
    }
    @FetchRequest(
            entity: MyProductCardList.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \MyProductCardList.name, ascending: false)
            ]
        ) var entities: FetchedResults<MyProductCardList>
    
    @ObservedObject var ext = Extensions()
   
    let request: NSFetchRequest<MyProductCardList> = MyProductCardList.fetchRequest()
    var body: some View {
        NavigationView{
            ZStack{
                
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
                                NavigationLink("",destination:StoreProfile()
                                    .navigationBarHidden(true)
                                               ,isActive: $pushtoStoreProfile)
                                NavigationLink("",destination:
                                                cart()
//                                    .environment(\.managedObjectContext, ProductListManager.shared.viewContext)
                                    .navigationBarHidden(true)
                                               ,isActive: $pushtoAddtoCart)
                              
                                Image(icon: .Clothesshop)
                                    .resizable()
                                    .frame(minHeight: reader.size.height * 0.45)
                                    .clipShape(  RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 40))
                                
                                // .cornerRadius(30)
                                
                                HStack{
                                    Button{
                                       self.pushtoStoreProfile.toggle()
                                        
                                    }label:{
                                        Image(icon: .back)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                    }
                                    Spacer()
                                    Button{
                                     //self.pushtoAddtoCart.toggle()
                                        
                                    }label:{
                                        Image(icon: .plus_with_orange)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                    }


                                
                                
                                    
                              
                                    //.offset(x:-150,y:-150)
                                    
                                }
                                .frame(width: reader.size.width * 0.86, height: reader.size.height * 0.01)
                                //240 for se 2ndgen
                                .padding(.bottom,250)
                                
                            }
                            
                            
                            ///////////////////
                            ScrollView(.vertical){
                                VStack(alignment:.leading,spacing:6){
                                    VStack(alignment:.leading,spacing:4){
                                        
                        
                                        Text(product_listVm.name ?? "Name")
                                            .foregroundColor(Color.black)
                                            .font(.system(size:25))
                                        //    .padding(.leading,8)
                                        
                                        
                                        
                                        HStack(spacing:5){
                                            Spacer()
                                            
                                            
                                            Button{
                                                self.no_of_product_card-=1
                                            }label:{
                                                
                                                Image(icon: .plus)
                                                    .foregroundColor(Color.white)
                                                    .frame(width: 10, height: 10)
                                            }
                                            Text("\(self.no_of_product_card)")
                                                .foregroundColor(Color.orange)
                                                .frame(width: 30, height: 10)
                                            Button{
                                                self.no_of_product_card+=1
                                            }label:{
                                                
                                                Image(icon: .minus)
                                                    .foregroundColor(Color(hex: 0xFA6109))
                                                    .frame(width: 10, height: 10)
                                                
                                            }
                                            
                                        }
                                        // .frame(width: 80, height: 20)
                                        
                                        .padding(.trailing,15)
                                        
                                        
                                        
                                        Text(product_listVm.slug ?? "SlUG")
                                       
                                     
                                       // RatingView_Api($product_listVm.rating)
                                        Api_Rating(rating: $product_listVm.rating, maxRating: 5, starColor: .yellow)
                                    }
                                    // .padding(.leading,10)
                                    
                                    
                                    
                                    VStack(alignment:.leading,spacing:5){
                                        HStack{
                                          
                                            Text("\(product_listVm.price)")
                                                .foregroundColor(Color.black)
                                                .font(.system(size:25))
                                            //   .padding(.leading,8)
                                            //  .padding(.bottom,10)
                                            
                                            Text("AED")
                                                .font(.system(size:10))
                                                .padding(.top,8)
                                        }
                                        
                                        
                                        HStack{
                                            Text("Description")
                                            //  .padding(.leading,10)
                                            Spacer()
                                            Button{
                                                showDescription.toggle()
                                                
                                            }label:{
                                                
                                                Image(systemName: self.showDescription ? "chevron.down":"chevron.up")
                                                
                                                    .padding(.trailing,10)
                                            }
                                            
                                        }
                                        if showDescription{
                                            VStack(spacing:5){
                                                
                                                Text(product_listVm.description ?? "mmmmm")
                                                    .lineLimit(5)
                                                
                                                
                                                
                                            }
                                        }
                                        
                                        // .padding(.leading,10)
                                        
                                        
                                    }
                                    //.padding(.leading,10)
                                    Divider()
                                    VStack(alignment:.leading,spacing:5){
                                        
                                        
                                        
                                        HStack{
                                            Text("Reviews")
                                            // .padding(.leading,10)
                                            Spacer()
                                            Button{
                                                
                                                if showReviews == false{
                                                    Task{
                                                        print(product_listVm.id)
                                                        await
                                                        product_reviewVm.reviews(product_id: self.product_listVm.id)
                                                        print(product_reviewVm.product_reciew_docs .isEmpty == false)
                                                        self.showReviews.toggle()
                                                    }
                                                }
                                                else{
                                                    self.showReviews.toggle()
                                                }
                                             
                                                
                                            }label:{
                                                
                                                Image(systemName: self.showReviews ? "chevron.down":"chevron.up")
                                                
                                                    .padding(.trailing,10)
                                            }
                                        }
                                        
                                    
                                        if showReviews{
                                           
                                            if product_reviewVm.product_reciew_docs .isEmpty == false
                                            {
                                                ForEach(product_reviewVm.product_reciew_docs,id:\.id)
                                                {
                                                    review in
                                                    
    //                                                Text(review.user.name ?? "Name")
    //                                                    .onAppear{
    //
    //                                                        self.rate = review.rating
    //                                                    }
    ////                                                UserDefaults.standard.set(review.rating, forKey: "rating")
    //                                                Api_Rating(rating: self.$rate, maxRating: 5, starColor: .yellow)
                                                    VStack(alignment:.leading,spacing:5){
                                                        VStack{
                                                            HStack{
                                                                Image(icon: .profile_img)
                                                                    .resizable()
                                                                    .frame(width:40,height:40)
                                                                    .clipShape(Circle())
                                                                VStack(alignment:.leading, spacing:0){
                                                                    
                                                                    Text(review.user.name  ?? "Name")
                                                                        .onAppear{
                                                                            
                                                                            self.rate = review.rating
                                                                        }
                                                                    
                                        Api_Rating(rating: $rate , maxRating: 5, starColor: .yellow)
                                                            
        
                                                                      
                                                                    
                                                                }
                                                                .padding(.top,0)
                                                                Spacer()
        //                                                        Text("3 months ago")
                                                                
                                                                
                                Text(ext.timeAgo(time: review.createdAt ?? "2022-12-05T07:07:15.933Z"))
                                                                    .font(.system(size:12))
                                                                    .padding(.bottom,8)
                                                            }
                                                            
                                                        }
                                                        //  .frame(width:.infinity,height:40)
                                                        
                                                        Text(review.comment ?? "sdsdsdasdasdasdadasd")
                                                            .lineLimit(5)
                                                        
                                                        
                                                    }.padding(.trailing,10)
                                                }
                                            }
                                            else{
                                                
                                                VStack(alignment:.leading,spacing:5){
                                                    VStack{
                                                        HStack{
                                                            Image(icon: .profile_img)
                                                                .resizable()
                                                                .frame(width:40,height:40)
                                                                .clipShape(Circle())
                                                            VStack(alignment:.leading, spacing:0){
                                                                
                                                                Text("Name")
                                                                    .onAppear{
                                                                        
                                                         self.rate = 2
                                                                    }
                                                                
                                    Api_Rating(rating: $rate , maxRating: 5, starColor: .yellow)
                                                        
    
                                                                  
                                                                
                                                            }
                                                            .padding(.top,0)
                                                            Spacer()
    //                                                        Text("3 months ago")
                                                            
                                                            Text(ext.timeAgo(time: "2022-12-05T07:07:15.933Z"))
                                
                                                                .font(.system(size:12))
                                                                .padding(.bottom,8)
                                                        }
                                                        
                                                    }
                                                    //  .frame(width:.infinity,height:40)
                                                    
                                                    Text("sdsdsdasdasdasdadasd")
                                                        .lineLimit(5)
                                                    
                                                    
                                                }.padding(.trailing,10)
                                            }
                                        
                                            
                                         
                                        }
                                        
                                        //  .padding(.leading,10)
                                        
                                        
                                    }
                                    .frame(width:reader.size.width * 0.85)
                                    //.padding(.leading,10)
                                    Divider()
                                    
                                }
                                HStack(spacing:15){
                                    
                                    Button{
                                        
                                        let id = product_listVm.id
                                        let paymentArray = product_listVm.PaymentGateway.sorted()
                                        
                                        print(paymentArray)

                                       
                                        do {
                                            request.predicate = NSPredicate(format: "id == %@", id)
                                          let entities = try viewContext.fetch(request)
                                          if let entity = entities.first {
                                              
                                             print("chal")
                                         
                                            // Update the values of the existing entity
                                           entity.no_of_orders += 1
                                            print(entity)
                                          }
                                            else if self.entities.isEmpty{
                                                // Create a new entity and save it to the context
                                                coreDM.saveList(
                                                    listPaymentOption: product_listVm.PaymentGateway, listId:self.product_listVm.id ,
                                                    listname: self.product_listVm.name ?? "Name",listdesc: self.product_listVm.slug ?? "Slug"
                                                    , listprice: Int32(self.product_listVm.price), listimage: self.product_listVm.image ?? "",listInc_Desc: Int32(self.no_of_product_card ))
                                                populateList()
                                                // try viewContext.save()
                                            }
                                            else{
                                                
                                                 
                let R: NSFetchRequest<MyProductCardList> = MyProductCardList.fetchRequest()
                 
        let tasks = try viewContext.fetch(R)

                 var roomDataArray = [""]
                 for task in tasks
                {
                     roomDataArray  = task.paymentOptions!.sorted()
                  }
                    print(roomDataArray)
            let listSet = NSSet(array: paymentArray)
            let findListSet = NSSet(array: roomDataArray)
            let allElemtsEqual = listSet.isSubset(of: findListSet as! Set<AnyHashable>)
                                                if allElemtsEqual == true{
                                                    print("Payment gateway same")
                                                                                                    coreDM.saveList(
                                                                                                        listPaymentOption: paymentArray, listId:self.product_listVm.id ,
                                                                                                        listname: self.product_listVm.name ?? "Name", listdesc: self.product_listVm.slug ?? "Slug"
                                                                                                        , listprice: Int32(self.product_listVm.price), listimage: self.product_listVm.image ?? "",listInc_Desc: Int32(self.no_of_product_card ))
                                                                                                    populateList()
                                                }
                                                else
                                                {
                                                    print("Payment gateway change")
                                                }
          print(allElemtsEqual)

                                                
                                            }
                                            
                   } catch {
                                          print("Error fetching or saving data: \(error)")
                                        }

                                       
                                     
                                        
                                    }label:{
                                        Text("Add to Cart")
                                        // 120 for 8
                                            .frame(width:120,height:16)
                                            .filledButton()
                                        
                                        
                                    }
                                    Button{
                                        self.pushtoAddtoCart.toggle()
                                    }label:{
                                        Text("Buy Now")
                                        // 120for 8
                                            .frame(width:120,height:16)
                                            .filledWhiteButton()
                                    }
                                }
                                // for 8
                                //  .padding(.leading,10)
                                .padding(.top, 20)
                                VStack(alignment:.leading){
                                    Text("Similar Service")
                                        .basicText()
                                    
                                    ScrollView(.horizontal){
                                        
                                        HStack(spacing:5){
                                            ForEach(0..<6)
                                            {i in
                                                ZStack{
                                                    Image(icon: .Shirt)
                                                        .resizable()
                                                        .frame(width:150,height:150,alignment: .leading)
                                                    VStack{
                                                        HStack{
                                                            Button{}label:{
                                                                
                                                                HStack(spacing:2){
                                                                    Image(icon: .star)
                                                                        .resizable()
                                                                        .renderingMode(.template)
                                                                        .frame(width: 10, height: 10)
                                                                        .foregroundColor(Color(hex:0xfa6108))
                                                                    Text("4.5")
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
                                                                    
                                                                    Text("Formal Shirts")
                                                                        .font(.system(size:12))
                                                                    
                                                                        .fontWeight(.heavy)
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                            
                                                            
                                                            Spacer()
                                                            
                                                            HStack(spacing:1){
                                                                Text("AED")
                                                                    .font(.system(size: 8))
                                                                    .padding(.top,6)
                                                                Text("18")
                                                                    .font(.system(size:15))
                                                                
                                                                    .fontWeight(.heavy)
                                                            }
                                                            
                                                            //.offset(x:-150,y:-150)
                                                            
                                                        } .foregroundColor(Color.white)
                                                        
                                                        
                                                    }
                                                    .frame(width: reader.size.width * 0.315, height: reader.size.height * 0.15)
                                                    //    .padding(.bottom,100)
                                                }
                                            }
                                        }
                                        
                                    }
                                    // .frame(minHeight: 140)
                                    .frame(height:160)
                                    
                                    
                                }
                                
                                
                            }
                            
                            // for 8 ans se2nd 320
                            .padding(.leading,10)
                            .padding(.bottom,400)
                            // .padding(.bottom,420)
                            .frame(width:reader.size.width * 0.86,height: reader.size.height * 0.835)
                            
                            //.padding(.vertical,reader.size.height * (-0.4))
                            .background(Color.gray)
                            
                        }
                        
                        
                        
                        
                        
                    }
                    //                               .padding(.bottom,350)
                    
                    
                    
                    
                    
                    
                }
                .onAppear{
                    //
            
                 
                    
                
                    //
                    Task{
                        if let product_card_slug = UserDefaults.standard.string( forKey: "product_slug")
                        {
                            print(product_card_slug)
                            await
                            //product_listVm.products(slug: product_card_slug)
                            //test232
                            //armani-bags- cash//online
                            //stylish-women-blazer-6 cash/online
                            //test232 poA
                            //"laptop-bag-new-style" pOA
                            //stylish-women-blazer-2 OP
                            // women-top-skirts- PAY_ON_ARRIVAL", "ONLINE_PAYMENTS"
                           //bags-leather-and-fleese-finish
                            // "CASH_ON_DELIVERY",
                            ///"PAY_ON_ARRIVAL",
                            //"ONLINE_PAYMENTS"
                            product_listVm.products(slug: "stylish-women-blazer-2")
                        }
                    }
                    
                   
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

struct Store_Product_Detail_0_Previews: PreviewProvider {
    static var previews: some View {
        Store_Product_Simple()
    }
}
