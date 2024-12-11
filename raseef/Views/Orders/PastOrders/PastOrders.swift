//
//  PastOrders.swift
//  raseef
//
//  Created by Teamx tec on 20/11/2022.
//

import SwiftUI

struct PastOrders: View  {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
     @State var ar_lan = true
     @State var en_lan = false
    @State var pushtoReviews = false
    @ObservedObject var c_orderVM = OrdersViewModel()
    @State private var path: [Dest] = []
    enum Dest: Hashable ,Codable{
       case AddReviews
       }
    var body: some View {
    

        NavigationStack(path: $path){
                 GeometryReader{ geo in
                     
                      
                          ScrollView{
                              LazyVStack(spacing:30){
                                  ForEach(c_orderVM.delieveredDict, id: \.id)
                                      { order in
                                      ZStack{
                                          RoundedRectangle(cornerRadius: 20)
                                              .stroke(Color.gray, lineWidth: 2)
                                          
                                              .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.42)
                                          
                                          VStack(alignment:.leading,spacing:8){
                                              HStack{
                                                  let orderId = order.id ;
                                                  let last4 = String(orderId?.suffix(5) ?? "")
                                                  
                                                  Text("Order # \(last4)")
                                                  Spacer()
                                                  
                                         
                                               
                                                      Text(order.status.name ?? "Order Processing")
                                                          .font(.system(size: 15,weight: .medium))
                                                          .padding(8)
                                                          .background(.blue)
                                                          .cornerRadius(15)
                                              
                                                  
                                                  
                                                  
                                              }
                                         
                                              ForEach(order.products, id: \.id)
                                              { op in
                                                  HStack(spacing:8) {
                                                     
                                  let url = op.productInfo.image
                                  var urlString = url?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                                      AsyncImage(url: URL(string: urlString ?? ""))
                                                      { phase in
                                                          if let image = phase.image {
                                                              image
                                                                  .resizable()
                                                                  .scaledToFit()
                                                              //   .scaledToFill()
                                                              
                                                          }
                                                          else if phase.error != nil {
                                                              Text("There was an error loading the image.")
                                                          }
                                                      }
                                                      .frame(width: 100, height: 100)
                                                      .cornerRadius(10)
                                                      
                                                      VStack(alignment:.leading,spacing: 6){
                                                          
                                                          Text(op.productInfo.name ?? "op.name")
                                                              .font(.system(size:15))
                                                          Text(op.productInfo.productIDDescription ?? "Laundry Basket")
                                                             
                                                                 
                                                              .font(.system(size: 13, weight: .medium, design: .default))
                                                              .frame(width:100)
                                                              .lineLimit(2)
                                                          
                                                          //
                                                          HStack(spacing:2){
                                  Text("\(op.subtotal ?? 55)")
                                                                  .font(.system(size: 14,weight: .bold))
                                                              Text("AED")
                                                                  .font(.system(size: 10,weight: .bold))
                                                                  .padding(.top,5)
                                                              
                                                              
                                                              Spacer()
                            //  Text("Qty:\(op.orderQuantity)")
                                                              Text("Qty:" + String(op.orderQuantity ?? 1))
                                                                  .font(.system(size: 14,weight: .regular))
                                                                  .foregroundColor(.darkGray)
                                                                  .padding(.trailing,10)
                                                              
                                                              
                                                          }
                                                          .foregroundColor(Color(hex:0xFA6109))
                                                      }
                                                      
                                                      
                                                  }
                                           
                                              }
                                           
                                           
                                              
                                            HStack{
                                                  Image(icon: .read_msg_check)
                                                      .resizable()
                                                      .frame(width: 15, height: 15)
                                                  Text("Picked Up")
                                                      .font(.system(size: 12,weight: .bold))
                                                      .foregroundColor(.green)
                                              }
                                              Text("Note: Seperate wash with hanger")
                                                  .font(.system(size: 13,weight: .regular))
                                                  .foregroundColor(.darkGray)
                                              
                                              //   HStack{
                                              Divider()
                                              //    }
                                              HStack{
                                                  
                                                  Text("Total")
                                                  Spacer()
                                                 // Text("AED 6.3")
                                                  Text("AED " + String(order.total ?? 6.3))
                                                  //  .padding(.trailing,10)
                                                  
                                              }.font(.system(size: 14,weight: .bold))
                                              
  Divider()
                                        HStack{
                                         Spacer()
                                            Button{
                                                self.pushtoReviews.toggle()
                                            }label:{
                                                
                                                Text("Add Review")
                                            }
                                            .foregroundColor(Color.orange)
                                            .font(.system(size: 18,weight: .bold))
                                            Spacer()
                                        }



//
                                          }
                                          .frame(width: geo.size.width * 0.83,height: geo.size.height * 0.35)
                                      }
                                  }
                              }
                          }
                                   
                          
                              
                            
                       
                          
                       
                        .padding(.horizontal,10)
                        // .padding(.top, 20)
                          .toolbar{
                              
                              ToolbarItem(placement: .principal)
                              {
                                 
                                  ZStack{
                                     
                                      Image(icon: .navbar)
                                          .resizable()
                                         
                                          .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                                          .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                          .ignoresSafeArea()
                                          .padding(.bottom, 30)
                                       
                                          .overlay(
                                              HStack{
                                                  
                                                  Image(icon: .leftArrow)
                                                  Spacer()
                                                  Text("PAST  ORDER")
                                                      .font(.system(size: 18))
                                                  Spacer()
                                              }
                                                  .foregroundColor(Color.white)
                                                  .padding(.horizontal,30)
                                                  .padding(.top, 20)
                                                     
                                                  
                                          )
                                  }
                              }
                              
                          }
                        // .ignoresSafeArea(.keyboard)
                         // .adaptsToKeyboard()
                     
                  }
                 .navigationDestination(for: Dest.self) { data in
                     switch data {
                     case .AddReviews:
                      CurrentOrders()
                             .navigationBarHidden(true)
}
                 }
                
                 .onAppear{
                     Task{
                         await
                         c_orderVM.Orders()
                     }
                    
                 }
                   
              
              }
    }
}

struct PastOrders_Previews: PreviewProvider {
    static var previews: some View {
        PastOrders()
    }
}
