//
//  PaymentViewModel.swift
//  raseef
//
//  Created by Teamx tec on 21/12/2022.
//

import Foundation
import SwiftUI
extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    mutating func setQueryItemsS_A(with parameters: [String: Any?]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
    }
}
class PaymentViewModel: ObservableObject{
    
    @Published var payment_method_id = ""

    @Published var pushToPaymentCardList = false
    

    func getStripeId(parameterString:[String:String])async {
        do {
            let response = try await Webservice().getStripeData(parameterString: parameterString)
            DispatchQueue.main.async {
             
                self.payment_method_id = response.id ?? ""
                
           
               // print(response.id)

                if response.id == ""{

                }
                else{
                    Task{
                       // print(self.payment_method_id)
                    await
                        self.addCreditCard(strip_id: self.payment_method_id)
                    }
                }
            }
          
            } catch {
              
            print(error)
         
        }
    }
        
        
    func addCreditCard(strip_id:String)async {
        do {
            
            let Url = Constants.add_creditCard;
            let postString = ["payment_method_id" : self.payment_method_id]
            let component = URL(string:Url);
            //print(component as Any)
            guard let requestUrl = component else {
                throw NetworkError.badURL
            }
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "POST"
            do {
                 let requestBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
                request.httpBody = requestBody
                //token maybe change
                request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoid29nb2M2MjA0M0Bwcm81Zy5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE2NzE3ODE3MjgsImV4cCI6MTY3MjM4NjUyOH0.ilW-yGvQdZHX500wWiNSz45FV0Qee2Nt2uLwBpK21ug", forHTTPHeaderField: "Authorization")

                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
            }
            catch let error {
                debugPrint(error.localizedDescription)
            }
          //  let (data, _) = try await URLSession.shared.data(for: request)
            let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    
                }
                
                // Convert HTTP Response Data to a String
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8)
                {
                    print("Response data string:\n \(dataString)")
                    DispatchQueue.main.async {
                        self.pushToPaymentCardList = true
                    }
                  
                 }
            }
            task.resume()
//            let response = try await Webservice().AddC_C(strip_id: strip_id)
//            DispatchQueue.main.async {
//
//
//            }
          
            } catch {
              
            print(error)
         
        }
    }
 @Published var CC_data = [Datum]()
   
    func GetCreditCard()async {
        do {
            let CC_response = try await Webservice().getCreditCardData()
            DispatchQueue.main.async{
                self.CC_data = CC_response.data ?? []
                
                
                for indx in 0..<self.CC_data.count{
                    
                    self.CC_data[indx].ChkVariable = false
                }
                //print(self.CC_data)
                 
            }
          
            } catch {
              
            print(error)
         
        }
    }
    
     // work kerna h isper/
    func DelCreditCard(selectID: String)async {
        do {
            let CC_response = try await Webservice().DeleteC_C(selectID:selectID)
            DispatchQueue.main.async{
                Task{
                    await
                    self.GetCreditCard()
                }
            }
          
            } catch {
              
            print(error)
         
        }
    }
    
}
