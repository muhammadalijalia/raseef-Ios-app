//
//  PasswordText.swift
//  Multivender
//
//  Created by Teamx tec on 28/09/2022.
//

import SwiftUI

struct PasswordText: View {
    let screenSize = UIScreen.main.bounds.size;
    @State private var secured: Bool = true
    var placeHolder: String
    @Binding var password: String
    var body: some View {
//        VStack{
//            Image(icon: .password)
//                .resizable()
//                .frame(width: 23, height: 27)
//            HStack{
//
//                if secured {
//
//                    // 2
//
//
//                    SecureField("Password", text: $password
//                    )
//
//                        .textContentType(.password)
//                        .accentColor(.customGray)
//                        .multilineTextAlignment(.leading)
//                        .autocapitalization(.none)
//                        .disableAutocorrection(true)
//
//
//                } else {
//
//                    // 3
//
//
//                    TextField("Password", text: $password)
//
//
//                        .textContentType(.password)
//                        .accentColor(.customGray)
//                        .multilineTextAlignment(.leading)
//                        .autocapitalization(.none)
//                        .disableAutocorrection(true)
//
//                }
//
//
//                Button(action: {
//                    self.secured.toggle()
//                }) {
//
//                    // 2
//                    if secured {
//                        Image(systemName: "eye.slash.circle")
//                            .font(.system(size:12))
//                            .foregroundColor(Color.gray
//                            )
//                    } else {
//
//                        Image(systemName: "eye.circle")
//                            .font(.system(size:12))
//                            .foregroundColor(Color.gray
//                            )
//                    }
//                }
//
//
//            }
//            .padding(20)
//
//            .background(Color.red)
//            .padding(.horizontal, 45)
//            .padding(.bottom,12)
//           .padding(.top, 20)
//
//
//
//
//
//
//
//        }
//        .frame(width: screenSize.width*0.95, height: screenSize.height*0.05)
        HStack {
            
            Image(icon: .lock)
                .resizable()
                .frame(width: 23, height: 27)
            
            HStack(spacing: 0) {
                if secured {
                    SecureField(placeHolder, text: $password)
                        .textContentType(.password)
                        .accentColor(.customGray)
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                else {
                    TextField(placeHolder, text:  $password)
                        .textContentType(.password)
                        .accentColor(.customGray)
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
            }
            .padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .fill(Color(hex: 0x94959B80))
                    .frame(height: 1)
                    .padding(.top, 36)
                
            )
            .foregroundColor(.customForeground)
            .font(.custom(opensans: .italic1 , style: .body))
            // .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .overlay(alignment: .trailing) {
                Button {
                    secured.toggle()
                } label: {
                    Image(systemIcon: secured ? .eyeClosed : .eyeOpened)
                        .resizable()
                        .tint(Color.customForeground)
                        .frame(width: 24, height: 17)
                        .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 0))
                        .background(Color.customWhite)
                }
                
            }
            
        }
    }
}

//struct PasswordText_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordText()
//    }
//}
