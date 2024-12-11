//
//  Add_Review.swift
//  raseef
//
//  Created by Teamx tec on 20/11/2022.
//

import SwiftUI

struct Add_Review: View {
    @State var navbarhome = false
    @State var navbarprofile = false
    @State var navbarshop = false
    @State var navbarnotify = false
   
    @State private var rating : Double = 2
    @State var add_review = false
    @State private var profileText :String = ""
    @State var placeholderText = "Write a Review"
    var body: some View {
    
        NavigationView {
         
            
                ZStack(alignment: .top) {
                    Color.white
                  
                            
                    VStack(spacing:20){
                        
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color.yellow)
                                .frame(width: 30, height: 30)
                     
                            Text("Write a Review")
                            Image(systemName: "star")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color.gray)
                                .frame(width: 30, height: 30)
                            
                        }
                        HStack(spacing:10){
                            ForEach(0..<3)
                            { i in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color.yellow)
                                    .frame(width: 30, height: 30)
                                
                            }
                        }
                        ZStack {
                            if self.profileText.isEmpty {
                                    TextEditor(text:$placeholderText)
                                        .font(.body)
                                        .foregroundColor(.gray)
                                        .disabled(true)
                                       
                                       // .padding()
                                   
                            }
                            TextEditor(text: $profileText)
                                .font(.body)
                               
                               .opacity(self.profileText.isEmpty ? 0.25 : 1)
                               // .padding()
                            
                            
                        }
                        .frame(width:UIScreen.main.bounds.width * 0.8,height: UIScreen.main.bounds.height * 0.3 ,alignment: .leading)
                        .border(Color.gray, width: 1)
                        .background(Color.gray)
                  
                        Button{}label:{
                            
                            Text("Submit")
                                .frame(maxWidth:310)
                                .filledButton()
                        }
                                  
                    }
                    
                        
                      
                 
                    
                 
                  .padding(.horizontal,10)
             
                    
                }
            }
           
             
        
        
        
    }
}

struct Add_Review_Previews: PreviewProvider {
    static var previews: some View {
        Add_Review()
    }
}
