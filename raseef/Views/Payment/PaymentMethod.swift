//
//  PaymentMethod.swift
//  raseef
//
//  Created by Teamx tec on 17/11/2022.
//

import SwiftUI

struct PaymentMethod: View {

    ////////// Payment variable
//    @State var Mastercard_Check = false
   // @State var Paypal_Check = false
  //  @State var Applepay_Check = false
    @State var Cashonarrival_Check = false
    ////
    @State var pushToCardListView = false
    @State var pushToCreateOrder_p_View = false
    @State var pushToCreateOrder_Ap_View = false
    @State var pushToCreateOrder_C_View = false

    
    // userdefault
    // 1-->card listView
    //2-->paypal
    //3-->Ap
    //4--> cash
    @State var cases = 0
    @State var yearinString = ""
    var body: some View {
        NavigationView{
            GeometryReader{ geo in
                ZStack{
                    NavigationLink("", destination: PaymentCardList()
                        .navigationBarHidden(true)
                                   , isActive: $pushToCardListView)
           
                    VStack(spacing:0){
                        VStack{
                            Image(icon: .navbar)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                                .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                .ignoresSafeArea()
                                .overlay(
                                    HStack(spacing:0){
                                        
                                       
                                        Button{}label:{
                                            Image(icon: .leftArrow)
                                                .resizable()
                                                .frame(width: 15, height: 20)
                                        }
                                        
                                        
                                        Spacer()
                                        Text("PAYMENT METHODS")
                                            .font(.system(size: 22,weight: .bold))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                        Text("MESSAGE")
                                            .hidden()
                                        
                                        
                                    }
                                        .foregroundColor(Color.white)
                                        .frame(width: 420,alignment: .leading)
                                        .padding(.leading,90)
                                        .padding(.vertical,-30)
                                        .onAppear{
                                            
                                            
                                            
                                            
                                        }
                                    
                                )
                        }
                        
                        
                        ScrollView{
                            // LazyVStack{
                            VStack(alignment: .leading,spacing:20){
                                
                                
                                
                                
                                HStack(spacing:20){
                                    
                                    Button{
                                        
                        
                                  
                   self.pushToCardListView = true
                                            

                                        
               self.pushToCreateOrder_p_View = false
               self.pushToCreateOrder_Ap_View = false
               self.pushToCreateOrder_C_View = false
                                    }
                                label:{
                                    
                                    
                    Image(systemName: self.pushToCardListView ? "circle.circle" : "circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.orange)
                                }
                                    
                                    
                                    Image(icon: .apple_logo)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    
                                 
                                        Text("Credit Cards")
                                        .font(.system(size: 25))
                                    Spacer()

                       
                                }
                              
                                
                                Divider()
//                                HStack(spacing:20){
//                                    
//                                    Button{
//                    self.pushToCardListView = false
//                    self.pushToCreateOrder_p_View = true
//                      
//              self.cases = 2
//             UserDefaults.standard.set(self.cases ,forKey: "cases")
//                 //  UserDefaults.standard.set( self.pushToCreateOrder_p_View ,forKey: "pushToCreateOrder_p_View")
//                                            
////
////                       UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_Ap_View")
////                      UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_C_View")
////                      UserDefaults.standard.removeObject(forKey: "pushToCheckout_cardlist_View")
//                                        
//                 self.pushToCreateOrder_Ap_View = false
//                 self.pushToCreateOrder_C_View = false
//                                    }
//                                label:{
//                                    
//                                    
//                                    Image(systemName: self.pushToCreateOrder_p_View ? "circle.circle" : "circle")
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(Color.orange)
//                                    
//                                }
//                                    
//                                    
//                                    Image(icon: .apple_logo)
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                    
//                                    
//                                
//                                        Text("Paypal")
//                                        .font(.system(size: 25))
//
//                                }
//                            
//                                
//                                Divider()
//                                
//                                HStack(spacing:20){
//                                    
//                                    Button{
//                self.pushToCardListView = false
//                self.pushToCreateOrder_p_View = false
//              
//                self.pushToCreateOrder_C_View = false
//                                 
//                self.pushToCreateOrder_Ap_View = true
//                                        //
//                                        self.cases = 3
//                        UserDefaults.standard.set(self.cases ,forKey: "cases")
////             UserDefaults.standard.set( self.pushToCreateOrder_Ap_View , forKey: "pushToCreateOrder_Ap_View")
//                                            
////                            UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_p_View")
////                            UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_C_View")
////                             UserDefaults.standard.removeObject(forKey: "pushToCheckout_cardlist_View")
//                                        
//                                    }
//                                label:{
//                                    
//                                    
//                                    Image(systemName: self.pushToCreateOrder_Ap_View ? "circle.circle" : "circle")
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(Color.orange)
//                                    
//                                }
//                                    
//                                    
//                                    Image(icon: .apple_logo)
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                    
//                                    
//                                 
//                                        Text("Apple Pay")
//                                        .font(.system(size: 25))
//                                        
//                                   
//                                }
//                           
//                                
//                                Divider()
//                                
//                                HStack(spacing:20){
//                                    
//                                    Button{
//               
//                self.pushToCardListView = false
//                self.pushToCreateOrder_p_View = false
//                self.pushToCreateOrder_Ap_View = false
//               
//                                     
//               self.pushToCreateOrder_C_View = true
//               // UserDefaults.standard.set( self.pushToCreateOrder_C_View , forKey: "pushToCreateOrder_C_View")
//                     self.cases = 4
//                        UserDefaults.standard.set(self.cases ,forKey: "cases")
////                                                 UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_p_View")
////                               UserDefaults.standard.removeObject(forKey: "pushToCreateOrder_Ap_View")
////                                             UserDefaults.standard.removeObject(forKey: "pushToCheckout_cardlist_View")
//                                        
//                                    }
//                                label:{
//                                    
//                                    
//                                    Image(systemName: self.pushToCreateOrder_C_View ? "circle.circle" : "circle")
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(Color.orange)
//                                    
//                                }
//                                    
//                                    
//                                    Image(icon: .apple_logo)
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                    
//                                    
//                                 
//                                        Text("Cash Flow")
//                                        .font(.system(size: 25))
//                                        
//                                   
//                                }
//                           
//                                
//                                Divider()
                            }
                            
                            .padding(.horizontal,40)
                            
                            
                        }
                        //   }
                        
                        
                        
                        
                    }
                }
            }
        }
    }
}

struct PaymentMethod_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethod()
    }
}
