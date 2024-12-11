//
//  ViewController.swift
//  raseef
//
//  Created by Teamx tec on 26/12/2022.
//

import Foundation
import PayPalCheckout
import UIKit
////





///
  class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()

      //let paymentButton = PaymentButtonContainer()
     // view.addSubview(paymentButton)

        // Create custom configuration objects
        let attributes = PaymentButtonAttributes(
            edges: .softEdges,
            size: .expanded,
            isEnabled: true
        )
        let payPalUIConfig = PayPalButtonUIConfiguration(
            color: .blue,
            //label: 0,
            attributes: attributes
        )
        let payPalCreditUIConfig = PayPalCreditButtonUIConfiguration(
            color: .white,
            attributes: attributes
        )
        let payLaterUIConfig = PayLaterButtonUIConfiguration(
            color: .black,
            attributes: attributes
        )
        // Instantiate the container passing the configuration objects
        var container = PaymentButtonContainer(
          payPalButtonUIConfiguration: payPalUIConfig,
          payPalCreditButtonUIConfiguration: payPalCreditUIConfig,
          payLaterButtonUIConfiguration: payLaterUIConfig
        )
   
        view.addSubview(container)
        NSLayoutConstraint.activate(
            [
                container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                container.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
        container = PaymentButtonContainer(delegate: PaymentButtonContainer() as? PaymentButtonContainerDelegate)
                 container.createOrder = { action in
                     print("Create order here from (action)")
                 }
                container.onCancel = {
                     print("Cancelled")
               }
                container.onError = { error in
                    print("Failed with error: (error)")
              }
                 container.onApproval = { approval in
                    print("Got approval: (approval)")
                }
                 container.onShippingChange = { change, action in
                     print("Shipping changed: \(change) (action)")
                 }
    

      configurePayPalCheckout()
    }

    func configurePayPalCheckout() {
      Checkout.setCreateOrderCallback { createOrderAction in
          if  let Our_amount = UserDefaults.standard.string(forKey: "amount"){
              let amount = PurchaseUnit.Amount(currencyCode: .usd, value: Our_amount)
              let purchaseUnit = PurchaseUnit(amount: amount)
              let order = OrderRequest(intent: .capture, purchaseUnits: [purchaseUnit])
              //createOrderAction.create(order: order)
                createOrderAction.create(order: order) { response in
                    print("Order response ", response as Any)
                 }
          }
          else{
              print("no amount here in payapl")
          }
         
       
      }

//      Checkout.setOnApproveCallback { approval in
//        approval.actions.capture { (response, error) in
//            print("Order successfully captured: \(String(describing: response?.data))")
//        } }
        Checkout.setOnApproveCallback { approval in
            approval.actions.capture { (response, error) in
                print("Order successfully captured: \(String(describing: response?.data))")
                if let orderInfo = response?.data {
                    print("Order successfully captured id: \(orderInfo.id)")
                  
                    
                    UserDefaults.standard.set(orderInfo.id, forKey: "payapl_id")
                    
                    print("Order successfully captured status: \(orderInfo.status)")
                    print("Order successfully captured orderData: \(orderInfo.orderData)")
                }
                else {
                    print("Order success Error \(error?.localizedDescription ?? "Error")")
                    UserDefaults.standard.removeObject(forKey: "payapl_id")
                }
            }
        }
        
        Checkout.setOnCancelCallback {
          print("Checkout cancelled")
            UserDefaults.standard.removeObject(forKey: "payapl_id")
        }

        Checkout.setOnErrorCallback {  errorInfo in
          print("Checkout failed with error info \(errorInfo.error.localizedDescription)")
            UserDefaults.standard.removeObject(forKey: "payapl_id")
        }
        
          
    }
      
      
      
  }
