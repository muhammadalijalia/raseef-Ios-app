//
//  ProductListViewModel.swift
//  raseef
//
//  Created by Teamx tec on 25/11/2022.
//

import Foundation


import SwiftUI

@MainActor
class ProductListViewModel: ObservableObject {
  
    //@Published var Docs : [ProductsByShopsID] = []
    //@Published var products: [ProductsByShopsID.ProductsCard] = []
 
    @Published var docs = [ProductsCard2]()
   
    func products(shop_id: String) async {
        print(shop_id)
        do {
            let product = try await Webservice().getProductsbyShopId(search_shop_id: shop_id)
             
        
            
            print(product)
            
            self.docs = product
           
       
     
             
        } catch {
            print(error)
            self.docs = []
        }
    }
    
}
//func products2(shop_id: String)
//{
//    //0 6318a59c6937e0d2e791d94a //ok
//    //1 63170c0bbaf027ab6bd01b9f // ok
//    //2 63170251baf027ab6bd01434 // ok
//    //3 631701eabaf027ab6bd013f0 //ok
//        //https://api.teamxmv.com/api/products?shop=63170c0bbaf027ab6bd01b9f
//// let u = "https://api.teamxmv.com/api/products?shop=631701eabaf027ab6bd013f0"
//   let k = "https://api.teamxmv.com/api/products?shop="+shop_id;
//    let loginreq = Request();
//    loginreq.get(urlString: k)   {
//
//        (string) in
//
//
//        do {
//            let data = string.data(using: .utf8)!
//
//            do {
//
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
////                        for dict in json["docs"] as! Array<NSDictionary> {
////                            print(dict["name"] as! String)
////                            print(dict["slug"] as! String)
////                            print(dict["description"] as! String)
////                            print(dict["price"] as Any)
////                        }
//                    //let statusCode = json["statusCode"] as? Int ;
//                    //let error = json["error"] as? String;
//
//
//                        let myServiceResponse = try? JSONDecoder().decode(ProductsByShopsID.self, from: data)
//
//
//                       DispatchQueue.main.async {
//                         //  self.products = myServiceResponse?.docs ?? []
//
//                           self.docs = myServiceResponse?.docs ?? []
//                           //print(self.docs)
//                          }
//
//
//                    }}
//             catch let error {[
//                  print(error)
//
//
//
//
//
//                               ] }
//
//                            }
//
//                        }
//}
