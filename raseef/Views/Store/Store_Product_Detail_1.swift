////
////  Store_Product_Detail_1.swift
////  raseef
////
////  Created by Teamx tec on 27/10/2022.
////
//
////
////  Store_Product_Detail.swift
////  raseef
////
////  Created by Teamx tec on 27/10/2022.
////
//
//import SwiftUI
//
//struct RoundedCornersShape: Shape {
//    let corners: UIRectCorner
//    let radius: CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect,
//                                byRoundingCorners: corners,
//                                cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//
//
//struct Store_Product_Detail_1: View {
//    @State var navbarhome = false
//    @State var navbarprofile = false
//    @State var navbarshop = false
//    @State var navbarnotify = false
//    @State var radiocheck1 = false
//    @State var radiocheck2 = false
//    @State var radiocheck3 = false
//    @State  var inc = 1
//    @State var pushtoStoreProfile = false
//    @State var pushtoCartView = false
//    // @ObservedObject var logs = Logic()
//    @ObservedObject var productType = ProductTypeListViewModel()
//    //@State var radiobutton = [Bool]()
//    @State var checkRadioList : [Variations] = []
//    
//    // My extra varaible to check cond
//    
//    @State var extra = 0
//    @State var showimg = false
//    //
//    @State var bol = false
//    
//    
//    
//    var body: some View {
//        NavigationView{
//            ZStack{
//                NavigationLink("",destination: StoreProfile()
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                               ,isActive: $pushtoStoreProfile)
//                NavigationLink("",destination: cart()
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                               ,isActive: $pushtoCartView)
//                GeometryReader { reader in
//                    
//                    VStack{
//                        
//                        VStack(spacing:20){
//                            ZStack{
//                                NavigationLink("",destination:YourLocation()
//                                    .navigationBarHidden(true)
//                                               ,isActive: $navbarhome)
//                                NavigationLink("",destination:ContentView()
//                                               
//                                               ,isActive: $navbarprofile)
//                                NavigationLink("",destination:StoreProfile()
//                                    .navigationBarHidden(true)
//                                               ,isActive: $navbarshop)
//                                NavigationLink("",destination:YourLocation()
//                                    .navigationBarHidden(true)
//                                               ,isActive: $navbarnotify)
//                                NavigationLink("",destination:YourLocation()
//                                    .navigationBarHidden(true)
//                                               ,isActive: $navbarhome)
//                                Image(icon: .StorePic)
//                                    .resizable()
//                                    .frame(width: reader.size.width * 1, height: reader.size.height * 0.35)
//                                    .clipShape(  RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 40))
//                                
//                                // .cornerRadius(30)
//                                
//                                HStack{
//                                    Button{
//                                        self.pushtoStoreProfile.toggle()
//                                        
//                                    }label:{
//                                        Image(icon: .back)
//                                            .resizable()
//                                            .frame(width: 40, height: 40)
//                                    }
//                                    
//                                    Spacer()
//                                    
//                                    Image(icon: .plus_with_orange)
//                                        .resizable()
//                                        .frame(width: 40, height: 40)
//                                    //.offset(x:-150,y:-150)
//                                    
//                                }
//                                .frame(width: reader.size.width * 0.86, height: reader.size.height * 0.01)
//                                //140 for se 2ndgen
//                                .padding(.bottom,140)
//                                
//                            }
//                            
//                            
//                            ///////////////////
//                            ScrollView(.vertical){
//                                
//                                VStack(alignment:.leading,spacing:10){
//                                    VStack(alignment:.leading){
//                                        HStack(spacing:2){
//                                            Image(icon: .fire)
//                                                .resizable()
//                                                .frame(width: 30, height: 30)
//                                            
//                                            Text("Summer Sale")
//                                                .foregroundColor(Color.black)
//                                                .font(.system(size:25))
//                                            
//                                        }
//                                        
//                                        
//                                        HStack{
//                                            Spacer()
//                                            
//                                            Text("55AED")
//                                            
//                                        }
//                                        .padding(.trailing,10)
//                                        
//                                        Text("1 Coffee with cake slice")
//                                            .padding(.leading,10)
//                                        //  .padding(.bottom,15)
//                                    }
//                                    .padding(.leading,10)
//                                    
//                                    
//                                    
//                                    VStack(alignment:.leading,spacing:10){
//                                        
//                                        Text("Make Your Choice?")
//                                            .foregroundColor(Color.black)
//                                            .font(.system(size:25))
//                                            .padding(.leading,8)
//                                        //  .padding(.bottom,10)
//                                        ForEach(enumerating: (productType.slugDict.keys.sorted()), id: \.self)
//                                        { key,value in
//                                            HStack{
//                                                //  Text("\(key)")
//                                                Text("\(value)")
//                                            }
//                                            
//                                            ForEach(0..<productType.slugDict[value]!.count,id:\.self)
//                                            {
//                                                v in
//                                                HStack(spacing:5){
//                                                    
//                                                    Button{
//                                                        
//                                                        
//                                                        
//                                                        // option id
//                                                        let select_OpId = (productType.slugDict[value]?[v].id ?? "")
//                                                        
//                                                        //option att id
//                                                        let select_AtId = (productType.slugDict[value]?[v].attribute?.id)
//                                                        //print(select_AtId)
//                                                        
//                                                        
//                                                        if checkRadioList.isEmpty{
//                                                            
//                                                            self.checkRadioList.append(productType.slugDict[value]?[v] as Any as! Variations)
//                                                            // self.showimg = true
//                                                        }
//                                                        
//                                                        
//                                                        else if(checkRadioList.isEmpty == false)
//                                                        {
//                                                            for i in 0..<checkRadioList.count{
//                                                                
//                                                                let array_select_Id = self.checkRadioList[i].id
//                                                                if(select_OpId == array_select_Id)
//                                                                {
//                                                                    print("No Work")
//                                                                    
//                                                                    self.extra = 0
//                                                                   
//                                                                    break
//                                                                }
//                                                                // agr yaha not equal wali cond likhi wo usme jakr kam kerdega or loop nh chelega secnd time agr chal gya tu double entry kredega
//                                                                self.extra += 1
//                                                            }
//                                                            if  self.extra == 0{print("no need to check it")}
//                                                            else{
//                                                                for i in 0..<checkRadioList.count{
//                                                                    
//                                                                    var array_AtId = self.checkRadioList[i].attribute?.id
//                                                                    if(select_AtId == array_AtId)
//                                                                    {
//                                                                        self.checkRadioList.remove(at: i)
//                                                                        self.checkRadioList.append(productType.slugDict[value]?[v] as Any as! Variations)
//                                                                        //self.showimg = true
//                                                                        self.extra = 0
//                                                                        break
//                                                                    }
//                                                                    self.extra += 1
//                                                                    // agr yaha not equal wali cond likhi wo usme jakr kam kerdega or loop nh chelega secnd time agr chal gya tu double entry kredega
//                                                                }
//                                                                
//                                                            }
//                                                            
//                                                            
//                                                            if (self.extra != 0){
//                                                                self.checkRadioList.append(productType.slugDict[value]?[v] as Any as! Variations)
//                                                                // self.showimg = true
//                                                                
//                                                            }
//                                                            
//                                                            
//                                                        }
//                                                        
//                                                        
//                                                        print(checkRadioList)
//                                                        // let list_id =               self.checkRadioList[0]
//                                                        var b = ""
//                                                        
//                                                        //                                    for indx in 0..<checkRadioList.count
//                                                        //                                           {
//                                                        //                                        if ((self.checkRadioList[indx].attribute?.id) == select_AtId)
//                                                        //                                        {
//                                                        //                    self.radiocheck1.toggle()
//                                                        //                                        }
//                                                        //                                           }
//                                                        
//                                                        
//                                                        
//                                                    }
//                                                label:{
//                                                    
//                                                    
//                                                    if (self.checkRadioList.isEmpty){
//                                                        
//                                                        Image(systemName: "circle")
//                                                            .foregroundColor(Color.black)
//                                                        
//                                                    }
//                                                    else if(self.checkRadioList != nil){
//                                                      
//                                                        ForEach(0..<checkRadioList.count,id:\.self)
//                                                        { indx in
//                                                            if (self.checkRadioList[indx].id == (productType.slugDict[value]?[v].id ?? ""))
//
//                                                            {
//                                                                Image(systemName:  "circle.circle")
//                                                                
//                                                                    .foregroundColor(Color.yellow)
//                                                                    .onAppear{
//                                                                        self.bol = true
//                                                                    }
//                                                                
//                                                                
//                                                            }
//                                                            else
//                                                            {
////                                                                Text("")
////                                                                    .hidden()
////                                                                    .onAppear{
////                                                                        self.bol = true
////                                                                    }
//                                                            }
//                                                            
//                                                            
//                                                            
//                                                            
//                                                            
//                                                        }
//                                                        
//                                                        if (self.bol) {
//                                                            
//                                                            Image(systemName: "circle")
//                                                            
//                                                                .foregroundColor(Color.orange)
//                                                        }
//                                                      
//                                                        
////                                                        if   v < self.checkRadioList.count{
////                                                            if (self.checkRadioList[v].id == (productType.slugDict[value]?[v].id ?? ""))
////
////                                                            {
////                                                                Image(systemName:  "circle.circle")
////
////                                                                    .foregroundColor(Color.yellow)
////
////                                                            }
////                                                            else
////                                                            {
////                                                                Image(systemName:  "circle")
////
////                                                                    .foregroundColor(Color.yellow)
////
////                                                            }
////
////                                                        }
//                                                        
//                                                        
//                                                        
//                                                        
//                                                    }
//                                                    
//                                                    
//                                                    
//                                                    
//                                                }
//                                                    
//                                                    Text("\(String(describing: productType.slugDict[value]?[v].value ?? "")) ")
//                                                }
//                                                
//                                            }
//                                            
//                                            
//                                            
//                                            
//                                        }
//                                        Button{
//                                            print(self.checkRadioList)
//                                            
//                                        }label:{
//                                            Text("check radio list")
//                                        }
//                                        /// BEOFRE IMPEL
//                                        //                                                ForEach(enumerating: productType.attRadio.keys.sorted(), id: \.self){
//                                        //                                                    keyInd, Keyvalue in
//                                        //                                                HStack{
//                                        //                                                    Text("\(Keyvalue)" as String)
//                                        //                                                        .padding(.leading,10)
//                                        //                                                    Spacer()
//                                        //                                                    Text("Required")
//                                        //                                                        .padding(.trailing,10)
//                                        //                                                        .foregroundColor(Color.orange)
//                                        //                                                }
//                                        //
//                                        //                                                  //  self.radiobutton.append(a = true)
//                                        //                                                    ForEach(0..<productType.attRadio.keys.count,id: \.self)
//                                        //                                                    {
//                                        //                                                        indx   in
//                                        //
//                                        //
//                                        //
//                                        //
//                                        //                                                VStack(spacing:5){
//                                        //
//                                        //                                                    HStack(spacing:5){
//                                        //
//                                        //                                                        Button{
//                                        //                                                          //  self.radiocheck1.toggle()
//                                        //                                                        }
//                                        //                                                    label:{
//                                        //
//                                        //
//                                        //                                                        Image(systemName: self.radiocheck1 ? "circle.circle" : "circle")
//                                        //                                                            .foregroundColor(Color.black)
//                                        //                                                    }
//                                        //
//                                        //
//                                        //                                    Text(productType.attRadio[Keyvalue]?[indx] ?? "Capricon")
//                                        ////                                                        Text(variation.value ?? "Capticon")
//                                        //                                                    }
//                                        ////                                                    HStack(spacing:5){
//                                        ////
//                                        ////                                                        Button{
//                                        ////                                                            self.radiocheck2.toggle()
//                                        ////                                                        }
//                                        ////                                                    label:{
//                                        ////
//                                        ////
//                                        ////                                                        Image(systemName: self.radiocheck2 ? "circle.circle" : "circle")
//                                        ////                                                            .foregroundColor(Color.black)
//                                        ////                                                    }
//                                        ////
//                                        ////
//                                        ////
//                                        ////                                                        Text("Capticon")
//                                        ////                                                    }
//                                        ////                                                    HStack(spacing:5){
//                                        ////
//                                        ////                                                        Button{
//                                        ////                                                            self.radiocheck3.toggle()
//                                        ////                                                        }
//                                        ////                                                    label:{
//                                        ////
//                                        ////
//                                        ////                                                        Image(systemName: self.radiocheck3 ? "circle.circle" : "circle")
//                                        ////                                                            .foregroundColor(Color.black)
//                                        ////                                                    }
//                                        ////
//                                        ////
//                                        ////
//                                        ////                                                        Text("Capticon")
//                                        ////                                                    }
//                                        //
//                                        //                                                }
//                                        //                                                .padding(.leading,10)
//                                        //                                                    }
//                                        //
//                                        //                                            }.padding(.leading,10)
//                                        
//                                        
//                                        ////BEFORE NEW IMP
//                                        //                                            VStack(alignment:.leading,spacing:10){
//                                        //
//                                        //
//                                        //
//                                        //                                                HStack{
//                                        //                                                    Text("Select Size")
//                                        //                                                        .padding(.leading,10)
//                                        //                                                    Spacer()
//                                        //                                                    Text("Required")
//                                        //                                                        .padding(.trailing,10)
//                                        //                                                }
//                                        //
//                                        //                                                VStack(spacing:5){
//                                        //
//                                        //                                                    HStack(spacing:5){
//                                        //
//                                        //                                                        Button{
//                                        //                                                            self.radiocheck1.toggle()
//                                        //                                                        }
//                                        //                                                    label:{
//                                        //
//                                        //
//                                        //                                                        Image(systemName: self.radiocheck1 ? "circle.circle" : "circle")
//                                        //                                                            .foregroundColor(Color.black)
//                                        //                                                    }
//                                        //
//                                        //
//                                        //
//                                        //                                                        Text("Capticon")
//                                        //                                                    }
//                                        //                                                    HStack(spacing:5){
//                                        //
//                                        //                                                        Button{
//                                        //                                                            self.radiocheck2.toggle()
//                                        //                                                        }
//                                        //                                                    label:{
//                                        //
//                                        //
//                                        //                                                        Image(systemName: self.radiocheck2 ? "circle.circle" : "circle")
//                                        //                                                            .foregroundColor(Color.black)
//                                        //                                                    }
//                                        //
//                                        //
//                                        //
//                                        //                                                        Text("Capticon")
//                                        //                                                    }
//                                        //                                                    HStack(spacing:5){
//                                        //
//                                        //                                                        Button{
//                                        //                                                            self.radiocheck3.toggle()
//                                        //                                                        }
//                                        //                                                    label:{
//                                        //
//                                        //
//                                        //                                                        Image(systemName: self.radiocheck3 ? "circle.circle" : "circle")
//                                        //                                                            .foregroundColor(Color.black)
//                                        //                                                    }
//                                        //
//                                        //
//                                        //
//                                        //                                                        Text("Capticon")
//                                        //                                                    }
//                                        //
//                                        //                                                }
//                                        //                                                .padding(.leading,10)
//                                        //
//                                        //
//                                        //                                            }.padding(.leading,10)
//                                    }
//                                    //                                            VStack(alignment:.leading,spacing:10){
//                                    //
//                                    //                                                Text("Choose your cake")
//                                    //                                                    .foregroundColor(Color.black)
//                                    //                                                    .font(.system(size:25))
//                                    //                                                    .padding(.leading,8)
//                                    //                                                  //  .padding(.bottom,10)
//                                    //
//                                    //                                                HStack{
//                                    //                                                    Text("Select Flavour")
//                                    //                                                        .padding(.leading,10)
//                                    //                                                    Spacer()
//                                    //                                                    Text("Required")
//                                    //                                                        .padding(.trailing,10)
//                                    //                                                }
//                                    //
//                                    //                                                VStack(spacing:5){
//                                    //
//                                    //                                                    HStack(spacing:5){
//                                    //
//                                    //                                                        Button{
//                                    //                                                            self.radiocheck1.toggle()
//                                    //                                                        }
//                                    //                                                    label:{
//                                    //
//                                    //
//                                    //                                                        Image(systemName: self.radiocheck1 ? "circle.circle" : "circle")
//                                    //                                                            .foregroundColor(Color.black)
//                                    //                                                    }
//                                    //
//                                    //
//                                    //
//                                    //                                                        Text("Capticon")
//                                    //                                                    }
//                                    //                                                    HStack(spacing:5){
//                                    //
//                                    //                                                        Button{
//                                    //                                                            self.radiocheck2.toggle()
//                                    //                                                        }
//                                    //                                                    label:{
//                                    //
//                                    //
//                                    //                                                        Image(systemName: self.radiocheck2 ? "circle.circle" : "circle")
//                                    //                                                            .foregroundColor(Color.black)
//                                    //                                                    }
//                                    //
//                                    //
//                                    //
//                                    //                                                        Text("Capticon")
//                                    //                                                    }
//                                    //                                                    HStack(spacing:5){
//                                    //
//                                    //                                                        Button{
//                                    //                                                            self.radiocheck3.toggle()
//                                    //                                                        }
//                                    //                                                    label:{
//                                    //
//                                    //
//                                    //                                                        Image(systemName: self.radiocheck3 ? "circle.circle" : "circle")
//                                    //                                                            .foregroundColor(Color.black)
//                                    //                                                    }
//                                    //
//                                    //
//                                    //
//                                    //                                                        Text("Capticon")
//                                    //                                                    }
//                                    //
//                                    //                                                }
//                                    //                                             .padding(.leading,10)
//                                    //
//                                    //
//                                    //                                            }.padding(.leading,10)
//                                }
//                                
//                                
//                                HStack(spacing:5){
//                                    
//                                    Button{
//                                        self.inc-=1
//                                    }label:{
//                                        
//                                        Image(icon: .minus)
//                                            .foregroundColor(Color.white)
//                                    }
//                                    Text("\(self.inc)")
//                                    Button{
//                                        self.inc+=1
//                                    }label:{
//                                        
//                                        Image(icon: .minus)
//                                            .foregroundColor(Color(hex: 0xFA6109))
//                                        
//                                    }
//                                    Button{
//                                        self.pushtoCartView.toggle()
//                                        
//                                    }label:{
//                                        Text("Add to Cart")
//                                        // 200 for 8
//                                            .frame(maxWidth: 230)
//                                            .filledButton()
//                                            .padding(.horizontal, 7.5)
//                                        
//                                    }
//                                }
//                                // for 8
//                                .padding(.leading,10)
//                                .padding(.top, 20)
//                            }
//                            // for 8 ans se2nd 320
//                            .padding(.bottom,420)
//                            // .padding(.bottom,420)
//                            .frame(width:reader.size.width * 0.86,height: reader.size.height)
//                            
//                            //.padding(.vertical,reader.size.height * (-0.4))
//                            .background(Color.gray)
//                            
//                        }
//                        
//                        
//                        
//                        
//                        
//                    }
//                    //                               .padding(.bottom,350)
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                //.ignoresSafeArea(.keyboard)
//                .background(Color(hexadecimal6: 0xF5F5F5))
//                
//                .toolbar {
//                    
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
//                                //                                if (navbarhome == true)
//                                //                                {
//                                //                                    self.width = 50
//                                //                                    self.height = 50
//                                //                                }
//                                //                                else{
//                                //
//                                //                                    self.width = 50
//                                //                                    self.height = 50
//                                //                                }
//                                //
//                                
//                            }label: {
//                                VStack{
//                                    Image(icon: .home_g)
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//                                    
//                                    Text("Home")
//                                        .opacity(self.navbarhome ? 1 : 0)
//                                    //   .hidden(navbarhome)
//                                }
//                                
//                                .foregroundColor(self.navbarhome ?  Color(hex: 0xFA6109) : .gray)
//                                //                               .framenavbar(width:  self.width , height:  self.height)
//                                .frame(width: 65, height:  65)
//                                
//                                .background(self.navbarhome ? Color(hex:0xffefe6) : .white)
//                                
//                                .cornerRadius(25)
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
//                                    .cornerRadius(25)
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
//                                .cornerRadius(25)
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
//                                    .cornerRadius(25)
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
//                        //    .frame(width:4400,height:00)
//                        .background(Color.white)
//                        .padding(.top,0)
//                        .padding(.bottom,0)
//                        
//                    }
//                    
//                    
//                    
//                }
//                
//            }
//            
//            .background(Color(hexadecimal6: 0xF5F5F5))
//            .edgesIgnoringSafeArea(.all)
//            .onAppear{
//                
//                Task
//                {
//                    await
//                    
//                    productType.products(slug: "blush-on-facial-care---ny")
//                    
//                }
//            }
//        }
//    }
//}
//
//struct Store_Product_Detail_1_Previews: PreviewProvider {
//    static var previews: some View {
//        Store_Product_Detail_1()
//    }
//}
