////
////  smallText.swift
////  Multivendor
////
////  Created by Rehan Ali Khan on 25/05/2022.
////
//
import SwiftUI
import Foundation
import Combine

extension View {
    func smallText() -> some View {
        self
            .font(.custom(opensans: .italic1, style: .body))
            .foregroundColor(Color(hex:0x424242))
           .background(Color.clear)
    }
}


extension View {
    
    func framenavbar(width: Double, height: Double) -> some View {
        self
            .frame(width: width, height: height)
    }
}
//
////struct TestView: View {
////
////    var body: some View {
////        Text("Small Text")
////            .smallText()
////    }
////}
////
////struct Test_Previews: PreviewProvider {
////    static var previews: some View {
////        TestView()
////            .previewLayout(.sizeThatFits)
////    }
////}
