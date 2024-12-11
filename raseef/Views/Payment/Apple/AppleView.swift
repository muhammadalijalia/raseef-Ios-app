//
//  ContentView.swift
//  ApplePay
//
//  Created by Teamx tec on 24/11/2022.
//

import SwiftUI
import PassKit
struct ApplePayButton: UIViewRepresentable {
        func updateUIView(_ uiView: PKPaymentButton, context: Context) {
    
        }
        func makeUIView(context: Context) -> PKPaymentButton {
                return PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .black)
        }
}
struct ApplePayButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
             return ApplePayButton()
        }
}

struct AppleView: View {

let paymentHandler = PaymentHandler()

var body: some View {
    Button( action:{
                    self.paymentHandler.startPayment { (success) in
                        if success {
                            print("Success")
                          
                        } else {
                            print("Failed")
                        }
                    }
                }
  
            , label: { Text("")} )
    .frame(width: 212, height: 38, alignment: .center)
    .buttonStyle(ApplePayButtonStyle()
                 )
//    Button(action: {
//            self.paymentHandler.startPayment { (success) in
//                if success {
//                    print("Success")
//                } else {
//                    print("Failed")
//                }
//            }
//        }, label: {
//            Text("PAY WITH  APPLE")
//            .font(Font.custom("HelveticaNeue-Bold", size: 16))
//            .padding(10)
//            .foregroundColor(.orange)
//    })
}

}
struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView()
    }
}
