//
//  OrderMsg.swift
//  raseef
//
//  Created by Teamx tec on 14/11/2022.
//

import SwiftUI

struct OrderMsg: View {
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
              //  NavigationLink("",destination: LoginView()
              //      .navigationBarHidden(true)
              //                 ,isActive: $pushtoLoginView)
                GeometryReader { reader in
                    Image(icon: .navbar)
                        .resizable()
                    
                        .frame(width: reader.size.width * 1,height: reader.size.height * 0.13, alignment: .top)
                        .ignoresSafeArea()
                        
                    
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                           // self.pushtoLoginView = true
                        }label:{
                            Image(icon: .leftArrow)
                                .font(.largeTitle.bold())
                                .foregroundColor(Color.white)
                        }
                        .padding(.top,10)
                    
                        
                    }
                }
                
                GeometryReader{geo in
                    
                    VStack(alignment:.center, spacing:12){
                  
                        Image(icon: .checkmark)
                                .resizable()
                                .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.3,alignment: .center)
                        
                        
                        
                        Text("Order # 124253xC")
                            .smallText()
                        Text("Your Order is placed\nSuccessfully")
                         .multilineTextAlignment(.center)
                         .font(.custom(opensans: .italic1, style: .title1))
                         .foregroundColor(Color.black)
                           
                              
                               
                      
                        
                        
                      
                
                    
                     Button {
                    
                        // self.showModal = true
                    
                    
             } label: {
                    
          Text("Pick Up Location")
                    
                 
             .frame(maxWidth: 300)
              .filledButton()
           
                     
             }.padding(.top,20)
                            
                        
                        
                        
                    }
                  
                   .padding(.top,geo.size.height * 0.16)
                   .padding(.horizontal,geo.size.width * 0.125) 
                 
                       
                       
                       
                       
                
                        
                        
                    
                    
                }
                
                
            }
            .onAppear{
                
               // self.showModal = false
            }
            
            
            
        }
    }
}

struct OrderMsg_Previews: PreviewProvider {
    static var previews: some View {
        OrderMsg()
    }
}
