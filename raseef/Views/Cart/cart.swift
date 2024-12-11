//
//  cart.swift
//  raseef
//
//  Created by Teamx tec on 29/10/2022.
//

import SwiftUI

struct cart: View
{
    @State var searchText = ""
    
 //   @State var navbarhomeColor = false
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false

    @State var instruction = ""
    @State var placeholderText = "Special Instruction"
    @State var Inc = 1
    @State var pushtoStore_P_D_1 = false
    //////////
    @State private var product_list: [MyProductCardList] = [MyProductCardList]()
    @StateObject var coreDM: ProductListManager = ProductListManager.shared
    @State var inc : Int = 0
    ///
    @State var p_price = 0;
    @State var orders = 1;
    @State var p_o = 0;
    @State var card_sum = 0 ;
    @State var vat_on_5_percent : Double = 0 ;
    @State var total : Double = 0 ;
    //
    @State var pushtoCheckout = false
    private func populateList() {
        product_list = coreDM.getAllList()
       
    }
    public func deleteTodo(todo: MyProductCardList){
        coreDM.deleteList(productlist: todo)
        populateList()
   }
    @FetchRequest(
            entity: MyProductCardList.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \MyProductCardList.name, ascending: false)
            ]
        ) var entities: FetchedResults<MyProductCardList>
   
    var body: some View {
       
        NavigationView{
           
         
           
            ZStack{
                
                         NavigationLink("",destination: StoreProfile()
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
                NavigationLink("",destination:checkout(Total: $total)
                    .navigationBarHidden(true)
                               ,isActive: $pushtoCheckout)
                GeometryReader { reader in
                   
                    
                    ScrollView{
                        
                        VStack(spacing:25){
                            
                           
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
                                ForEach(entities,id: \.self)
                                { l in
                                    ZStack {
                                        
                                        
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .fill(.white)
                                        
                                        VStack{
                                           
                                            HStack {
                                            AsyncImage(url: URL(string: l.image ?? "")) { image in
                                                                                    image
                                                                                        .resizable()
                                                                                        .frame(width: 90, height:100)                               //.aspectRatio(contentMode: .fill)
                                                
                                                                                } placeholder: {
                                                                                    ProgressView()
                                                                                        .frame(width: 90, height:100)
                                                                                }
                                               
                                                
                                                
//                                                Image(icon: .Clothesshop)
//                                                    .resizable()
//                                                    .frame(width: 100, height:90)
                                                VStack(alignment:.leading,spacing: 3){
                                                    
                                                    Text(l.name ?? "Formal Pants")
                                                        .basicText()
                                                    Text(l.detail ?? "Laundry Basket")
                                                        .smallText()
                                                    
                                                    HStack(spacing:2){
                                                        Text("\(l.price)")
                                                            .font(.system(size: 12))
                                                        Text("AED")
                                                            .font(.system(size: 8))
                                                            .padding(.top,5)
                                                        
                                                    }
                                                    .foregroundColor(Color(hex:0xFA6109))
                                       
                                                }
                                                Spacer()
                                                VStack{
                                                    HStack(spacing:5){
                                                        // Spacer()
                                                        
                                                        Button{
                                                            
                                                            self.Inc+=1
                                                            l.no_of_orders = Int32(self.Inc)
                                                        }label:{
                                                            
                                                            Image(icon: .plus)
                                                                .foregroundColor(Color.white)
                                                                .frame(width: 10, height: 10)
                                                        }
                                                        
                                                        Text("\(l.no_of_orders)")
                                                            .foregroundColor(Color.orange)
                                                            .frame(width: 30, height: 10)
                                                        Button{
                                                            self.Inc-=1
                                                            l.no_of_orders = Int32(self.Inc)
                                                        }label:{
                                                            
                                                            Image(icon: .minus)
                                                                .foregroundColor(Color(hex: 0xFA6109))
                                                                .frame(width: 10, height: 10)
                                                            
                                                        }
                                                        
                                                    }
                                                    //.frame(width: 80, height: 20)
                                                    
                                                    Spacer()
                                                    
                                                    HStack{
                                                        Button{
                                                            deleteTodo(todo:l)
                                                          self.EmptyStateVariarble()
                                                        self.calculation()
                                                            
                                                        }label:{
                                                            Text("Delete")
                                                        }
                                                        
                                                    }.padding(.leading,10)
                                                    
                                                }
                                             
                                            }
                            
                                   
                                            
                                        }
                                        
                                        .frame(width: reader.size.width * 0.85 , height: 90)
                                        //.padding(20)
                                        //.multilineTextAlignment(.center)
                                        
                                    }
                                    .frame(height: 150)
                                    
                                    .border(Color.gray, width: 1)
//                                    .onAppear{
//
//                              self.Inc = Int(l.no_of_orders)
//                                        print(self.Inc)
//                                        print(l.no_of_orders)
//                                    }
                                }
                                
                            }
                            
                            .frame(height: reader.size.width * 0.38)
//                                        ZStack {
//                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
//                                                .fill(.white)
//
//                                            VStack{
//                                                HStack {
//                                                    AsyncImage(url: URL(string: l.image ?? "")) { image in
//                                                        image
//                                                            .resizable()
//                                                            .aspectRatio(contentMode: .fill)
//
//                                                    } placeholder: {
//                                                        Color.gray
//                                                    }
//                                                    .frame(width: 100, height:90)
//
//
//                                                    //                                            Image(icon: .Clothesshop)
//                                                    //                                                .resizable()
//                                                    //                                                .frame(width: 100, height:90)
//                                                    VStack(alignment:.leading,spacing: 3){
//
//                                                        Text(l.name ?? "Formal Pants")
//                                                            .basicText()
//                                                        Text(l.detail ?? "Laundry Basket")
//                                                            .smallText()
//
//                                                        HStack(spacing:2){
//                                                            Text("\(l.price)")
//                                                                .font(.system(size: 12))
//                                                            Text("AED")
//                                                                .font(.system(size: 8))
//                                                                .padding(.top,5)
//
//                                                        }
//                                                        .foregroundColor(Color(hex:0xFA6109))
//                                                    }
//                                                    Spacer()
//                                                    VStack{
//                                                        HStack(spacing:5){
//                                                            // Spacer()
//
//                                                            Button{
//                                                                self.inc-=1
//                                                            }label:{
//
//                                                                Image(icon: .plus)
//                                                                    .foregroundColor(Color.white)
//                                                                    .frame(width: 10, height: 10)
//                                                            }
//                                                            Text("\(l.no_of_orders)")
//                                                                .foregroundColor(Color.orange)
//                                                                .frame(width: 30, height: 10)
//                                                            Button{
//                                                                self.inc+=1
//                                                            }label:{
//
//                                                                Image(icon: .minus)
//                                                                    .foregroundColor(Color(hex: 0xFA6109))
//                                                                    .frame(width: 10, height: 10)
//
//                                                            }
//
//                                                        }
//                                                        //.frame(width: 80, height: 20)
//
//                                                        Spacer()
//
//                                                        HStack{
//                                                            Button{}label:{
//                                                                Text("Delete")
//                                                            }
//
//                                                        }.padding(.leading,10)
//
//                                                    }
//                                                }
//                                            }
//
//                                            .frame(width: reader.size.width * 0.85 , height: 90)
//                                            //.padding(20)
//                                            //.multilineTextAlignment(.center)
//                                        }
//                                        .frame(height: 120)
//                                        .border(Color.gray, width: 1)
                                   
                             
                         
                             
                          
                         
                            ZStack {
                                       RoundedRectangle(cornerRadius: 15, style: .continuous)
                                           .fill(.white)
                                        
                                VStack{
                                    ZStack {
                                        if self.instruction.isEmpty {
                                                TextEditor(text:$placeholderText)
                                                .font(.body)
                                                                .foregroundColor(.gray)
                                                                .disabled(true)
                                                                .padding(.horizontal,0)
                                        }
                                        TextEditor(text: $instruction)
                                            .font(.body)
                                            .opacity(self.instruction.isEmpty ? 0.25 : 1)
                                            .padding(.horizontal,0)
                                    }
                                        //.padding(.bottom,100)
                                }
                                .frame(width:reader.size.width * 0.88)
                                
                                       //.padding(20)
                                       //.multilineTextAlignment(.center)
          }
                            .frame(height: 150)
                                   .border(Color.gray, width: 1)
                               
                            ZStack {
                                       RoundedRectangle(cornerRadius: 15, style: .continuous)
                                           .fill(.white)
                                        
                                VStack{
                                    HStack{
                                        
                                        Text("Subtotal")
                                        Spacer()
                                        
                                        Text("\(card_sum)")
                                        
                                    }
                                    Divider()
                                    HStack{
                                        
                                        Text("Vat(5%)")
                                        Spacer()
                                        
                                        Text("\(self.vat_on_5_percent,specifier: "%.2f")")
                                        
                                    }
                                    Divider()
                                    HStack{
                                        
                                        Text("Total")
                                        Spacer()
                                        
                                        Text("\(self.total,specifier: "%.2f")")
                                        
                                    }.padding(.top,7)
                                   
                                }
                                .padding(.horizontal,5)
                                .frame(width:reader.size.width * 0.88)
                               
                                
          }
                            .frame(height: 150)
                                   .border(Color.gray, width: 1)
                            
                       
                            
                            
                            Button{
                                
                                self.pushtoCheckout = true
                            }
                        label:{

                            Text("Checkouts")
                                .frame(maxWidth: 300)
                                .filledButton()
                        }
                            
                            
                    }
                        .padding(.top,30)
                        .padding(.horizontal,15)
                    }
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
                    Text("Cart")
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
            .onAppear{
                
              
                UserDefaults.standard.removeObject(forKey: "amount")
                
                self.calculation()
               
            }
            
            }
       
       
    }
    func EmptyStateVariarble(){
        self.p_price = 0
        self.orders = 1
        self.p_o = 0
        self.card_sum = 0
    }
    func calculation(){
        //print(entities.count)
        
        for indx in 0..<entities.count{
            self.p_price = Int(entities[indx].price)
           
            self.orders = Int(entities[indx].no_of_orders)
           
            if self.orders <= 0
            {
                self.orders = 1
            }
            self.p_o = p_price * orders
            
          
            self.card_sum += self.p_o
            
        }
        
        
        self.vat_on_5_percent  = Double(((self.card_sum * 5) / 100))
       // print(self.vat_on_5_percent)
        self.total = Double(self.card_sum) + self.vat_on_5_percent
        
        UserDefaults.standard.set(self.total, forKey: "amount")
        //print(self.total)
    }
}

struct cart_Previews: PreviewProvider {
    static var previews: some View {
        cart()
            .environment(\.managedObjectContext, ProductListManager.shared.viewContext)
    }
}
