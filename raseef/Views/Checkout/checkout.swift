//
//  checkout.swift
//  raseef
//
//  Created by Teamx tec on 14/11/2022.
//

//
//  cart.swift
//  raseef
//
//  Created by Teamx tec on 29/10/2022.
//

import SwiftUI
import CoreData


    struct Mylist: Codable {
        let products: [MylistProduct]
    }

    // MARK: - Product
    struct MylistProduct: Codable {
        let productID: String?
        let orderQuantity, unitPrice, subtotal: Int?

        enum CodingKeys: String, CodingKey {
            case productID = "product_id"
            case orderQuantity = "order_quantity"
            case unitPrice = "unit_price"
            case subtotal
        }
    }
    

struct checkout: View
{

  
    var sub: Double{
       
        
        let po = UserDefaults.standard.double(forKey: "amount")
        return po
    }
        
        
  
    
    
    
    @State var searchText = ""
    
 //   @State var navbarhomeColor = false
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
///
    @State var instruction = ""
    @State var placeholderText = "Special Instruction"
    @State var inc = 1
    @State var pushtoStore_P_D_1 = false
    ////////// Payment variable
    @State var Mastercard_Check = false
    @State var Paypal_Check = false
    @State var Applepay_Check = false
    @State var Payonarrival_Check = false
    @State var CashOnDelivery = false
    ////////// Vehicle Ident variable
    @State var CarIdent_Check = false
    @State var OtherIdent_Check = false
    //
    @State var pushToPaymentMethod = false
    //
    @State var pushtoPaypalview = false
    @State var pushtoAppleView = false
    @State var pushToShippingAdress = false

   // @ObservedObject var CreateOrdersVM = CreateOrdersViewModel()
    @FetchRequest(
            entity: MyProductCardList.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \MyProductCardList.name, ascending: false)
            ]
        ) var entities: FetchedResults<MyProductCardList>
    //
    @State var otherway = ""
    @Binding var Total : Double
////////////
   
   
    //
    @ObservedObject var CreateOrderVM = Create_OrderViewModel()
    let persistenceController = ProductListManager.shared
    
    let fetchRequest: NSFetchRequest<MyProductCardList> = MyProductCardList.fetchRequest()
    
    @State var paymentNo = 0;
    
    
