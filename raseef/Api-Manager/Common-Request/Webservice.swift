//
//  Webservice.swift
//  MovieSearchApp
//
//  Created by Mohammad Azam on 6/23/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class Webservice: Identifiable,ObservableObject {
 
    @Published var totalShops : Int = 0
    
   // @Published var ShopSlug = [String]()
    //// GET SHOPS BY SLUG
//    func getStore(slug: String) async throws -> ShopBySlug {
//
//
//        let k = Constants.getshopsByslug+slug;
//          let component = URL(string:k);
//
//          guard let url = component else {
//              throw NetworkError.badURL
//          }
//
//         let (data, response) = try await URLSession.shared.data(from: url)
//
//
//
//
//        let shopResponse = try! JSONDecoder().decode(ShopBySlug.self, from: data)
//
//
//
//        return shopResponse
//
//
//
//     }

    
    //// GET SHOPS BY SEARCH //GRID And LOCATION
    
    @Published var totaldocs :Int? = 0
    func getShops(searchTerm: String,pgNo:Int) async throws -> [ShopDocs] {
      
         
         
        let k = Constants.getshops+"?search="+searchTerm+"&limit=2"+"&page="+String(pgNo);
        print(k)
          let component = URL(string:k);

          guard let url = component else {
              throw NetworkError.badURL
          }
         
        let (data, _) = try await URLSession.shared.data(from: url)
       
      

      
        let shopResponse = try? JSONDecoder().decode(ShopResponse.self, from: data)
       
    UserDefaults.standard.set(shopResponse?.totalDocs, forKey: "shopResponse?.totalDocs")
    UserDefaults.standard.set(shopResponse?.hasNextPage,forKey: "shopResponse?.hasNextPage")
        //  po shopResponse?.docs[0].settings.location.formattedAddress
       
        ///SHOPS COUNT
        //totalShops = (shopResponse?.totalDocs as? Int ?? 0)
        
//        if totalShops >= 1{
//
//
//            for trkPc in 0..<totalShops {
//
//                ShopSlug.append((shopResponse?.docs?[trkPc].slug) ?? "NO VALUE SLLUG")
//               // UserDefaults.standard.set(self.ShopSlug,forKey:"ShopSlug")
//
//            }
//           // print(self.ShopSlug)
//
//
//        }
//        else
//        {
//            print("NO SLUG HERE")
//
//        }
        ///////////////////////////
        
        return shopResponse?.docs ?? []
          
         
          
     }
    /// Not WORK FOR ZUES
//    func getShops(searchTerm: String) async throws -> [ShopResponse.Docs] {
//
//        let k = Constants.getshops+"?search="+searchTerm;
//          let component = URL(string:k);
////         var components = URLComponents()
////         components.scheme = "https"
////         components.host = "//api.teamxmv.com/api/shops"
////         components.queryItems = [
////             URLQueryItem(name: "search", value: searchTerm.trimmed())
////            // URLQueryItem(name: "apikey", value: "564727fa")
////         ]
//
//
////         guard let url = components.url else {
////             throw NetworkError.badURL
////         }
//          guard let url = component else {
//              throw NetworkError.badURL
//          }
//
//         let (data, response) = try await URLSession.shared.data(from: url)
//
//
//
//
//        let shopResponse = try? JSONDecoder().decode(ShopResponse.self, from: data)
//        print(try? JSONDecoder().decode(ShopResponse.self, from: data) as Any)
//        //  po shopResponse?.docs[0].settings.location.formattedAddress
//
//        ///SHOPS COUNT
//        totalShops = (shopResponse?.totalDocs as? Int ?? 0)
//
//        if totalShops >= 1{
//
//
//            for trkPc in 0..<totalShops {
//
//                ShopSlug.append((shopResponse?.docs[trkPc].slug) ?? "NO VALUE SLLUG")
//               // UserDefaults.standard.set(self.ShopSlug,forKey:"ShopSlug")
//
//            }
//           // print(self.ShopSlug)
//
//
//        }
//        else
//        {
//            print("NO SLUG HERE")
//
//        }
//        ///////////////////////////
//
//        return shopResponse?.docs ?? []
//
//
//
//     }
    
    
    //// GET Products BY Shop_ID
    
    @Published var doc = [ProductsCard]()
    func getProductsbyShopId(search_shop_id: String) async throws -> [ProductsCard2] {
        //bag id 63170c0bbaf027ab6bd01b9f Stylish Women Blazer-3
        // makeup id 6318a59c6937e0d2e791d94a  Test_Product_Name
        //furni id 63170251baf027ab6bd01434  Brown Hardwood
         print("store_id web"+search_shop_id)
        let url = Constants.getProductsbyShopId+"?shop="+search_shop_id;
        //let u = "https://zues.teamxmv.com/api/products?shop=631701eabaf027ab6bd013f0"
        let component = URL(string:url);
        
        
        
        guard let url = component else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        
        
         let ProductResponse = try? JSONDecoder().decode(ProductsByShopsID2.self, from: data)
        
        

        




        return ProductResponse?.docs ?? []

     }
    
