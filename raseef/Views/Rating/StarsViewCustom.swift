//
//  StartView.swift
//  raseef
//
//  Created by Teamx tec on 14/12/1522.
//

import SwiftUI
extension FloatingPoint {
    var isWholeNumber: Bool { isNormal ? self == rounded() : isZero }
}
struct StarsViewCustom: View {
   // @Binding var rating : Double
    @State var rating : Double = UserDefaults.standard.double(forKey: "rating")

    var body: some View {
      
        HStack(spacing:5){
      
           if rating.isWholeNumber{
       
                if (rating == 0){
                   
                    ForEach(0..<5)
                    {
                        r in
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    
                }
                
          // 0-means 1
                    if rating == 1{
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                        ForEach(0..<4)
                        {
                            r in
                            Image(systemName: "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 15, height: 15)
                        }
                        
                    }
                // 1-means 2
                    else if (rating == 2){
                        ForEach(0..<2)
                        { i in
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 15, height: 15)
                        }
                        ForEach(0..<3)
                        {
                            r in
                            Image(systemName: "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 15, height: 15)
                        }
                    }
                else if (rating == 3)
                {
                    ForEach(0..<3)
                    {
                         i in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    ForEach(0..<2)
                    {
                        r in
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                }
//                // 1-means 2
                else if (rating == 4){
                    ForEach(0..<4)
                    { i in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    ForEach(0..<1)
                    {
                        r in
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                }
//                // -means 5
                    else if (rating == 5){
                        ForEach(0..<5)
                        { i in
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 15, height: 15)
                        }
                    }
               
                    
                    
             
                
                
//                else
//                {
//
//
//                    Image(systemName: "star.leadinghalf.filled")
//                        .resizable()
//                        .foregroundColor(.yellow)
//                        .frame(width: 15, height: 15)
//                }
                
                
                
          
        }
            
            else{
                
                if (rating == 0.5){
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    
                             ForEach(0..<4)
                             {
                                 r in
                                 Image(systemName: "star")
                                     .resizable()
                                     .foregroundColor(.yellow)
                                     .frame(width: 15, height: 15)
                             }
                             
                         }
                if (rating == 1.5){
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    
                             ForEach(0..<3)
                             {
                                 r in
                                 Image(systemName: "star")
                                     .resizable()
                                     .foregroundColor(.yellow)
                                     .frame(width: 15, height: 15)
                             }
                             
                         }
                if (rating == 2.5){
                    ForEach(0..<2)
                    { i in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    
                             ForEach(0..<2)
                             {
                                 r in
                                 Image(systemName: "star")
                                     .resizable()
                                     .foregroundColor(.yellow)
                                     .frame(width: 15, height: 15)
                             }
                             
                         }
                if (rating == 3.5){
                    ForEach(0..<3)
                    { i in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    
                             ForEach(0..<1)
                             {
                                 r in
                                 Image(systemName: "star")
                                     .resizable()
                                     .foregroundColor(.yellow)
                                     .frame(width: 15, height: 15)
                             }
                             
                         }
                if (rating == 4.5){
                    ForEach(0..<4)
                    { i in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 15, height: 15)
                    }
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    
                        
                             
                         }
                
            }
        }
     
        
   

    }
}

struct StarsViewCustom_Previews2: PreviewProvider {
    static var previews: some View {
        StarsViewCustom()
    }
}
