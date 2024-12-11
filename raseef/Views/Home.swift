//
//  Home.swift
//  raseef
//
//  Created by Teamx tec on 18/10/2022.
//

import SwiftUI
import Foundation
struct Home: View {
    var props: Properties
    var body: some View {
        HStack(spacing:0)
        {
            
            if props.isiPad {
                //            ViewThatFits(in: .horizontal){
                                SideBar()
                                ScrollView(.vertical, showsIndicators: false)
                                {
                                    SideBar()
                                    Text("sadasdasaaaaa")
                                    
                                }
                                .background(Color.white.ignoresSafeArea())
                                
                         //   }
                
            }
            ScrollView(.vertical,showsIndicators: false)
            {
                VStack{
                    ForEach(0..<40)
                    { i in
                        Text("SDasdasdasd")
                    }
                   
                }.padding(15)
                
            }

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
                .opacity(0.04)
                .ignoresSafeArea()
        )
    
    }
}
//@ViewBuilder
//func Header()-> some View{
//    let layout = props.isiPad && !props.ism
//}

@ViewBuilder
func SideBar()-> some View{
    Text("Dasdas")
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
