//
//  basicText.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 25/05/2022.
//

import SwiftUI

extension View {
    func basicText() -> some View {
        self
            .font(.custom(opensans: .italic2, style: .title3))
            .foregroundColor(Color.black)
            .background(Color.clear)
    }
}

//struct TestView: View {
//    
//    var body: some View {
//        Text("Basic Text")
//            .basicText()
//    }
//}
//
//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//            .previewLayout(.sizeThatFits)
//    }
//}
