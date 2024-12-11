//
//  Create_OrderViewModel.swift
//  raseef
//
//  Created by Teamx tec on 26/12/2022.
//

import Foundation


class Create_OrderViewModel: ObservableObject{
    
    @Published var payment_method_id = ""

    @Published var pushToPaymentCardList = false
    

    func CreateOrder(parameterString:[String:Any?])async {
        do {
            
            let response = try await Webservice().Create_Order(parameterString: parameterString)
            DispatchQueue.main.async {
                print(response)
                
            }
            } catch {
              
            print(error)
         
        }
    }
        
        
    
 
}
