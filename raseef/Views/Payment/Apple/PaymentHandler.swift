//
//  PaymentHandler.swift
//  raseef
//
//  Created by Teamx tec on 29/12/2022.
//

import Foundation
////
////  PaymentHandler.swift
////  ApplePay
////
////  Created by Teamx tec on 24/11/2022.
////
//
//import Foundation
//import PassKit
//
//typealias PaymentCompletionHandler = (Bool) -> Void
//
//class PaymentHandler: NSObject{
//
//    var paymentController: PKPaymentAuthorizationController?
//    var paymentSummaryItems = [PKPaymentSummaryItem]()
//    var paymentStatus = PKPaymentAuthorizationStatus.failure
//    var completionHandler: PaymentCompletionHandler?
//
//    static let supportedNetworks: [PKPaymentNetwork] = [
//
//        .visa,
//        .masterCard,
//
//
//    ]
//
//    func shippingMethodCalculator() -> [PKShippingMethod]{
//
//        let today = Date()
//        let calender = Calendar.current
//        let shippingStart = calender.date(byAdding: .day, value: 8, to: today)
//        let shippingEnd = calender.date(byAdding: .day, value: 18, to: today)
//        if let shippingEnd = shippingEnd, let shippingStart = shippingStart
//        {
//            let startComponents = calender.dateComponents([.calendar,.year,.month,.day], from: shippingStart)
//            let endComponents = calender.dateComponents([.calendar,.year,.month,.day], from: shippingEnd)
//
//            let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
//            shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
//            shippingDelivery.detail = "Sweater send to your address"
//            shippingDelivery.identifier = "Delivery"
//
//            return [shippingDelivery]
//        }
//        return []
//
//
//
//    }
//
//    func startPayment(product: [Product], total: Int , completion: @escaping PaymentCompletionHandler)
//    {
//
//        completionHandler = completion
//        paymentSummaryItems = []
//
//        product.forEach{
//
//            product in
//
//            let item = PKPaymentSummaryItem(label: product.name, amount: NSDecimalNumber(string: "\(product.price)"), type: .final)
//            paymentSummaryItems.append(item)
//        }
//        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "\(total).00"), type: .final)
//        paymentSummaryItems.append(total)
//        let paymentRequest = PKPaymentRequest()
//
//        paymentRequest.paymentSummaryItems = paymentSummaryItems
//        paymentRequest.merchantIdentifier = "merchant.com.teamx.Applepay"
//        paymentRequest.merchantCapabilities = .capability3DS
//        paymentRequest.countryCode = "US"
//        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
//
//        paymentRequest.shippingType = .delivery
//        paymentRequest.shippingMethods = shippingMethodCalculator()
//        paymentRequest.requiredShippingContactFields = [.name , . postalAddress]
//        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
//        paymentController?.delegate = self
//        paymentController?.present(completion: { (presented: Bool)
//            in
//            if presented {
//                debugPrint("Presented payment controller")
//            }
//            else{
//                debugPrint("Presented payment controller")
//            }
//
//        })
//
//    }
//}
//
//    extension PaymentHandler: PKPaymentAuthorizationControllerDelegate{
//
//        func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void)
//        {
//            let errors = [Error]()
//            let status =  PKPaymentAuthorizationStatus.success
//            self.paymentStatus = status
//            completion(PKPaymentAuthorizationResult(status: status, errors: errors))
//
//        }
//
//
//        func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController)
//        {
//            controller.dismiss{
//                DispatchQueue.main.async {
//
//                    if self.paymentStatus == .success {
//
//                        if let completionHandler = self.completionHandler {
//
//                            completionHandler(true)
//                        }
//
//
//                    }
//
//                    else
//                    {
//                        if let completionHandler = self.completionHandler {
//
//                            completionHandler(false)
//                        }
//
//                    }
//                }
//            }
//
//        }
//
//    }
//
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject,ObservableObject {

static let supportedNetworks: [PKPaymentNetwork] = [
    .amex,
    .masterCard,
    .visa,
]

var paymentController: PKPaymentAuthorizationController?
var paymentSummaryItems = [PKPaymentSummaryItem]()
var paymentStatus = PKPaymentAuthorizationStatus.failure
var completionHandler: PaymentCompletionHandler?

func startPayment(completion: @escaping PaymentCompletionHandler) {
    if  let Our_amount = UserDefaults.standard.string(forKey: "amount"){
        let amount = PKPaymentSummaryItem(label: "Amount", amount: NSDecimalNumber(string: Our_amount), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "1.12"), type: .final)
        let total = PKPaymentSummaryItem(label: "ToTal", amount: NSDecimalNumber(string: "10.00"), type: .pending)

        paymentSummaryItems = [amount, tax, total];

    }
    completionHandler = completion

    // Create our payment request
    let paymentRequest = PKPaymentRequest()
    paymentRequest.paymentSummaryItems = paymentSummaryItems
    paymentRequest.merchantIdentifier = "merchant.com.YOURDOMAIN.YOURAPPNAME"
    paymentRequest.merchantCapabilities = .capability3DS
    paymentRequest.countryCode = "US"
    paymentRequest.currencyCode = "USD"
    paymentRequest.requiredShippingContactFields = [.phoneNumber, .emailAddress]
    paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks

    // Display our payment request
    paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
    paymentController?.delegate = self
    
    paymentController?.present(completion: { (presented: Bool) in
        if presented {
            NSLog("Presented payment controller")
        } else {
            NSLog("Failed to present payment controller")
            self.completionHandler!(false)
         }
     })
  }
}

/*
    PKPaymentAuthorizationControllerDelegate conformance.
*/
extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {
   

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {

        // Perform some very basic validation on the provided contact information
        if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
            paymentStatus = .failure
        } else {
            // Here you would send the payment token to your server or payment provider to process
            // Once processed, return an appropriate status in the completion handler (success, failure, etc)
            paymentStatus = .success
            let success = "true"
            UserDefaults.standard.set(success,forKey: "IsAppleSuccess")
            print("paymentAuthorizationController completion(.success)")
        }

        completion(paymentStatus)
    }
      
      func paymentAuthorizationControllerWillAuthorizePayment(_ controller: PKPaymentAuthorizationController) {
          print("WillAuthorizePayment")
      }


func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
    controller.dismiss {
        DispatchQueue.main.async {
            if self.paymentStatus == .success {
                self.completionHandler!(true)
              
            } else {
                self.completionHandler!(false)
            }
        }
    }
}

}
