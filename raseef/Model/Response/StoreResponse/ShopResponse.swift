//
//  ShopResponse.swift
//  raseef
//
//  Created by Teamx tec on 07/11/2022.
//

import Foundation
//
//  ShopsRequest.swift
//  raseef
//
//  Created by Teamx tec on 03/11/2022.
//

import Foundation
import SwiftUI

// Run for both zues and teamx
struct ShopResponse: Codable {
    let docs: [ShopDocs]?
    let totalDocs, limit, page, totalPages: Int?
    let hasNextPage,hasPrevPage: Bool?
    let prevPage,nextPage: Int?
   
}

// MARK: - Doc
struct ShopDocs: Codable {
    let id: String?
    let name, slug, docDescription: String?
    let coverImage: String?
    let rating: Double?
    let logo: String?

    let settings: ShopSettings?
  

    enum CodingKeys: String, CodingKey {
        case id = "_id"
     
        case name, slug
        case docDescription = "description"
        case coverImage = "cover_image"
        case rating, logo, settings
       
    }
}


// MARK: - Settings
struct ShopSettings: Codable {
   
    
    let location: ShopLocation?
   
    let id: String?

    enum CodingKeys: String, CodingKey {
        case   location
        case id = "_id"
    }
}

// MARK: - Location
struct ShopLocation: Codable {
   
    let formattedAddress, id: String?
    let zip: String?

    enum CodingKeys: String, CodingKey {
        case formattedAddress
        case id = "_id"
        case zip
    }
}


// Not work for zues
//class ShopResponse: Codable, Identifiable{
//
//    var docs: [Docs] = [Docs]()
//    var totalDocs: Int
//
//
//
//    class Docs: Codable, Identifiable {
//        var id : String
//        var name, slug: String
//        var coverImage: String
//        var logo: String
//        var settings: Setting
//
//
//        let ratingsCount, rating: Int
//
//        enum CodingKeys: String, CodingKey {
//            case id = "_id"
//           case name, slug
//          case coverImage = "cover_image"
//            case logo,settings
//          case ratingsCount = "ratings_count"
//            case rating
//        }
//        class Setting: Codable, Identifiable{
//
//
//            var location: Locations
//
//            enum CodingKeys: String, CodingKey {
//                case location
//
//            }
//
//            class Locations: Codable , Identifiable{
//
//                var formattedAddress: String
//
//
//                enum CodingKeys: String, CodingKey {
//                    case formattedAddress
//
//
//                }
//
//            }
//
//        }
//
//    }
//}







