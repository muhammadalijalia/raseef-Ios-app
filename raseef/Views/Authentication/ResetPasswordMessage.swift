//
//  ResetPasswordMessage.swift
//  raseef
//
//  Created by Teamx tec on 19/10/2022.
//

import SwiftUI

struct ResetPasswordMessage: View {
    @State var pushtoLoginView = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
                NavigationLink("",destination: LoginView()
                    .navigationBarHidden(true)
                               ,isActive: $pushtoLoginView)
                GeometryReader { reader in
                    Image(icon: .navbar)
                        .resizable()
                    
                        .frame(width: reader.size.width * 1,height: reader.size.height * 0.13, alignment: .top)
                        .ignoresSafeArea()
                        
                    
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            self.pushtoLoginView = true
                        }label:{
                            Image(icon: .leftArrow)
                                .font(.largeTitle.bold())
                                .foregroundColor(Color.white)
                        }.padding(.bottom,10)
                    
                        
                    }
                }
                
                GeometryReader{geo in
                    
                    VStack(alignment:.center, spacing:12){
                  
                            Image(icon: .checkmark)
                                .resizable()
                                .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.3,alignment: .center)
                        
                        
                        
                        
                      
                            
                            Text("\tYour Password has\n been reset successfully")
                                .font(.custom(opensans: .italic1, style: .title1))
                                .foregroundColor(Color.black)
                   
                      
                        
                        
                        Text("Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Phasellus vel turpis nisi.\n\tNullam ut consequat quam")
                            .smallText()
                            .padding(.leading,15)
                        
                        
                     Button {
                    
         
                    
             } label: {
                    
          Text("Login")
                   // .frame(maxWidth: .infinity)
             .frame(width: 320)
              .filledButton()
             .padding(.leading,10)
                     
                     
             }.padding(.top,20)
                    
                        
                        
                    }
                   .padding(.top,geo.size.height * 0.16)
                   .padding(.horizontal,geo.size.width * 0.08)
                 
                       
                       
                       
                       
                
                        
                        
                    
                    
                }
                
                
            }
            
        }
        
        
    }
}

struct ResetPasswordMessage_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordMessage()
    }
}
