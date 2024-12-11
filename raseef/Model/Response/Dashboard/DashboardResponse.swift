////// This file was generated from JSON Schema using quicktype, do not modify it directly.
////// To parse the JSON, add this file to your project and do:
//////
//////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
////
//
//
import Foundation
import SwiftUI

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DashboardResponse: Codable {
    let dashboard: Dashboard
    let categories: [Category]
    let topRatedProducts, popularProducts: [PopularProduct]
    let popularShops: [PopularShop]
}

// MARK: - Category
struct Category: Codable {
    let id, name, slug: String
    let image: String?
   

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
    
        case image
    }
}



// MARK: - Dashboard
struct Dashboard: Codable {
    let id: String
    let banners: [BannerClass]
    let promotionalSliders: [String]
   
    let popularBanners: [PopularBanner]
   

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case banners
        case promotionalSliders = "promotional_sliders"
       
        case popularBanners = "popular_banners"
        
    }
}

// MARK: - BannerClass
struct BannerClass: Codable {
    let title: String
    let image: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case title
       
        case image
        case id = "_id"
    }
}

// MARK: - PopularBanner
struct PopularBanner: Codable {
    let title: String
   
    let image: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case title
        case image
        case id = "_id"
    }
}

// MARK: - Product
struct PopularProduct: Codable {
    let id, name, slug: String?
  
    
   
    let ratings: Int?
   
    let image: String?
   
    let price: Int?
    
enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
        case ratings, image, price
      
       
        
    }
}




// MARK: - Shop
struct PopularShop: Codable {
    let id: String?
    let owner: String?
    let name: String?
    let slug: String?
    let coverImage: String?
    let rating: Int?
    let logo: String?
    let settings: PopularShopSettings
    
   enum CodingKeys: String, CodingKey {
        case id = "_id"
        case owner
        case name, slug
        case coverImage = "cover_image"
        case rating, logo, settings
    }
}















// MARK: - PopularShopSettings
struct PopularShopSettings: Codable {
    
    let contact: String
    let location: PopularShopLocation
   
    let id: String?

    enum CodingKeys: String, CodingKey {
        case contact, location
        case id = "_id"
    }
}



// MARK: - Location
struct PopularShopLocation: Codable {
    let formattedAddress: String?
    let id: String?
    let zip: String?

    enum CodingKeys: String, CodingKey {
        case formattedAddress
        case id = "_id"
        case zip
    }
}







//class User: Codable, Identifiable{
//
//    //var id = UUID()
// // var dashboard = [Dashboards]()
//    var dashboard: Dashboards
//   //var dashboard: Dashboards
//    var categories : [DashboardCategory] = [DashboardCategory]()
//    var topRatedProducts: [Product] = [Product]()
//    var popularShops : [PopularShop] = [PopularShop]()
//
//
//
//
//    enum CodingKeys: String,CodingKey {
//        case dashboard
//        case categories
//        case topRatedProducts
//        case popularShops
//                            }
//    class Dashboards: Codable, Identifiable {
//        let id: String
//        let banners: [Banner]
//        let promotionalSliders: [String]
//        let createdAt, updatedAt: String
//        let v: Int
//
//        enum CodingKeys: String, CodingKey {
//            case id = "_id"
//            case banners
//            case promotionalSliders = "promotional_sliders"
//            case createdAt, updatedAt
//            case v = "__v"
//        }
//
//
//        class Banner: Codable, Identifiable{
//
//
//            var title: String?
//            var description : String?
//            var image : String?
//            enum CodingKeys: String, CodingKey {
//                case title
//                case description
//                case image
//            }
//        }
//
//    }
//
//
//    class DashboardCategory: Codable, Identifiable {
//
//        let id, name, slug: String?
//       // let children: [Category]?
//        let details, icon: String?
//        //let type: IDEnum
//       // let products: [JSONAny]
//        let createdAt, updatedAt: String?
//        //let v: Int?
//        let image: String?
//        let parent: String?
//
//                  enum CodingKeys: String, CodingKey {
//                      case id = "_id"
//                     case name,slug,details,icon
//
//                      case createdAt, updatedAt
//                      case image,parent
//                  }
//    }
//
//    class PopularShop: Codable, Identifiable {
//        let id: String?
//
//        let name: String?
//        let slug: String?
//        let coverImage: String?
//
//
//
//
//        enum CodingKeys: String, CodingKey {
//            case id = "_id"
//
//            case name, slug
//
//            case coverImage = "cover_image"
//
//
//        }
//    }
//    class Product: Codable, Identifiable {
//        let id: String?
//        let name: String?
//        let ratings: Int?
//        let image: String?
//
//
//
//        enum CodingKeys: String, CodingKey {
//               case id = "_id"
//               case name
//                case ratings
//              case image
//
//           }
//    }
//
//
//
//
//
//
//}


