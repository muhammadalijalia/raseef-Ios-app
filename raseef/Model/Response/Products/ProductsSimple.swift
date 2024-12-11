//
//  ProductsSimple.swift
//  raseef
//
//  Created by Teamx tec on 06/12/2022.
//

import Foundation


// MARK: - Welcome
struct ProductsSimple: Codable {
    let id, name, slug: String?
    //let type: TypeClass
    let productType: String?
    let productOrderTypes: [String]?
  //  let categories: [Category]
   // let tags: [JSONAny]
   
  //  let orders: [JSONAny]
 //   let shop: Shop
let welcomeDescription: String?
   // let inStock, isTaxable: Bool
    let ratings: Int?
   // let ratings, maxPrice, minPrice: Int
   // let gallery: [String]
   let image: String?
    let price : Int?
   // let status: String
   // let quantity: Int
  //  let unit: String
  //  let ratingCount: [JSONAny]
  //  let createdAt, updatedAt: String
   // let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug//, type
        case productType = "product_type"
        case productOrderTypes = "product_order_types"
       // case categories, tags,
      
       // case orders, shop
     case welcomeDescription = "description"
       // case inStock = "in_stock"
      //  case isTaxable = "is_taxable"
       case ratings
      //  case maxPrice = "max_price"
      //  case minPrice = "min_price"
        case image
        case price
      //  case gallery, image, status, quantity, unit
      //  case ratingCount = "rating_count"
     //   case createdAt, updatedAt
     //   case v = "__v"
    }
}
