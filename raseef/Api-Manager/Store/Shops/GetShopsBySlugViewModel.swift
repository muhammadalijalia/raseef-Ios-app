//
//  GetShopsBySlugViewModel.swift
//  raseef
//
//  Created by Teamx tec on 08/11/2022.
//


import Foundation
@MainActor
class GetShopsBySlugViewModel:ObservableObject{
    
    @Published var Slugshops = [ShopBySlug]()
    @Published var pushtoStore = false
    @Published var dataResponse = false
    
    func getStoreprofile(slug: String) async {
        do {
            print(slug)
            // not working with "ny-fashion---dubai"
            // work kerraha h https://zues.teamxmv.com/api/shops/ny-fashion---dubai
            // when click https://zues.teamxmv.com/api/shops/clothing-shop
       // https://zues.teamxmv.com/api/shops/makeup-store
          
            let k = Constants.getshopsByslug+slug;
            print(k)
              let component = URL(string:k);

              guard let url = component else {
                  throw NetworkError.badURL
              }
             
             let (data, response) = try await URLSession.shared.data(from: url)
           
          

            
           if  let shopResponse = try? JSONDecoder().decode(ShopBySlug.self, from: data)
            {
               self.dataResponse = true

               self.pushtoStore = true
               self.Slugshops.append(shopResponse)
              
               
               UserDefaults.standard.set(shopResponse.id, forKey: "StoreId")
               UserDefaults.standard.set(shopResponse.coverImage, forKey: "StoreCoverImage")
               UserDefaults.standard.set(shopResponse.logo, forKey: "StoreLogo")
               UserDefaults.standard.set(shopResponse.name, forKey: "StoreName")
               UserDefaults.standard.set(shopResponse.address.streetAddress, forKey: "StoreAddress")
               UserDefaults.standard.set(shopResponse.rating, forKey: "StoreRating")
           }
            else
            {
                print("no response")
                UserDefaults.standard.removeObject(forKey: "StoreId")
                UserDefaults.standard.removeObject(forKey: "StoreCoverImage")
                UserDefaults.standard.removeObject(forKey: "StoreLogo")
                UserDefaults.standard.removeObject(forKey: "StoreName")
                UserDefaults.standard.removeObject(forKey: "StoreAddress")
                UserDefaults.standard.removeObject(forKey: "StoreRating")
                UserDefaults.standard.removeObject(forKey: "StoreId")
               
            }
           // let store = try await Webservice().getStore(slug: slug)
             //po shop[0].settings.location.formattedAddress


          //  print(store.name!+" = "+store.id!)
         
             
        } catch {
            print(error)
        }
    }
//    func GetShopsBySlug(slug: String)
//    {
//        let loginRequest = Request();
//        let params  = slug;
//        loginRequest.pathParameters_get(urlString: Constants.getshopsByslug, parameters: params)
//            {
//
//                (string) in
//                do {
//                    let data = string.data(using: .utf8)!
//
//                    do {
//                        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
//                            {
//
//                        //if
//                            let myServiceResponse = try? JSONDecoder().decode(ShopBySlug.self, from: data)
//                           // {
//
//                                DispatchQueue.main.async {
//                                    print("oama here")
////                                    self.pushtoStore = true
////                                    print(self.pushtoStore)
////                                    let store_CoverImg = myServiceResponse?.coverImage
////                                    print(store_CoverImg ?? "No cover Image")
////
////                                    let store_logo = myServiceResponse?.logo
////                                    let store_name = myServiceResponse?.name
////                                    let store_address = myServiceResponse?.address
////                                    let store_rating = myServiceResponse?.rating
////                                    let store_formatAdd = myServiceResponse?.settings.location.formattedAddress
//
//                                }
//
//
//
//
//
//                      //  }
//
//   }
//
//                                        }
//                     catch let error {
//                          print(error)
//                                    }
//
//                                    }
//            }
//    }
}
