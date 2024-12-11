//
//  DeleteButtons.swift
//  raseef
//
//  Created by Teamx tec on 23/12/2022.
//

import SwiftUI

struct DeleteButtons: View {
    var body: some View {
        HStack()
        {
            Spacer()
     
            Button{
                
            }label:{
                Image(systemName: "xmark.bin")
                    .resizable()
                    .frame(width: 20, height: 20)
            }.foregroundColor(Color.red)
        }
    }
}

struct DeleteButtons_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButtons()
    }
}
