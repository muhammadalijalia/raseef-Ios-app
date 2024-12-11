//
//  SecureTextField.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 03/06/2022.
//

import SwiftUI

struct SecureTextFieldEyed: View {
    
    @State private var isSecureField: Bool = true
    var placeHolder: String = "Password"
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            
            Image(icon: .password)
                .resizable()
                .frame(width: 23, height: 27)
            
            HStack(spacing: 0) {
                if isSecureField {
                    SecureField(placeHolder, text: $text)
                        .textContentType(.password)
                        .accentColor(.customGray)
                        .multilineTextAlignment(.leading)
                }
                else {
                    TextField(placeHolder, text: $text)
                        .textContentType(.password)
                        .accentColor(.customGray)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .fill(Color.customBlack)
                    .frame(height: 1)
                    .padding(.top, 36)
                
            )
            .foregroundColor(.customForeground)
            .font(.custom(helvitica: .helvetica, style: .body))
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 30))
            .overlay(alignment: .trailing) {
                Button {
                    isSecureField.toggle()
                } label: {
                    Image(systemIcon: isSecureField ? .eyeClosed : .eyeOpened)
                        .resizable()
                        .tint(Color.customBlack)
                        .frame(width: 24, height: 17)
                        .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 0))
                        .background(Color.customBackground)
                }
                
            }
            
        }
    }
}

struct SecureTextFieldEyed_Previews: PreviewProvider {
    
    @State static private var password: String = ""
    
    static var previews: some View {
        
        SecureTextFieldEyed(text: $password)
    }
}
