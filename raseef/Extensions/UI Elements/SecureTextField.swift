//
//  SecureTextField.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 03/06/2022.
//

import SwiftUI

struct SecureTextField: View {
    
    @State private var isSecureField: Bool = true
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            
            Image(icon: .password)
                .resizable()
                .frame(width: 23, height: 27)
            
            HStack(spacing: 0) {
                SecureField(placeHolder, text: $text)
                    .accentColor(.customGray)
                    .textContentType(.password)
            }
            .padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .fill(Color.customBlack)
                    .frame(height: 1)
                    .padding(.top, 35)
                
            )
            .foregroundColor(.customForeground)
            .font(.custom(helvitica: .helvetica, style: .body))
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct SecureTextField_Previews: PreviewProvider {
    
    @State static private var password: String = ""
    
    static var previews: some View {
        
        SecureTextField(placeHolder: "Password", text: $password)
    }
}
