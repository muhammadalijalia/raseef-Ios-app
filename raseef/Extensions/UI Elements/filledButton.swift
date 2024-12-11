////
////  FilledButton.swift
////  Multivendor
////
////  Created by Rehan Ali Khan on 24/05/2022.
////
//
import SwiftUI

extension View {
    func filledButton() -> some View {
        self
            .font(.custom(opensans: .italic1, style: .title3))
            .padding(.vertical, 13)
            .foregroundColor(.white)
            .background(Color(hex: 0xFA6109))
            .cornerRadius(12)
    }
    func filledWhiteButton() -> some View {
        self
            .font(.custom(opensans: .italic1, style: .title3))
            .padding(.vertical, 13)
            .foregroundColor(Color(hex: 0xFA6109))
            .background(Color.white)
            .cornerRadius(12)
            .border(Color(hex: 0xFA6109), width: 2, cornerRadius: 12)
    }
}

//
////struct TestView: View {
////
////    var body: some View {
////        Button {
////            print("Button Pressed")
////        } label: {
////            Text("Filled Button")
////        }
////        .filledButton()
////    }
////}
////
////struct Test_Previews: PreviewProvider {
////    static var previews: some View {
////        TestView()
////            .previewLayout(.sizeThatFits)
////    }
////}
