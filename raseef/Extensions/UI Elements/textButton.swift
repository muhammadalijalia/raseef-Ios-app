////
////  textButton.swift
////  Multivendor
////
////  Created by Rehan Ali Khan on 25/05/2022.
////
//
import SwiftUI

extension View {
    func textButton() -> some View {
        self
            .font(.custom(opensans: .italic1, style: .headline))
            .foregroundColor(Color(hex: 0xFA6109))
      
            .cornerRadius(15)
            .background(Color.clear)
    }
}
//
////struct TestView: View {
////
////    var body: some View {
////        Button {
////            print("Button Pressed")
////        } label: {
////            Text("Text Button")
////        }
////        .textButton()
////    }
////}
////
////struct Test_Previews: PreviewProvider {
////    static var previews: some View {
////        TestView()
////            .previewLayout(.sizeThatFits)
////    }
////}
