//
//  ContentView.swift
//  Multivender
//
//  Created by Teamx tec on 27/09/2022.
//

import SwiftUI

struct EmailText: View {
    @State private var secured: Bool = true
    let screenSize = UIScreen.main.bounds.size;
var icon: Icon?
    var systemIcon: SystemIcon?
    var placeHolder: String
    @Binding var email: String
    
    init(icon: Icon, placeHolder: String, email: Binding<String>) {
        self.icon = icon
        self.placeHolder = placeHolder
        self._email = email
        self.systemIcon = nil
    }
    
    init(systemIcon: SystemIcon, placeHolder: String, email: Binding<String>) {
        self.systemIcon = systemIcon
        self.placeHolder = placeHolder
        self._email = email
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
            
         
            
          TextField(placeHolder, text: $email)
                .accentColor(.customGray)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
                .autocapitalization(.none)
                .textInputAutocapitalization(.never)
                .padding(.vertical, 10)
                .overlay(
                    Rectangle()
                        .fill(Color(hex: 0x94959B80))
                        .frame(height: 1)
                        .padding(.top, 36)
                )
                .foregroundColor(.customForeground)
                .font(.custom(opensans: .italic1, style: .body))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
//
//struct EmailText_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailText()
//    }
//}
