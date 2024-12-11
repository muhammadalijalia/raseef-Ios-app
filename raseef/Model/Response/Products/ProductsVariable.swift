// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ProductsVariable: Codable {
    let id, name, slug: String?
    //let type: TypeClass
    let productType: String?
   // let productOrderTypes: [String]
  //  let categories: [Category]
   // let tags: [JSONAny]
    let variations: [Variations]?
    let variationOptions: [VariationOptions]?
  //  let orders: [JSONAny]
 //   let shop: Shop
    //let welcomeDescription: String
   // let inStock, isTaxable: Bool
   // let ratings, maxPrice, minPrice: Int
   // let gallery: [String]
   // let image: String
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
        //case productOrderTypes = "product_order_types"
       // case categories, tags,
        case variations
        case variationOptions = "variation_options"
       // case orders, shop
      ////  case welcomeDescription = "description"
       // case inStock = "in_stock"
      //  case isTaxable = "is_taxable"
      //  case ratings
      //  case maxPrice = "max_price"
      //  case minPrice = "min_price"
      //  case gallery, image, status, quantity, unit
      //  case ratingCount = "rating_count"
     //   case createdAt, updatedAt
     //   case v = "__v"
    }
}


// MARK: - VariationOption
struct VariationOptions: Codable {
    let title: String?
    let price: Int?
    let sku: String?
    let isDisable: Bool?
    let variationImages: [String]?
    let quantity: Int?
    let options: [Options]?
    let id, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case title, price, sku
        case isDisable = "is_disable"
        case variationImages = "variation_images"
        case quantity, options
        case id = "_id"
        case createdAt, updatedAt
    }
}

// MARK: - Option
struct Options: Codable {
    let name, value, id, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case name, value
        case id = "_id"
        case createdAt, updatedAt
    }
}

// MARK: - Variation
struct Variations: Codable {
   // , meta
    var id, value: String?
    var attribute: Attributes?
   // var createdAt, updatedAt: String?
   // var v: Int?
    var check: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case value, attribute//, meta, createdAt, updatedAt
       // case v = "__v"
        case check
    }
}

// MARK: - Attribute
struct Attributes: Codable {
    //, shop , name
    let id, slug: String?
   // let values: [String]?
    //let createdAt, updatedAt: String?
    //let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug//, values//, shop,createdAt,name, updatedAt
        //case v = "__v"
    }
}

