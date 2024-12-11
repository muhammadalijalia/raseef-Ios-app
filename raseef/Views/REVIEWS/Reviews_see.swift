//
//  Reviews_see.swift
//  raseef
//
//  Created by Teamx tec on 20/11/2022.
//

import SwiftUI

struct Reviews_see: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
     @State var ar_lan = true
     @State var en_lan = false
    @State private var rating : Double = 2
    var body: some View {
    

        NavigationView {
            ScrollView{
                ZStack(alignment: .top) {
                    Color.white
                    ScrollView{
                        VStack(spacing:30){
                            ForEach(0..<6){
                                i in
                                ZStack(alignment: .top) {
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                        .frame(height: UIScreen.main.bounds.height * 0.33)
                                        .border(.gray, width: 1, cornerRadius: 15)
                                    // .border(Color.gray, width: 2)
                                        .shadow(radius: 2)
                                    
                                    
                                    
                                    VStack(alignment:.leading){
                                        HStack{
                                            
                                            Text("Order # 124253XC")
                                            Spacer()
                                            
                                            
                                            
                                            Text("Completed")
                                                .font(.system(size: 15,weight: .medium))
                                                .padding(8)
                                                .padding(.horizontal,7)
                                                .background(.green)
                                                .cornerRadius(15)
                                        }
                                        HStack(spacing:8) {
                                            
                                            Image(icon: .Clothesshop)
                                                .resizable()
                                                .frame(width: 100, height:100)
                                                .cornerRadius(10)
                                            VStack(alignment:.leading,spacing: 5){
                                                
                                                Text("Formal Pants")
                                                    .basicText()
                                                Text("Laundry Basket")
                                                    .smallText()
                                                Text("Clean & Iron")
                                                    .smallText()
                                                HStack(spacing:2){
                                                    Text("55")
                                                        .font(.system(size: 14,weight: .bold))
                                                    Text("AED")
                                                        .font(.system(size: 10,weight: .bold))
                                                        .padding(.top,5)
                                                    
                                                    
                                                    Spacer()
                                                    Text("Qty: 1")
                                                        .font(.system(size: 14,weight: .regular))
                                                        .foregroundColor(.darkGray)
                                                        .padding(.trailing,10)
                                                    
                                                    
                                                }
                                                .foregroundColor(Color(hex:0xFA6109))
                                            }
                                            
                                            
                                        }
                                      
                                        Text("Note: Seperate wash with hanger")
                                            .font(.system(size: 13,weight: .regular))
                                            .foregroundColor(.darkGray)
                                        
                                        Divider()
                                        
                                        HStack{
                                         
                                            Image(icon: .profile_img)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                           
                                            VStack(alignment:.leading,spacing: 0){
                                                HStack{
                                                    Text("Alessandro Bahgat")
                                                    
                                                    Spacer()
                                                    
                                                    Text("3 months ago")
                                                }
                                          .font(.system(size: 12))
                                                HStack{
//                                                    Rating_api_response(rating: $rating)
//                                                    TextEditor(text: $review)
                                      //                 Rating_api_response(rating: 5)
                                                    Api_Rating(rating: $rating)
                                                }
                                            }
                                            
                                        }
                                        
                                        Text("Their pain au chocolate is one of the best I’ve had in Cambridge. Their pain au chocolate is.")
                                            .font(.system(size: 12))
                                        
                                     
                                    }
                                    
                                    
                                    .padding(.horizontal,15)
                                    .padding(.top,10)
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
            }
           
             
        
        }
    }
}

struct Reviews_see_Previews1: PreviewProvider {
    static var previews: some View {
        Reviews_see()
    }
}