// GET PRoductReviews
    
    func getProductReviews(id: String) async throws -> [ReviewDocs]
    {
         
        //637f950a394349cffd71c8f2
        //637f911f394349cffd71c58c
        let k = Constants.ProductReviews + "?product=" + id;
        print(k)
          let component = URL(string:k);

          guard let url = component else {
              throw NetworkError.badURL
          }
         
        let (data, _) = try await URLSession.shared.data(from: url)
       
      

      
     
        let Reviews = try JSONDecoder().decode(ProductReview.self, from: data)
            
      
                             
        return Reviews.docs ?? []
     }
    
    
    
    /// GET DASHBOARD DATA
    
    func getDashboardData() async throws -> DashboardResponse
    {
         
        //637f950a394349cffd71c8f2
        //637f911f394349cffd71c58c
        let k = Constants.Dashboard;
        print(k)
          let component = URL(string:k);

          guard let url = component else {
              throw NetworkError.badURL
          }
         
        let (data, _) = try await URLSession.shared.data(from: url)
       
      

      
     
        let dashboardResponse = try JSONDecoder().decode(DashboardResponse.self, from: data)
            
      
                             
        return dashboardResponse
     }
    
    // Get Orders
    
//
    func getOrders() async throws -> [OrdersDoc]
    {

        //637f950a394349cffd71c8f2
        //637f911f394349cffd71c58c
        let k = Constants.GetOrders;
        print(k)
          let component = URL(string:k);

          guard let url = component else {
              throw NetworkError.badURL
          }

        let (data, _) = try await URLSession.shared.data(from: url)





        let dashboardResponse = try JSONDecoder().decode(GetAllOrders.self, from: data)



        return dashboardResponse.docs
     }

