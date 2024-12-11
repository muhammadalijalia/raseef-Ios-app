//
//  PaymentCardList.swift
//  raseef
//
//  Created by Teamx tec on 23/12/2022.
//

import SwiftUI

struct PaymentCardList: View {
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    ////////// Payment variable
    @State var Mastercard_Check = false
    @State var Paypal_Check = false
    @State var Applepay_Check = false
    @State var Cashonarrival_Check = false
    //
    @State var radioCheck = false
    @State var pushToPaymentMethod = false
    @State var pushToAddPaymentMethod = false
    @State var pushToCheckout = false
    
    @State var pushToCheckout_cardlist_View = false
    @State var idAr = []
    @ObservedObject var PaymentVm = PaymentViewModel()
    
    @State var cases = 0
    //
    let name: String = ""
    let expires: String = ""
    let cardNo: String = ""

    @State var yearinString = ""
    
    func removeRows(at offsets: IndexSet) {
        self.PaymentVm.CC_data.remove(atOffsets: offsets)
    }
    var pushfromCheckout : Bool{
      let p =  UserDefaults.standard.bool(forKey: "pushfromCheckout")
        print(p)
        return p
    }
   @ViewBuilder var body: some View {
        NavigationView{
            GeometryReader{ geo in
                ZStack{
                    NavigationLink("", destination: PaymentMethod()
                        .navigationBarHidden(true)
                                   , isActive: $pushToPaymentMethod)
                    NavigationLink("", destination: AddPaymentMethodCard()
                        .navigationBarHidden(true)
                                   , isActive: $pushToAddPaymentMethod)
                    NavigationLink("", destination:  checkout(Total: .constant(6.5))
                        .navigationBarHidden(true)
                                   , isActive: $pushToCheckout)
                    VStack(spacing:0){
                        VStack{
                            Image(icon: .navbar)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
                                .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                                .ignoresSafeArea()
                                .overlay(
                                    HStack(spacing:0){
                                        if pushfromCheckout{
                                            
                                       
                                        }
                                        else{
                                            Button{
                                                
                                                self.pushToPaymentMethod = true
                                            }label:{
                                                Image(icon: .leftArrow)
                                                    .resizable()
                                                    .frame(width: 15, height: 20)
                                            }
                                        }
                                        
                                        Spacer()
                                        Text("SAVE PAYMENT METHODS")
                                            .font(.system(size: 20,weight: .bold))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                        Text("MESSAGE")
                                            .hidden()
                                        
                                        
                                    }
                                        .foregroundColor(Color.white)
                                        .frame(width: 420,alignment: .leading)
                                        .padding(.leading,90)
                                        .padding(.vertical,-30)
                                    
                                )
                        }
                        
                        
                     
                           // LazyVStack{
                                LazyVStack(spacing:30){
                            
                               
                     if PaymentVm.CC_data.isEmpty == false
                                    {
                                       
                                HStack{
                                    Spacer()
                         Text("List is Empty")
                                        .hidden()
                                    Spacer()
                                    Button{
                                        self.pushToAddPaymentMethod = true
                                    }label:{
                                        Image(systemName: "plus.app")
                               .resizable()
                        .frame(width: 25, height: 25)
                                    }

                                }
                         ScrollView{
                             ForEach(PaymentVm.CC_data,id:\.id)
                             {
                                 list in
                                 
                                 HStack{
                                     if pushfromCheckout{
                                         Button{
                                             // handle shared pref value
                                             UserDefaults.standard.removeObject(forKey: "pushfromCheckout")
                                             for i in 0..<self.PaymentVm.CC_data.count
                                             {
                                                 if (list.id == self.PaymentVm.CC_data[i].id)
                                                 {
                                                     self.PaymentVm.CC_data[i].ChkVariable = true
                                                     self.pushToCheckout = true
                                                     
                                                     self.cases = 1
                                                     UserDefaults.standard.set(self.cases, forKey: "cases")
                                                     
                                                     print(list.id ?? "No Stripe ID")
                                                     UserDefaults.standard.set(list.id, forKey: "stripe_id")
                                                 }
                                                 else{
                                                     self.PaymentVm.CC_data[i].ChkVariable = false
                                                     
                                                 }
                                                 print(self.PaymentVm.CC_data)
                                             }
                                         }label:{
                                             if list.ChkVariable == true{
                                                 Image(systemName: "circle.circle")
                                             }
                                             else{
                                                 Image(systemName: "circle")
                                             }
                                         }
                                         
                                     }
                                     else{
                                        
                                     }
                                     Button{
                                         
                                         
                                         
                                         
                                     }
                                 label:{
                                     VStack {
                                         
                                         HStack(alignment: .top) {
                                             Image(systemName: "checkmark.circle.fill")
                                                 .foregroundColor(Color.white)
                                             
                                             Spacer()
                                             
                                             Text(list.card?.brand  ?? "visa")
                                                 .foregroundColor(Color.white)
                                                 .font(.system(size: 20))
                                                 .fontWeight(.bold)
                                                 .textCase(.uppercase)
                                             
                                         }
                                         
                                         Spacer()
                                         HStack{
                                             Text("**** **** **** "+(list.card?.last4 ?? "1234"))
                                         }
                                         .foregroundColor(Color.white)
                                         .font(.system(size: 30))
                                         
                                         Spacer()
                                         
                                         HStack {
                                             
                                             VStack(alignment: .leading) {
                                                 Text("CARD HOLDER")
                                                     .font(.caption)
                                                     .fontWeight(.bold)
                                                     .foregroundColor(Color.gray)
                                                 
                                                 Text(list.billingDetails?.name ?? "Osama")
                                                     .font(.caption)
                                                     .fontWeight(.bold)
                                                     .foregroundColor(Color.white)
                                                 
                                             }
                                             
                                             Spacer()
                                             
                                             VStack {
                                                 Text("EXPIRES")
                                                     .font(.caption)
                                                     .fontWeight(.bold)
                                                     .foregroundColor(Color.gray)
                                                     .onAppear{
                                                         
                                                         let yi = String(list.card?.expYear ?? 12)
                                                         self.yearinString = String(yi.suffix(2))
                                                         print(yearinString)
                                                     }
                                                 HStack{
                                                     Text("\(list.card?.expMonth ?? 12)")
                                                     Text("/")
                                                     Text("\(yearinString)")
                                                 }
                                                 
                                                 .font(.caption)
                                                 .fontWeight(.bold)
                                                 .foregroundColor(Color.white)
                                             }
                                             
                                         }
                                         
                                         
                                         
                                     }
                                     .padding(.horizontal,15)
                                     .padding(.vertical,15)
                                     .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.25)
                                     
                                     //.padding()
                                     .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                     .cornerRadius(10)
                                 }
                                 }
                                
                                // if list.ChkVariable == true{
                                     HStack{
                                         Spacer()
                                         Button(action: {
                                             Task{
                                                 await
                                                 self.PaymentVm.DelCreditCard(selectID: list.id ?? "")
                                             }
                                            
                                         } ) {
                                             Label("Delete",systemImage: "trash")
                                         }
                                     }
                                 //}
                                 
                             }
                             
                         }
                                        
                                    }
                                    else{
                                      
                                    
                                        HStack{
                                            Spacer()
                                            Text("List is Empty")
                                                .font(.system(size:30,weight: .bold))
                                            Spacer()
                                           
                                               
                                                Button{
                                                    self.pushToAddPaymentMethod = true
                                                }label:{
                                                    Image(systemName: "plus.app")
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                }
                                                
                                            }
                                      
                                    }
                                       
                                    
                                    
          

                                  
                                    
                              
                                   
                                    
                                }
                                .padding(.top,0)
                                .padding(.bottom,0)
                                .padding(.horizontal,20)
                                
                                
                         
                     //   }
                        
                        
                        
                        
                    }
                    
                }
                .onAppear{
                    Task{
                        await PaymentVm.GetCreditCard()
                        
                    }
                  
                }
            }
        }
    }
}

struct PaymentCardList_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCardList()
    }
}