@ObservedObject var AppleViewModel = PaymentHandler()
   
    @ViewBuilder var body: some View {
       
        NavigationView{
           
         
           
            ZStack{
                NavigationLink("",destination: PaymentCardList()
                    .navigationBarHidden(true)
                               ,isActive: $pushToPaymentMethod)
                
                         NavigationLink("",destination: Store_Product_Variable()
                             .navigationBarHidden(true)
                                        ,isActive: $pushtoStore_P_D_1)
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
                   
                    
                    ScrollView{
                
                        VStack(alignment:.leading,spacing:10){
                            
                            
                            HStack(spacing:0){
                                HStack{
                                    Image(icon: .map_icon)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Drop to Starbucks, Dubai Walk")
                                        .font(.system(size: 12))
                                    
                                }
                                Spacer()
                                Text("2 min walk")
                                    .font(.system(size: 10))
                                
                            }
                            ScrollView{
                                ScrollView{
                                    ForEach(entities,id: \.self)
                                    { l in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .fill(.white)
                                            
                                            VStack(alignment:.leading,spacing:10){
                                                HStack {
                                                    
                                                    AsyncImage(url: URL(string: l.image ?? "")) { image in
                                                        image
                                                            .resizable()
                                                            .frame(width: 100, height:100)                               //.aspectRatio(contentMode: .fill)
                                                        
                                                    } placeholder: {
                                                        ProgressView()
                                                            .frame(width: 90, height:100)
                                                    }
                                                    VStack(alignment:.leading,spacing: 4){
                                                        
                                                        Text(l.name ?? "Formal Pants")
                                                            .basicText()
                                                        Text(l.detail ?? "Laundry Basket")
                                                            .smallText()
                                                        HStack{
                                                            HStack(spacing:2){
                                                                Text("\(l.price)")
                                                                    .font(.system(size: 12))
                                                                Text("AED")
                                                                    .font(.system(size: 8))
                                                                    .padding(.top,5)
                                                                
                                                            }
                                                            .foregroundColor(Color(hex:0xFA6109))
                                                            Spacer()
                                                            
                                                            Text("Qty:\(l.no_of_orders)")
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                
                                                HStack{
                                                    
                                                    Text("Note: Seperate wash with hanger")
                                                        .basicText()
                                                    
                                                }
                                                
                                                
                                            }
                                            
                                            .frame(width: reader.size.width * 0.85 , height: 90)
                                            //.padding(20)
                                            //.multilineTextAlignment(.center)
                                        }
                                        .frame(height: 170)
                                        .border(Color.gray, width: 1)
                                    }} .frame(height: reader.size.width * 0.38)
                            
                            Divider()
                            
                            HStack{
                                
                                Text("Total")
                                  
                                Spacer()
                                
                                Text("AED \(self.sub,specifier: "%.2f")")
                                  
                            }.foregroundColor(Color(hex:0xFA6109))
                            VStack(alignment:.leading,spacing:10){
                                
                                
                                Text("Select Payment Methods")
                                
                                if self.paymentNo == 1
                                {


                                    HStack(spacing:5){

                                        Button{
                                            let stripeId =   UserDefaults.standard.string(forKey: "stripe_id") ?? ""
                                            if (stripeId.starts(with: "pm")){
                                                UserDefaults.standard.removeObject(forKey: "paypal_id")
                                                /// if apple id present removeobject here
                                                self.Mastercard_Check = true
                                                self.Paypal_Check = false
                                                self.Applepay_Check = false
                                            }
                                            else{
                                                print("No Stripe card id not exist")
                                            }
                                        }
                                    label:{


                                        Image(systemName:Mastercard_Check ? "circle.circle":"circle")
                                            .foregroundColor(Color.black)
                                    }


                                        Image(icon: .apple_logo)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Credit Card")
                                        Spacer()

                                        Button{
                                            self.pushToPaymentMethod = true
                                            UserDefaults.standard.set(self.pushToPaymentMethod, forKey: "pushfromCheckout")
                                        }label:{

                                            Image(systemName: "greaterthan")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                        }
                                    }
                                    Divider()
                                    HStack(spacing:5){

                                        Button{

                                            self.pushtoPaypalview = true

                                                UserDefaults.standard.removeObject(forKey: "stripe_id")
                                                /// if apple id present removeobject here
                                                self.Mastercard_Check = false
                                                self.Paypal_Check.toggle()
                                                self.Applepay_Check = false




                                        }
                                    label:{


                                        Image(systemName:Paypal_Check ? "circle.circle":"circle")
                                            .foregroundColor(Color.black)

                                    }.sheet(isPresented: $pushtoPaypalview) {
                                            ConnectingPaypalView()

                                       }


                                        Image(icon: .apple_logo)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Paypal")



                                    }
                                    Divider()
                                    HStack(spacing:5){

                                        Button{
                                            self.pushtoAppleView = true

                                                UserDefaults.standard.removeObject(forKey: "paypal_id")
                                                UserDefaults.standard.removeObject(forKey: "stripe_id")
                                                self.Mastercard_Check = false
                                                self.Paypal_Check = false
                                                self.Applepay_Check.toggle()

                                        }
                                    label:{


                                        Image(systemName:Applepay_Check ? "circle.circle":"circle")
                                            .foregroundColor(Color.black)
                                            .foregroundColor(Color.black)
                                    }.sheet(isPresented: $pushtoAppleView) {
                                       AppleView()

                                   }



                                        Image(icon: .apple_logo)
                                            .resizable()
                                            .frame(width: 20, height: 20)

                                        Text("Apple Pay")



                                    }
                                    Divider()

                                }
                                if self.paymentNo == 2
                                {
                                    HStack(spacing:5){
                                        
                                        Button{
                                            self.pushToShippingAdress = true
                                            if self.pushToShippingAdress
                                            {
                                                self.CashOnDelivery = true
                                            }
                                         
                                        }
                                    label:{
                                        
                                        
                                        Image(systemName:CashOnDelivery ? "circle.circle":"circle")
                                            .foregroundColor(Color.black)
                                        Text("Cash on arrival")
                                                                                  
                                                                                  Spacer()
                                    }
                                    .sheet(isPresented: $pushToShippingAdress)
                                        {
                                         ShippingAddressForm()
                                            
                                        }
                                        
                                    }}
                                else if self.paymentNo == 3
                                {
                                    HStack(spacing:5){
                                        
                                        Button{
                                            self.Payonarrival_Check = true
                                        }
                                    label:{
                                        
                                        
                                        Image(systemName:Payonarrival_Check ? "circle.circle":"circle")
                                            .foregroundColor(Color.black)
                                        
                                        Text("Pay on arrival")
                                                                                  
                                                                                  Spacer()

                                    }
                                        
                                    }}
                                else if self.paymentNo == 4{
                                    HStack{
                                        Text("No payment")
                                    }
                                   
                                }
                            }
                            .padding(.top,12)
                            .padding(.bottom,12)

                            }
                            VStack(alignment:.leading,spacing:10){
                             
                                
                                Text("Vehicle Identification")
                          
                                HStack(spacing:5){
                                    
                                    Button{
                                        self.CarIdent_Check.toggle()
                                    }
                                label:{
                                    
                                        
                                    Image(systemName: self.CarIdent_Check ? "circle.circle" : "circle")
                                        .foregroundColor(Color.black)
                                }
                                    
                                    
                                    
                                    Text("Car(AXC-678)")
                                }
                                Divider()
                                HStack(spacing:5){
                                    
                                    Button{
                                        self.OtherIdent_Check.toggle()
                                    }
                                label:{
                                  
                                       
                                    Image(systemName: self.OtherIdent_Check ? "circle.circle" : "circle")
                                        .foregroundColor(Color.black)
                                }
                                 
                                    
                                   
                                    Text("Other")
                                }
                               
                            }
                            .padding(.bottom,12)
                            VStack(spacing:12){
                                TextField("Walk/ other vehicle", text: $otherway)
                                    .frame(height: 30)
                                   
                                      
                                    .padding([.horizontal], 15)
                                        //.cornerRadius(15)
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.gray))
                                      //  .padding([.horizontal], 24)
                                  
                                Button{


                              
                                  
                                                if self.Mastercard_Check {
                                                   if let pid =
                                                        UserDefaults.standard.string( forKey: "stripe_id"){
                                                       var params: [String: Any?] =
                                                       [
                                                        "amount": sub,
                                                        "discount": 0,
                                                        "paid_total": nil,
                                                        "total": nil,
                                                        "payment_method_id": pid,
                                                        "customer_contact": "+923218932626",
                                                        "use_wallet": false,
                                                        "payment_gateway": "STRIPE"
                                                       ]
                                                       for i in 0..<entities.count{
                                                           let id = entities[i].value(forKey: "id") as! String
                                                           let oq = entities[i].value(forKey: "no_of_orders") as! Int
                                                           let p = entities[i].value(forKey: "price") as! Int
                                                           let products: [String: Any] = [
                                                            
                                                            "product_id": id,
                                                            "order_quantity" : oq,
                                                            "unit_price": p,
                                                            "subtotal":sub
                                                            
                                                           ]
                                                           
                                                           // get existing items, or create new array if doesn't exist
                                                           var existingItems = params["products"] as? [[String: Any]] ?? [[String: Any]]()
                                                           
                                                           // append the item
                                                           existingItems.append(products)
                                                           
                                                           // replace back into `data`
                                                           params["products"] = existingItems
                                                       }
                                                       print(params)
                                                       
                                                                                                           Task{
                                                                                                               await
                                                                                                               self.CreateOrderVM.CreateOrder(parameterString: params)
                                                                                                           }
                                                   }
                                                    else{
                                                        print("kindly select credit card")
                                                    }



                                                }
                                                else if self.Paypal_Check{
                                                  if let paypal_id =     UserDefaults.standard.string(forKey: "paypal_id"){
                                                        var params: [String: Any?] = [
                                                            
                                                            "amount": sub,
                                                            "discount": 0,
                                                            "paid_total": nil,
                                                            "total": nil,
                                                            "paypal_payment_id": paypal_id,
                                                            "customer_contact": "+923218932626",
                                                            "use_wallet": false,
                                                            "payment_gateway": "PAYPAL"
                                                        ]
                                                        for i in 0..<entities.count{
                                                            let id = entities[i].value(forKey: "id") as Any
                                                            let oq = entities[i].value(forKey: "no_of_orders") as Any
                                                            let p = entities[i].value(forKey: "price") as Any
                                                            let products: [String: Any] = [
                                                                "product_id": id,
                                                                "order_quantity" : oq,
                                                                "unit_price": p,
                                                                "subtotal":sub
                                                                
                                                            ]
                                                            
                                                            // get existing items, or create new array if doesn't exist
                                                            var existingItems = params["products"] as? [[String: Any]] ?? [[String: Any]]()
                                                            
                                                            // append the item
                                                            existingItems.append(products)
                                                            
                                                            // replace back into `data`
                                                            params["products"] = existingItems
                                                        }
                                                        print(params)
                                                        
                                                                                                            Task{
                                                                                                                await
                                                                                                                self.CreateOrderVM.CreateOrder(parameterString: params)
                                                                                                            }
                                                    }
                                                    else{
                                                        print("kindly complete pyapl process")
                                                    }
                                                }
                                                else if self.Applepay_Check{
                                                    if UserDefaults.standard.string(forKey:"IsAppleSuccess") != nil
                                                    {
                                                        var params: [String: Any?] =
                                                        [
                                                           
                                                            "amount": sub,
                                                            "discount": 0,
                                                            "paid_total": nil,
                                                            "total": nil,
                                                            "customer_contact": "+923218932626",
                                                            "use_wallet": false,
                                                            "payment_gateway": "APPLE PAY",
                                                            "payment_method_id": "pm_1MJIAAGn3F7BuM88SMTNX43B",
                                                            "customer": "63a9b5f39ad1b2e00ab67070"
                                                        ]
                                                        for i in 0..<entities.count{
                                                            let id = entities[i].value(forKey: "id") as Any
                                                            let oq = entities[i].value(forKey: "no_of_orders") as Any
                                                            let p = entities[i].value(forKey: "price") as Any
                                                            let products: [String: Any] = [
                                                                "product_id": id,
                                                                "order_quantity" : oq,
                                                                "unit_price": p,
                                                                "subtotal":sub
                                                                
                                                            ]

                                                            // get existing items, or create new array if doesn't exist
                                                            var existingItems = params["products"] as? [[String: Any]] ?? [[String: Any]]()

                                                            // append the item
                                                            existingItems.append(products)

                                                            // replace back into `data`
                                                            params["products"] = existingItems
                                                        }
                                                        print(params)
                                                    }
                                                    else{
                                                        print("apple payment Not success kindly complete it")
                                                    }
                                               
                                                }
                                                else if self.CashOnDelivery{
                                                    var params: [String: Any?] =
                                                    [
                                                      
                                                        "amount": sub,
                                                        "discount": 0,
                                                        "paid_total": nil,
                                                        "total": nil,
                                                        "customer_contact": "+923218932626",
                                                        "use_wallet": false,
                                                        "payment_gateway": "CASH_ON_DELIVERY",
                                                        "shipping_address":[
                                                            "street_address": "C-110, Shamsi Society near Wireless gate, Karachi",
                                                            "country": "Pakistan",
                                                            "city": "Karachi",
                                                            "state": "Sindh",
                                                            "zip": "75210",
                                                            "_id": ""

                                                        ]
                                                    ]
                                                    for i in 0..<entities.count{
                                                        let id = entities[i].value(forKey: "id") as Any
                                                        let oq = entities[i].value(forKey: "no_of_orders") as Any
                                                        let p = entities[i].value(forKey: "price") as Any
                                                        let products: [String: Any] = [
                                                            "product_id": id,
                                                            "order_quantity" : oq,
                                                            "unit_price": p,
                                                            "subtotal":sub
                                                            
                                                        ]

                                                        // get existing items, or create new array if doesn't exist
                                                        var existingItems = params["products"] as? [[String: Any]] ?? [[String: Any]]()

                                                        // append the item
                                                        existingItems.append(products)

                                                        // replace back into `data`
                                                        params["products"] = existingItems
                                                    }
                                                    print(params)




                                                }
                                    else if Payonarrival_Check{
                                        var params: [String: Any?] =
                                        [
                                          
                                            "amount": sub,
                                            "discount": 0,
                                            "paid_total": nil,
                                            "total": nil,
                                            "customer_contact": "+923218932626",
                                            "use_wallet": false,
                                            "payment_gateway": "PAY_ON_ARRIVAL"
                                            

                                            
                                        ]
                                        for i in 0..<entities.count{
                                            let id = entities[i].value(forKey: "id") as Any
                                            let oq = entities[i].value(forKey: "no_of_orders") as Any
                                            let p = entities[i].value(forKey: "price") as Any
                                            let products: [String: Any] = [
                                                "product_id": id,
                                                "order_quantity" : oq,
                                                "unit_price": p,
                                                "subtotal":sub
                                                
                                            ]

                                            // get existing items, or create new array if doesn't exist
                                            var existingItems = params["products"] as? [[String: Any]] ?? [[String: Any]]()

                                            // append the item
                                            existingItems.append(products)

                                            // replace back into `data`
                                            params["products"] = existingItems
                                        }
                                        print(params)

                                    }
                                      
                                        
                                        

                                }label:{
                                    
                                    Text("Pay Now")
                                  
                                        .frame(maxWidth: 300,maxHeight: 15)
                                   
                                      .filledButton()
                                }
                                    
                                    
                            }
                               

                            
                    }
                        .padding(.top,20)
                        .padding(.horizontal,15)
                    }
                    .background(Color(hex: 0xffffff))
                    // 8 530
                    
                    .frame(width: reader.size.width , height:700)
                  
                    Image(icon: .navbar)
                        .resizable()
                    
                        .frame(width: reader.size.width,height: reader.size.height * 0.13, alignment: .top)
                        .ignoresSafeArea()
              
            }
            .ignoresSafeArea(.keyboard)
           
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                             self.pushtoStore_P_D_1 = true
                        }label:{
                            Image(icon: .back)
                               // .font(.largeTitle.bold())
                                //.foregroundColor(Color.white)
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                    }
                   
                    ToolbarItem {
                    Text("Checkout")
                            .foregroundColor(Color.white)
                            .font(.system(size:20,weight: .bold))
                        .padding(.top,10)
                        .padding(.trailing,160)
                        
                        
                        
                        
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
           
            .task{
//                let R: NSFetchRequest<MyProductCardList> = MyProductCardList.fetchRequest()
//
//        let tasks = try viewContext.fetch(R)
//
//                 var roomDataArray = [""]
                var common = [String]()
                 for task in entities
                {
                   //  print(task.name as Any)
              //  print(task.paymentOptions!.sorted())
                     common.append(contentsOf: task.paymentOptions!.sorted())
                  }
               print(common)
                var elementCounts: [String: Int] = [:]

                for element in common {
                    elementCounts[element, default: 0] += 1
                }

                let duplicates = elementCounts.filter { $0.value > 1 }.map { $0.key }

                print(duplicates) // Prints "["apple", "banana"]"
                
                    //print(roomDataArray)
                
                for i in duplicates{
                     if i == "ONLINE_PAYMENTS"
                    {
                         self.paymentNo = 1
                     }
                    else if i == "CASH_ON_DELIVERY"
                    {
                        self.paymentNo = 2
                    }
                    else if i == "PAY_ON_ARRIVAL"{
                        self.paymentNo = 3
                    }
                    else{
                        self.paymentNo = 4
                    }
                }
                
            }
            }
       
       
    }
}

struct checkout_Previews: PreviewProvider {
    static var previews: some View {
        checkout(Total: .constant(6.5))
            .environment(\.managedObjectContext, ProductListManager.shared.viewContext)
    }
}
