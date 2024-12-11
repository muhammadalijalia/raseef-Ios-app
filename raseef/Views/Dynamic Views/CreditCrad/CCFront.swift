//
//  CCFront.swift
//  raseef
//
//  Created by Teamx tec on 23/12/2022.
//

import SwiftUI

struct CreditCardFronts: View {
    
    let name: String
    let expires: String
    let cardNo: String
    @ObservedObject var payment_vm = PaymentViewModel()
    @State var yearinString = ""
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ForEach(payment_vm.CC_data,id:\.id)
                {
                    list in
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
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.25)
                    
                    //.padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(10)
                }
            }
            .onAppear{
                Task{
                    await
                    self.payment_vm.GetCreditCard()
                }
              
            }
        }
//        ForEach(payment_vm.CC_data,id:\.id)
//        {
//            list in
//            VStack(alignment: .leading) {
//
//                HStack(alignment: .top) {
//                    Image(systemName: "checkmark.circle.fill")
//                        .foregroundColor(Color.white)
//
//                    Spacer()
//
//                    Text(list.card?.brand  ?? "visa")
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 24))
//                        .fontWeight(.bold)
//                        .textCase(.uppercase)
//
//                }
//
//                Spacer()
//                HStack{
//                    Text("**** **** **** "+(list.card?.last4 ?? "1234"))
//                }
//                    .foregroundColor(Color.white)
//                    .font(.system(size: 32))
//
//                Spacer()
//
//                HStack {
//
//                    VStack(alignment: .leading) {
//                        Text("CARD HOLDER")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.gray)
//
//                        Text(list.billingDetails?.name ?? "Osama")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//
//                    }
//
//                    Spacer()
//
//                    VStack {
//                        Text("EXPIRES")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.gray)
//                            .onAppear{
//
//                        let yi = String(list.card?.expYear ?? 12)
//                                self.yearinString = String(yi.suffix(2))
//                                print(yearinString)
//                            }
//                        HStack{
//                            Text("\(list.card?.expMonth ?? 12)")
//                            Text("/")
//                            Text("\(yearinString)")
//                        }
//
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//                    }
//
//                }
//
//
//
//            }.frame(width: 300, height: 200)
//            .padding()
//            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
//            .cornerRadius(10)
//        }
        
        
     
      
    }
}

struct CreditCardFront_Previews2: PreviewProvider {
    static var previews: some View {
        CreditCardFronts(name: "osama", expires: "", cardNo: "")
    }
}
