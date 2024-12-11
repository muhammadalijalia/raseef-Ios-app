//
//  Onboarding_3.swift
//  raseef
//
//  Created by Teamx tec on 12/10/2022.
//



import SwiftUI

import Combine
struct Onboarding_4: View {
 
    let screenSize = UIScreen.main.bounds;
  @State var pushtologinview = false
    
  
    var body: some View {
        ScrollView(showsIndicators: false)
        {
       ZStack{
         
           Image(icon: .New_Restauant)
                       .resizable()
                       .scaledToFill()
                       .edgesIgnoringSafeArea(.all)
                       .frame(width: screenSize.width,
                                      height: screenSize.height, alignment: .top)
                              
        
           VStack(spacing:0){
               VStack(spacing:20){
              
                   
                   Text("Order While you’re on the Way")
                       .font(.custom(helvitica: .bold, style: .largeTitle))
        
                   
                   Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et nibh feugiat, mattis augue vitae, efficitur nisi. Etiam ut lectus in ligula congue scelerisque in et ante. Aenean id turpis maximus purus faucibus volutpat vitae et nulla. Vivamus congue erat sit amet tortor luctus congue. Morbi eu massa vel metus dapibus vestibulum et ac enim. Nunc luctus id ligula ac varius. Donec tellus ante, tincidunt porttitor tempus quis, pharetra quis turpis. Phasellus semper dui aliquam, eleifend urna vitae, lacinia felis.")
                       .lineLimit(4)
                    //   .smallText()
                        
                   

                           
                           
                  
                 
                   
               }
               .foregroundColor(Color.white)
               .frame(width: screenSize.width * 0.8,
                      height: screenSize.height*0.25)
              
               
               
               VStack{
                 
                   Button{
                       self.pushtologinview.toggle()
                     
                       
                   }
               label:{
                       Text("Get Started")
                           .frame(maxWidth:300)
                           .filledButton()
                   }
               
             .fullScreenCover(isPresented: $pushtologinview, content:  LoginView.init)
                //   NavigationLink("",destination: LoginView(),isActive: $pushtologinview)
//   .fullScreenCover(isPresented: $pushtologinview, content:  LoginView.init)
               }
           } .padding(.top,250)
           
         
            
        
       }
        }.edgesIgnoringSafeArea(.all)
   
           
//            .onAppear{
//                self.pushtologinview.toggle()
//                UserDefaults.standard.set(self.pushtologinview, forKey: "pushtologinview")
//
//            }
       
    }
}

struct Onboarding_4_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_4()
    }
}
