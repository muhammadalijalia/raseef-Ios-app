////
////  Reset_p.swift
////  raseef
////
////  Created by Teamx tec on 02/11/2022.
////
//
//import Foundation
//
//
//
//import SwiftUI
//
//struct Reset_p: View {
//    let screenSize = UIScreen.main.bounds.size;
//    @State private var secured: Bool = true
//    var icon: Icon?
//    var systemIcon: SystemIcon?
//    var placeHolder: String
//    @Binding var reset_password: String
//    
//    init(placeHolder: String, reset_password: Binding<String>) {
//        //self.icon = icon
//        self.placeHolder = placeHolder
//        self._reset_password = reset_password
//      //  self.systemIcon = nil
//    }
//    var body: some View {
//
//        HStack {
//            
//            Image(icon: .lock)
//                .resizable()
//                .frame(width: 23, height: 27)
//            
//            HStack(spacing: 0) {
//                if secured {
//                    SecureField(placeHolder, text: $reset_password)
//                        .textContentType(.password)
//                        .accentColor(.customGray)
//                        .multilineTextAlignment(.leading)
//                        .autocapitalization(.none)
//                        .textInputAutocapitalization(.never)
//                        .disableAutocorrection(true)
//                }
//                else {
//                    TextField(placeHolder, text:  $reset_password)
//                        .textContentType(.password)
//                        .accentColor(.customGray)
//                        .multilineTextAlignment(.leading)
//                        .autocapitalization(.none)
//                        .textInputAutocapitalization(.never)
//                        .disableAutocorrection(true)
//                }
//            }
//            .padding(.vertical, 10)
//            .overlay(
//                Rectangle()
//                    .fill(Color(hex: 0x94959B80))
//                    .frame(height: 1)
//                    .padding(.top, 36)
//                
//            )
//            .foregroundColor(.customForeground)
//            .font(.custom(opensans: .italic1 , style: .body))
//            // .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
//            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//            .overlay(alignment: .trailing) {
//                Button {
//                    secured.toggle()
//                } label: {
//                    Image(systemIcon: secured ? .eyeClosed : .eyeOpened)
//                        .resizable()
//                        .tint(Color.customForeground)
//                        .frame(width: 24, height: 17)
//                        .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 0))
//                        .background(Color.customWhite)
//                }
//                
//            }
//            
//        }
//    }
//}
//
////struct PasswordText_Previews: PreviewProvider {
////    static var previews: some View {
////        PasswordText()
////    }
////}
