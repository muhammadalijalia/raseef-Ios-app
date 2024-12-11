//
//  PaymentMethodCard.swift
//  raseef
//
//  Created by Teamx tec on 17/11/2022.
//

import SwiftUI
import Combine

struct AddPaymentMethodCard: View {
   
    
    @State var showsDatePicker = false
    @State var dates = ""
    @ObservedObject var payment_vm = PaymentViewModel()
    
  
    //
    @State var Exp_m :String = ""
    @State var Exp_y :String = ""
    @State var Exp_m_y :String = ""
    @State var Holder_name : String = ""
    @State var CVC : String = ""
    @State var type : String = "card"
    @State var Cardnum : String = ""
    
   
    func limitText(_ stringvar: inout String, _ limit: Int) {
        if (stringvar.count > limit) {
            stringvar = String(stringvar.prefix(limit))
        }
    }
    var body: some View{
        GeometryReader{geo in
            NavigationView{
                ZStack(alignment:.top) {
                    Color.clear
                    Image(icon: .navbar)
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height * 0.14)
                        .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                      
                        .ignoresSafeArea(edges:.top)
                    
                    
                      //or  .edgesIgnoringSafeArea(.all)
                    //or alignment top
                    //                       .position(x: geo.size.width / 2, y: geo.size.height * 0)
                     
                            HStack(spacing:0){
                                
                                
                           Spacer()
                              
                               
                           
                                Text("PAYMENT METHODS CARD")
                                    .font(.title2)
                             
                                    .foregroundColor(Color.white)

                                Spacer()
                                
                                
                            }
                            .foregroundColor(Color.white)
                       
                          
                         .padding(.vertical,geo.size.height * 0.032)
                        
                        
                      
                    
                        
                          
                   
                         VStack{
                    NavigationLink("", destination: PaymentCardList()
                        .navigationBarHidden(true)
                                   , isActive: $payment_vm.pushToPaymentCardList)
                              VStack{
                                  VStack(alignment: .leading){
                                                                 Image(icon: .ccCard)
                                                                     .resizable()
                                                                     //.scaledToFit()
                                                             }
                                                .frame(width: geo.size.width * 0.85, height:geo.size.height * 0.35)
                                 
                                                             VStack(alignment: .leading,spacing:10){
                                                                 Section(header:Text("Name on Card"))
                                                                 {
                            TextField("Hayden",text: $Holder_name)
                                         .frame(width: geo.size.width * 0.75)
                                                                         .modifier(FieldsModifier())
                                 
                                                                 }
                                                                 ///////////
                                                                 Section(header:Text("Card Number"))
                                                                 {
                                                                     TextField("Number",text: $Cardnum)
                                                          .onReceive(Just(Cardnum)) { _ in limitText(&Cardnum, 16) }
                                                                         .frame(width: geo.size.width * 0.75)                           .modifier(FieldsModifier())
                                 
                                 
                                                                 }
                                                                 ////////
                                                                 HStack(spacing:35){
                                                                     VStack(alignment:.leading){
                                                                         Section(header:Text("Expiray Date")){
                                 
                                 
                                                                             TextField("Month/Year",text: $Exp_m_y)
                                                                                 
                                                                                 
                                 
                                                                                 .padding(10)                   .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                                                                                 .frame(width: geo.size.width * 0.5)
                                 
                                 
                                 
                                                                         }
                                                                     }
                                                                     //Spacer()
                                                                     VStack(alignment:.leading){
                                                                         Section(header:Text("CVC")){
                                 
                                 
                                                                             TextField("",text: $CVC)
                                                                                 .onReceive(Just(CVC)) { _ in limitText(&CVC, 3) }
                                                                                 .padding(10)                   .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                                                                                 .frame(width: geo.size.width * 0.22)
                                 
                                 
                                 
                                                                         }
                                                                     }
                                                                 }
                                                                 
                                                                 VStack{
                                 
                                                                     Button{

                                                                         if self.Exp_m_y.contains("/")
                                                                         {
                                                                             var str = self.Exp_m_y
                                                                             let indexcut = str.firstIndex(of: "/")
                                        
                                                                             
                                                                             self.Exp_m =  String(str[..<indexcut!]);                             print(self.Exp_m)
                                            
                                                                             let year = String(str[indexcut!...])
                                                                             
                                                                             print(year)
                                                                             
                                                                             self.Exp_y = year.replacingOccurrences(of: "/", with: "");                     print(self.Exp_y)                          }
                                                                         else if self.Exp_m_y.contains("-")
                                                                         {
                                                                             var str = self.Exp_m_y
                                                                             let indexcut = str.firstIndex(of: "-")
                                        
                                                                             
                                                                             self.Exp_m =  String(str[..<indexcut!]);                             print(self.Exp_m)
                                            
                                                                             let year = String(str[indexcut!...])
                                                                             
                                                                             print(year)
                                                                             
                                                                             self.Exp_y = year.replacingOccurrences(of: "/", with: "");                     print(self.Exp_y)                          }
                                                                         let postString :[String: String] = ["type": self.type,"card[number]":self.Cardnum,"card[exp_month]":self.Exp_m,"card[exp_year]":self.Exp_y,"card[cvc]":self.CVC]
                                                                    // print(postString)
                                                                         Task{
                                                                             await
                                                                             self.payment_vm.getStripeId(parameterString: postString)                         }
                                        
                                                                     }
                                                                 label:{
                                                                     Text("Save")
                                                                         .frame(maxWidth:300)
                                                                         .filledButton()
                                                                         
                                 
                                                                 }
                                                                 }
                                                                 .padding(.horizontal,30)
                                                                     .padding(.top,12)
                                                                                                         
                                                                 //          .padding(.top,15)
                                                             }
                                 
                                      
                                 
                                 
                                                         }
                             
                                     
                                 
                              }
                    
                         .padding(.top,geo.size.height * 0.1)
                   .padding(.horizontal,30)
                    
                }
                
                
                
            }
        }
    
    }
}
               
               
                
