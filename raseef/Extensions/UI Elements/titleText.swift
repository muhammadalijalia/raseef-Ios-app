//
//  titleText.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 25/05/2022.
//

import SwiftUI

extension View {
    func titleText() -> some View {
        self
            .font(.custom(helvitica: .bold, style: .largeTitle))
            .foregroundColor(Color.customdarkOrange)
            .background(Color.clear)
    }
}

//struct TestView: View {
//
//    var body: some View {
//        Text("Title Text")
//            .titleText()
//    }
//}
//
//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//            .previewLayout(.sizeThatFits)
//    }
//}
