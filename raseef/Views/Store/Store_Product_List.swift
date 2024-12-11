//
//  Store_Product_List.swift
//  raseef
//
//  Created by Teamx tec on 27/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct Store_Product_List: View {
   @StateObject var store_product_list = ProductListViewModel()
  
    @State var productType = ""
    @State var pushtoProductVariable = false
    @State var pushtoProductSimple = false
   // @ObservedObject var shop_by_slug_Vm = GetShopsBySlugViewModel()
 
    var body: some View {
        
        GeometryReader{ reader in
          
            VStack{
               
                HStack{
                    HStack(spacing:2){
                        Image(icon: .fire)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Popular")
                            .foregroundColor(Color.black)
                            .font(.system(size:25))
                    }

                    Spacer()

                    Button{}
                label:{
                    Text("View all")
                }



                }
                ScrollView(.vertical){
                   // Lazy
                    VStack{
                        ForEach(store_product_list.docs,id:\.id)
                        {product in
                            
                            Button{
                                self.productType = product.productType ?? "Nil"
                                UserDefaults.standard.removeObject(forKey: "product_slug")
                                UserDefaults.standard.set(product.slug, forKey: "product_slug")
                                if self.productType == "simple"
                                {
                                    UserDefaults.standard.removeObject(forKey: "pushtoProductSimple")
                                    self.pushtoProductSimple = true
                                    UserDefaults.standard.set(self.pushtoProductSimple, forKey: "pushtoProductSimple")
                                }
                                else if(self.productType == "variable"){
                                    UserDefaults.standard.removeObject(forKey: "pushtoProductSimple")
                                    self.pushtoProductVariable = true
                                }
                                else{
                                    print("NO value")
                                }
                               // self.pushtoProductVariable.toggle()
                            }label:{
                                HStack(spacing:0){
                                    
                                    VStack(alignment:.leading,spacing:10){
                                        Text(product.name ?? "nil")
                                            .basicText()
                                        Text(product.docDescription ?? "No")
                                                                                    .font(.system(size: 12))
                                                                                    .foregroundColor(.black)
                                                                                    .lineLimit(1)
                                        HStack{
                                     
                                Text("\(product.price ?? 0)")
                                            
                                            Text("AED")
                                                .font(.system(size:12))
                                        }
                                    }
                                    Spacer()
//                                    VStack{
//                                        WebImage(url: URL(string: product.image ?? "no"))
//                                            .resizable()
//                                            .placeholder {
//                                                   ProgressView()
//                                                }
//                                            .indicator(.activity)
//                                            .transition(.fade(duration: 0.5))
//                                            .scaledToFit()
//                                            .frame(width: 70, height: 70, alignment: .center)
//                                            .cornerRadius(15)
//
//                                    }
                                    
                                    VStack{
                                        AsyncImage(url: URL(string: product.image ?? "https://api.teamxmv.com/api/attachments/images/Ash-186c.png")) { image in
                                            image.resizable()
                                                .scaledToFit()
                                                                                          .frame(width: 70, height: 70, alignment: .center)
                                                                                            .cornerRadius(15)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    //.padding(.trailing,10)
                                    
                                    
                                }
                                .padding(.horizontal,10)
                                .background(Color.white)
                                
                                .shadow(color: Color(hex: 0xe7e7e7),radius:10,x:0,y:0)
                                .padding(.horizontal,reader.size.width * 0.02)
                            }
                            
                        }
                    }
                 }
                NavigationLink("",destination: Store_Product_Simple()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoProductSimple)
                NavigationLink("",destination: Store_Product_Variable()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoProductVariable)
//               ScrollView(.vertical){
//                    ForEach(0..<5)
//                    {i in
//
//                        Button{
//                            self.pushtoProductVariable.toggle()
//                        }label:{
//                            HStack(spacing:0){
//
//                                VStack(alignment: .leading, spacing:10){
//                                        Text("SUMMER DEAL 1")
//                                            .basicText()
//                                        Text("1 COFEE WITH CAKE")
//                                            .font(.system(size: 13))
//                                            .foregroundColor(.black)
//                                            .lineLimit(1)
//                                        HStack{
//                                            Text("55")
//                                            Text("AED")
//                                                .font(.system(size:12))
//                                        }
//                                     }
//                                    Spacer()
//                                    VStack{
//
//                                        Image(icon: .icecreamProdcut)
//                                            .resizable()
//                                            .frame(width:70,height:70)
//                                            .cornerRadius(15)
//
//                                    }
//
//
//                            }
//                            .padding(.horizontal,10)
//                            .background(Color.white)
//
//                           .shadow(color: Color(hex: 0xe7e7e7),radius:10,x:0,y:0)
//                            .padding(.horizontal,reader.size.width * 0.02)
//
//                        }
//
//                    }
//
//                }
               .onAppear{
                  
                 //  let shop_id_hard = "631701eabaf027ab6bd013f0"
//                   Task{
//                       await store_product_list.products(shop_id: shop_id_hard)
//                   }
                //   self.store_product_list.products2(shop_id: shop_id_hard)
             //      let shop_id = UserDefaults.standard.string(forKey: "StoreId") ?? "00"
                   Task{
                       //6347d5c5183e779053c0fbc6
                       let st_id = UserDefaults.standard.string(forKey: "StoreId") ?? "No store id in STPL"
                       print(st_id)
                       await
                       /// For product type simple
                    //   store_product_list.products(shop_id: "6347d5c5183e779053c0fbc6")
                       // for product type variable
                       store_product_list.products(shop_id:     "6318a59c6937e0d2e791d94a")
                   }
//                       Task{
//
//                         store_product_list.products2(shop_id: shop_id )
//
//                       }
                   
               }


            }
           
            .padding(.horizontal,25)
        }
       
      
    }
}

struct Store_Product_List_Previews: PreviewProvider {
    static var previews: some View {
        Store_Product_List()
            .environment(\.managedObjectContext, ProductListManager.shared.viewContext)
    }
}
