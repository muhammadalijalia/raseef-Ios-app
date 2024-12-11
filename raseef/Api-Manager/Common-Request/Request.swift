//
//  Request.swift
//  Multivender
//
//  Created by Teamx tec on 28/09/2022.
//

//
//  PostRequest.swift
//  TNW Driver
//
//  Created by apple on 06/02/2022.
//

import Foundation
class Request{
    
    var url="";
  
    

    func pathParameters_get(urlString:String,parameters:String,completion: @escaping ((String) -> Void)) 
    {
        
       
        let query = urlString+parameters
        let semaphore = DispatchSemaphore (value: 0)
        let url = URL(string:query)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url:requestUrl,timeoutInterval: 5)
        request.httpMethod = "GET"
        
  
        let task =  try URLSession.shared.dataTask(with: request){ (data, response, error) in
            
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                  completion("Error took place \(error)")
                }

                // Convert HTTP Response Data to a String
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8)
                {
                    print("Response data string:\n \(dataString)")
                    
                 completion(dataString)

                }
               }

        task.resume()
        semaphore.wait()

    }
    func Query_parameters_get(urlString:String,parameters:String,completion: @escaping ((String) -> Void)) async
    {
        let key = "?search="
        let query = urlString+key+parameters
        let semaphore = DispatchSemaphore (value: 0)
        let url = URL(string:query)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url:requestUrl,timeoutInterval: 5)
        request.httpMethod = "GET"
  
        let task =  try URLSession.shared.dataTask(with: request){ (data, response, error) in
            
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                  completion("Error took place \(error)")
                }

                // Convert HTTP Response Data to a String
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8)
                {
                    print("Response data string:\n \(dataString)")
                    
                 completion(dataString)

                }
               }

        task.resume()
        semaphore.wait()

    }
    //GET WITHOUT PARMAS
     func get(urlString:String,completion: @escaping ((String) -> Void)){
          
          let url = URL(string:urlString)
          guard let requestUrl = url else { fatalError() }
        
          var request = URLRequest(url: requestUrl)
          request.httpMethod = "Get"
          let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
              
                  // Check for Error
                  if let error = error {
                      print("Error took place \(error)")
                    completion("Error took place \(error)")
                  }

                  // Convert HTTP Response Data to a String
                  if let data = data,
                     let dataString = String(data: data, encoding: .utf8)
                  {
                      //print("Response data string:\n \(dataString)")
                      
                   completion(dataString)

                  }
                 }
          task.resume()
          
     }
    
    
    func post(urlString:String,parameterString:[String:String],completion: @escaping ((String) -> Void)) {
     //  var pst2 = UserDefaults.standard.string(forKey: "postString2");
       
        
        var responseString = ""
       
        let url = URL(string:urlString)
        guard let requestUrl = url else { fatalError() }
      
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
     
//        let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]
        do {


        let requestBody = try JSONSerialization.data(withJSONObject: parameterString, options: .prettyPrinted)

         request.httpBody = requestBody
         request.addValue("application/json", forHTTPHeaderField: "content-type")
                   
               }
        catch let error {
                   debugPrint(error.localizedDescription)
               }
        // Set HTTP Request Body
        //request.httpBody = parameterString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                  completion("Error took place \(error)")
                }

                // Convert HTTP Response Data to a String
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8)
                {
                    print("Response data string:\n \(dataString)")
                    
                 completion(dataString)

                }
               }
        task.resume()
    }
    
  
}
