//
//  Language.swift
//  raseef
//
//  Created by Teamx tec on 20/11/2022.
//

import SwiftUI

struct Language: View  {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
     @State var ar_lan = true
     @State var en_lan = false
    var body: some View {
    

        NavigationView {
            ScrollView{
                ZStack(alignment: .top) {
                    Color.white
                    
                    
                    VStack(alignment:.leading,spacing: 30){
                        
                        HStack(spacing:30){
                            Button{
                                if(self.ar_lan == true)
                                {
                                    print("No action Needed")
                                    
                                }
                                else{
                                    self.ar_lan.toggle()
                                    
                                    self.en_lan = false
                                }
                                
                            }label:{
                                Image(systemName: self.ar_lan ? "circle.circle" :"circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            
                            HStack(spacing:10){
                                Image(icon: .UAE)
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                Text("Arabic")
                                    .font(.system(size: 16),weight: .medium)
                            }
                        Spacer()
                        }
                    
                        HStack(spacing:30){
                            Button{
                                
                                self.ar_lan = false
                                self.en_lan = true
                            }label:{
                                Image(systemName: self.en_lan ? "circle.circle" : "circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            HStack(spacing:10){
                                Image(icon: .US)
                                    .resizable()
                                    .frame(width: 40, height: 30)
                                Text("English")
                                    .font(.system(size: 16),weight: .medium)
                            }
                            Spacer()
                        }
                      
                    }
                    
                 
                    .padding(.horizontal,30)
                    .padding(.top, 20)
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
                                            Text("Language")
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
            }
           
             
        
        }
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language()
    }
}
