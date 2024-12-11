//
//  DotIndicator.swift
//  dot
//
//  Created by Teamx tec on 13/10/2022.
//

import SwiftUI
struct DotIndicator: View {
    let pageIndex: Int

    @Binding var isOn: Int

    var body: some View {
        
        
        Button(action: {
            self.isOn = self.pageIndex
        }) {
           Image(systemName: "circle.fill")
                .imageScale(.small)
                .scaleEffect(isOn == pageIndex ? 1.0 : 0.7)
                //.animation(.spring(response: 4.5), value: isOn)
               
                .foregroundColor(Color.white)
              
           
                 
          
    }
}
}
//struct DotIndicator_Previews: PreviewProvider {
//
//    static var previews: some View {
//        DotIndicator()
//    }
//}
