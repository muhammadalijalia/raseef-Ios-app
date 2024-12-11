//
//  NormalTextField.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 03/06/2022.
//

import SwiftUI

struct NormalTextField: View {
    
    var icon: Icon?
    var systemIcon: SystemIcon?
    var placeHolder: String
    @Binding var text: String
    
    init(icon: Icon, placeHolder: String, text: Binding<String>) {
        self.icon = icon
        self.placeHolder = placeHolder
        self._text = text
        self.systemIcon = nil
    }
    
    init(systemIcon: SystemIcon, placeHolder: String, text: Binding<String>) {
        self.systemIcon = systemIcon
        self.placeHolder = placeHolder
        self._text = text
        self.icon = nil
    }
    
    var body: some View {
        
        HStack {
            
            if let icon = icon {
                Image(icon: icon)
                    .resizable()
                    .frame(width: 23, height: 28)
            }
            else if let systemIcon = systemIcon {
                Image(systemIcon: systemIcon)
                    .resizable()
                    .frame(width: 23, height: 28)
            }
            
            TextField(placeHolder, text: $text)
                .accentColor(.customGray)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 10)
                .overlay(
                    Rectangle()
                        .fill(Color.customBlack)
                        .frame(height: 1)
                        .padding(.top, 36)
                )
                .foregroundColor(.customBlack)
                .font(.custom(helvitica: .helvetica, style: .body))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct NormalTextField_Previews: PreviewProvider {
    
    @State static private var password: String = ""
    
    static var previews: some View {
        NormalTextField(icon: .email, placeHolder: "My Placeholder", text: $password)
    }
}

