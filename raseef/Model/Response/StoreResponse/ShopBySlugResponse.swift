//
//  ShopBySlugResponse.swift
//  raseef
//
//  Created by Teamx tec on 08/11/2022.
//


import Foundation
import SwiftUI


struct ShopBySlug: Codable , Identifiable{
    var id: String?
    //welcomeDescription
    var name, slug: String?
    var coverImage: String?
    var logo: String?
    var address: ShopAddress
    var rating: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
        //case welcomeDescription = "description"
        case coverImage = "cover_image"
        case logo, address
    
       
        case rating
    }
}

// MARK: - Address
struct ShopAddress: Codable ,Identifiable{
    var streetAddress: String?
    var id: String?

    enum CodingKeys: String, CodingKey {
        case streetAddress = "street_address"
        
        case id = "_id"
    }
}


//
//
//// change to struct
//class ShopBySlug: Codable, Identifiable{
//
//    var id, owner: String?
//
//    //var isActive: Bool?
//   // var ordersCount, productsCount: Int?
//   // var balance: Balance
//    var name, slug, welcomeDescription: String?
//    var coverImage: String?
//    var logo: String?
//    var address: Address
//  //  var settings: Set
//    var createdAt, updatedAt: String?
//   // var v: Int?
//
//   // var reviews: [Review] = [Review]()
//    var ratingsCount, rating: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case owner
//      //  case isActive = "is_active"
//       // case ordersCount = "orders_count"
//       // case productsCount = "products_count"
//        //case balance,, settings
//        case name, slug
//        case welcomeDescription = "description"
//        case coverImage = "cover_image"
//        case logo, address, createdAt, updatedAt
//      //  case v = "__v"
//       // case reviews
//        case ratingsCount = "ratings_count"
//        case rating
//
//    }
//
//    class Address: Codable, Identifiable {
//        var streetAddress, country, city, state: String?
//        var zip, id: String?
//
//        enum CodingKeys: String, CodingKey {
//            case streetAddress = "street_address"
//            case country, city, state, zip
//            case id = "_id"
//        }
//    }
//    class Balance: Codable, Identifiable{
//
//
//        var totalEarnings, withdrawnAmount, currentBalance: Int?
//        var paymentInfo: PaymentInfo
//        var id: String?
//
//        enum CodingKeys: String, CodingKey {
//            case totalEarnings = "total_earnings"
//            case withdrawnAmount = "withdrawn_amount"
//            case currentBalance = "current_balance"
//            case paymentInfo = "payment_info"
//            case id = "_id"
//        }
//
//        class PaymentInfo: Codable, Identifiable {
//            var account, name, email, bank: String?
//            var id: String?
//
//            enum CodingKeys: String, CodingKey {
//                case account, name, email, bank
//                case id = "_id"
//            }
//
//        }
//    }
//    class Set: Codable, Identifiable{
//        //  var socials: [JSONAny]
//        var contact: String? = nil
//        var location: Location
//        var website, id: String?
//
//        enum CodingKeys: String, CodingKey {
//            case contact, location, website
//            case id = "_id"
//        }
//
//
//        // MARK: - Location
//        struct Location: Codable, Identifiable {
//            var lat, lng: Double
//            var coordinates: [Double]
//            var type, city, state, country: String
//            var formattedAddress, id: String
//
//            enum CodingKeys: String, CodingKey {
//                case lat, lng, coordinates, type, city, state, country, formattedAddress
//                case id = "_id"
//            }
//        }
//    }
//    class Review: Codable , Identifiable{
//            var id, user, shop, product: String?
//            var comment: String?
//            // var photos: [JSONAny]
//            var positiveFeedbacksCount, rating, negativeFeedbacksCount, abusiveReportsCount: Int?
//            // var feedbacks: [JSONAny]
//            var createdAt, updatedAt: String?
//            var v: Int?
//
//            enum CodingKeys: String, CodingKey {
//                case id = "_id"
//                case user, shop, product, comment
//                case positiveFeedbacksCount = "positive_feedbacks_count"
//                case rating
//                case negativeFeedbacksCount = "negative_feedbacks_count"
//                case abusiveReportsCount = "abusive_reports_count"
//                case createdAt, updatedAt
//                case v = "__v"
//            }
//        }

          
  

            
   //     }
        
    









