//
//  Message_View_1.swift
//  raseef
//
//  Created by Teamx tec on 15/11/2022.
//

import SwiftUI


struct Message_View_1: View {
    @State var searchMsg = ""
    var body: some View {
        NavigationView{
            GeometryReader{ geo in
                ZStack{
                    VStack(spacing:0){
                        VStack{
                            Image(icon: .navbar)
                                .resizable()
                                
                              
                               
                             
                               
                                .frame(width: geo.size.width, height: geo.size.height * 0.15)
                                .cornerRadius(30, corners: [.bottomRight, .bottomLeft])
                               .ignoresSafeArea()
                                .overlay(
                                    HStack(){
                                        
                                        Button{}label:{
                                            Image(icon: .leftArrow)
                                                .resizable()
                                                .frame(width: 15, height: 20)
                                        }
                                       
                                        
                                        Spacer()
                                     Text("MESSAGE")
                                            .font(.system(size: 22,weight: .bold))
                                            .foregroundColor(Color.white)
                                        Spacer()
                                        Text("MESSAGE")
                                            .hidden()
                                     
                                        
                                    }
                                        .foregroundColor(Color.white)
                                        .frame(width: 400,alignment: .leading)
                                        .padding(.leading,50)
                                     .padding(.vertical,-30)
        //                                .padding(.leading,40)
        //                                .padding(.trailing,160)
                                )
                        }
                        
                      
                           
                        VStack(spacing:20){
                            HStack(spacing:15){
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                TextField("",text: $searchMsg)
                                    .font(.system(size: 20))
                                    .background(
                                           ZStack{
                                           Color.white
                                               if searchMsg.count == 0 {
                                                   HStack {
                                                       Text("Search...")
                                                       .font(.title2)
                                                       .fontWeight(.medium)
                                                           .foregroundColor(.orange)
                                                           .padding(.horizontal)
                                                       Spacer()
                                                 }
                                                .frame(maxWidth: .infinity)
                                               }
                                           }
                                       )
                                    }
                            .foregroundColor(Color.orange)
                          
                            
                         
                         
                       
                            .padding()
                            .border(.gray, width: 1, cornerRadius: 20)
                            //.background(Color.white)
                             .padding(.horizontal,30)
                            ScrollView{
                                ForEach(0..<10)
                                {i in
                                    Button{
                                        
                                        
                                    } label: {
                                        VStack {
                                            HStack(spacing: 18) {
                                                Image(icon: .shoplogo)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 70, height: 70)
                                                    .cornerRadius(70)
                                                    .overlay(RoundedRectangle(cornerRadius: 70).stroke(lineWidth: 2))
                                                
                                                VStack(alignment:.leading,spacing: 5){
                                                    Text("StarBucks Coffee")
                                                        .font(.system(size:20,weight: .bold));                   Text("2 hours ago")
                                                }
                                                Spacer()
                                            }.padding(.horizontal,20)
                                            
                                            Divider()
                                                .padding(.top, 8)
                                                .padding(.bottom, 8)
                                        }
                                    }.foregroundColor(.label)
                                }
                             
                            }
                        }
                        .padding(.vertical,-20)
                                      
                                
   
                         
                            
                       
                    }
             
                }
            }
        
            
            
        }
       // .ignoresSafeArea()
    }
}

struct Message_View_1_Previews2: PreviewProvider {
    static var previews: some View {
        Message_View_1()
    }
}