//
//
    // Get Notifications
    
    func getNotifications(user_id: String) async throws -> NotificationResponse
    {

       
        let k = Constants.notifications+"?user="+user_id;
        print(k)
        let component = URL(string:k);
        var request = URLRequest(url:component!,timeoutInterval: 5)
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoidXNhbWFAdGVhbXguZ2xvYmFsIiwicm9sZXMiOlsiY3VzdG9tZXIiXSwiaWF0IjoxNjcxNDcwNzcxLCJleHAiOjE2NzIwNzU1NzF9.AI2XlSs-idzLfDkKMy2CP4x9JxWZHRgvlbXopcfcxR4", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
     
          guard let url = component else {
              throw NetworkError.badURL
          }

        let (data, _) = try await URLSession.shared.data(for: request)





        let NotificationResponse = try JSONDecoder().decode(NotificationResponse.self, from: data)

print(NotificationResponse)

        return NotificationResponse
     }

    
    //Get Stripe Data
    
    func getStripeData(parameterString: [String:String]) async throws -> StripeResponse
    {
//
        //        var components = URLComponents()
        //        components.scheme = "https"
        //        components.host = "api.stripe.com"
        //        components.path = "/v1/payment_methods"

        //        components.queryItems = [
        //            URLQueryItem(name: "type", value: "card"),
        //            URLQueryItem(name: "card[number]", value: "4242424242424242"),
        //            URLQueryItem(name: "card[exp_month]", value: "8"),
        //            URLQueryItem(name: "card[exp_year]", value: "2023"),
        //            URLQueryItem(name: "card[cvc]", value: "314")
        //        ]

       
        let url = Constants.stripe_api;
        var components = URLComponents(string:url)!
      

         components.setQueryItems(with: parameterString)
         
         var request = URLRequest(url: components.url!)
         print(request)
         request.httpMethod = "POST"
    
            request.addValue("Bearer sk_test_51L1UVCGn3F7BuM88Gt3tFHrL2A3BjEgSNmdRePTj7oA8eKDVEN0KUhREG7JetvP2Bjm48Xx76BwwGjeqWtRI5lox00UwPsQOdi", forHTTPHeaderField: "Authorization")
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
     
            
        
      
        let (data, _) = try await URLSession.shared.data(for: request)

//        let ourErrors = try JSONDecoder().decode(StripeError.self, from: data)
//        print(ourErrors.error.message)



        let StripeResponse = try JSONDecoder().decode(StripeResponse.self, from: data)

        print(StripeResponse.id)

        return StripeResponse
     }
    
    // GET CC Data
    
    func getCreditCardData() async throws -> CreditCardResponse
    {

       
        let url = Constants.get_creditCard;
        var components = URLComponents(string:url)!
        var request = URLRequest(url: components.url!)
         //print(request)
         request.httpMethod = "GET"
         request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoid29nb2M2MjA0M0Bwcm81Zy5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE2NzE3ODE3MjgsImV4cCI6MTY3MjM4NjUyOH0.ilW-yGvQdZHX500wWiNSz45FV0Qee2Nt2uLwBpK21ug", forHTTPHeaderField: "Authorization")
            
    
        let (data, _) = try await URLSession.shared.data(for: request)
        let CC_Response = try JSONDecoder().decode(CreditCardResponse.self, from: data)

 

        return CC_Response
     }
    
    // Delete CC Data
    // work kerna h isper
    func DeleteC_C(selectID:String) async throws
    {

       
        let url = Constants.del_creditCard+selectID;
        //or url.appendPathComponent(selectID)
        let components = URLComponents(string:url)!
        var request = URLRequest(url: components.url!)
        // print(request)
        request.httpMethod = "DELETE"
         request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoid29nb2M2MjA0M0Bwcm81Zy5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE2NzE3ODE3MjgsImV4cCI6MTY3MjM4NjUyOH0.ilW-yGvQdZHX500wWiNSz45FV0Qee2Nt2uLwBpK21ug", forHTTPHeaderField: "Authorization")
            
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            //print(String(describing: error))
          
            return
          }
           if let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                    
                }
          print(String(data: data, encoding: .utf8)!)
         
        }

        task.resume()
   
     }
    
    // Create Order
    
    func Create_Order(parameterString: [String:Any])
    {
//        let jsonObject: [String: Any] = [
//            "products": [
//                [
//                    "product_id": "63a0643c3d4cefa208de547d",
//                    "order_quantity": 1,
//                    "unit_price": 25,
//                    "subtotal":  38.0
//                ]
//            ],
//            "amount": 38.0,
//            "customer_contact": "+923218932626",
//            "payment_gateway": "STRIPE",
//            "payment_method_id": "pm_1MJBUMGn3F7BuM88KUJuTiIx"
//        ]
       
        let url = Constants.Create_order;
        
        //request in Body
       
        var request = URLRequest(url: URL(string: url)!)
        print(request)
         
        request.httpMethod = "POST"
        do{
            let requestBody = try JSONSerialization.data(withJSONObject: parameterString)
         
            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoid29nb2M2MjA0M0Bwcm81Zy5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE2NzIwNzUwNzksImV4cCI6MTY3MjY3OTg3OX0.9UJHR9ZZTePlGxl-NB3Ivwxy9bLGhYrqtxDgrmAAaO4", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = requestBody
        }
        catch let error {
            debugPrint(error.localizedDescription)
        }
            
        
        
      
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
                    
                

                }
               }
        task.resume()
   
     }
    
//   //  func getMovies(searchTerm: String) async throws -> [Movie] {
//
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "omdbapi.com"
//        components.queryItems = [
//            URLQueryItem(name: "s", value: searchTerm.trimmed()),
//            URLQueryItem(name: "apikey", value: "564727fa")
//        ]
//
//        guard let url = components.url else {
//            throw NetworkError.badURL
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: url)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw NetworkError.badID
//        }
//
//        let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
//        return movieResponse?.movies ?? []
//
//    }
    
}