//                .toolbar {
//                    ToolbarItem(placement: .automatic) {
//                        ZStack(alignment:.top){
//                            Color.clear
////                                Image(icon: .navbar)
////                                    .resizable()
////                                    .frame(width: geo.size.width , height: geo.size.height * 0.14)
////                                    .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
////                                    .overlay(
////                                    Text("AAA")
////                                        .padding(.top,60)
////                                    )
//
//
//
//
//                            }
//
//                        }
//                    }
//                .navigationBarItems(leading:
//
//                                            HStack {
//                                                Button(action: {
//                                                }) {
//                                                    Image(systemName: "arrow.left")
//                                                }.foregroundColor(Color.orange)
//                    Image(icon: .navbar)
//                                                    .resizable()
//                                                    .foregroundColor(.white)
//                                                    .aspectRatio(contentMode: .fit)
//                                                    .frame(width: 60, height: 40, alignment: .center)
//                                                .padding(UIScreen.main.bounds.size.width/4+30)
//                                            }
//                                            ,trailing:
//
//                                            HStack {
//
//                                                Button(action: {
//                                                }) {
//                                                    Image(systemName: "magnifyingglass")
//                                                    }.foregroundColor(Color.orange)
//                                            }
//                                    )
          //  }
//            .navigationBarTitle(
//                Text("")
//                , displayMode: .inline)
//
        //}
    
   // }
//   // var body: some View {
//
//            NavigationView{
//                GeometryReader{ geo in
//
//                    VStack(alignment:.leading,spacing:0){
//                            ZStack{
//                                Image(icon: .navbar)
//                                    .resizable()
//                                    .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.15)
//                                    .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
//                                    .ignoresSafeArea()
//                                    .overlay(
//                                        HStack(spacing:0){
//
//                                            Button{}label:{
//                                                Image(icon: .leftArrow)
//                                                    .resizable()
//                                                    .frame(width: 15, height: 20)
//                                            }
//
//
//                                            Spacer()
//                                            Text("PAYMENT METHODS")
//                                                .font(.system(size: 22,weight: .bold))
//                                                .foregroundColor(Color.white)
//                                            Spacer()
//                                            Text("MESSAGE")
//                                                .hidden()
//
//
//                                        }
//                                            .foregroundColor(Color.white)
//                                            .frame(width: 420,alignment: .leading)
//                                            .padding(.leading,90)
//                                           .padding(.vertical,-30)
//
//                                    )
//                            }
//
//                        VStack{
//                            VStack{
//                                Image(icon: .ccCard)
//                                    .resizable()
//                                    .frame(width: geo.size.width * 0.85, height:geo.size.height * 0.4)
//                            }
//
//                            VStack(alignment: .leading,spacing:10){
//                                Section(header:Text("Name on Card"))
//                                {
//                                    TextField("Dasdasd",text: $name)
//
//                                        .modifier(FieldsModifier())
//
//                                }
//                                ///////////
//                                Section(header:Text("Card Number"))
//                                {
//                                    TextField("Dasdasd",text: $name)
//                                        .modifier(FieldsModifier())
//
//
//                                }
//                                ////////
//                                HStack(spacing:20){
//                                    VStack(alignment:.leading){
//                                        Section(header:Text("Expiray Date")){
//
//
//                                            TextField("Date/Month/Year",text: $dates)
//
//                                                .padding(10)                   .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
//                                                .frame(width: 200)
//
//
//
//                                        }
//                                    }
//                                    VStack(alignment:.leading){
//                                        Section(header:Text("CVC")){
//
//
//                                            TextField("",text: $CVC)
//
//                                                .padding(10)                   .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
//                                                .frame(width: 135)
//
//
//
//                                        }
//                                    }
//                                }
//
//                                VStack{
//
//                                    Button{}
//                                label:{
//                                    Text("Save")
//                                        .frame(maxWidth:300)
//                                        .filledButton()
//
//                                }
//                                }
//                                //                                        .padding(.horizontal,30)
//                                //          .padding(.top,15)
//                            }
//
//                            .padding(.horizontal,0)
//
//
//                        }
//                        .padding(.horizontal,15)
//                        .padding(.vertical,-20)
//
//                        }
//
//
//
//            }
//
//        }
//
//    }
//}

struct AddPaymentMethodCard_Previews1 : PreviewProvider {
    static var previews: some View {
        AddPaymentMethodCard()
    }
}
