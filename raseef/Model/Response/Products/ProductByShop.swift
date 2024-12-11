//
//  ProductByShop.swift
//  raseef
//
//  Created by Teamx tec on 11/11/2022.
//


import Foundation
import SwiftUI


struct ProductsByShopsID2: Codable ,Identifiable{
    var id: UUID?
    
    let docs: [ProductsCard2]
    let totalDocs, limit, totalPages, page: Int?
   
}

struct ProductsCard2: Codable , Identifiable{
    let id, name, slug: String?
    let productType: String?
 
    let docDescription: String?
   let ratings: Int?
    let gallery: [String]?
    let image: String?
   let price: Int?
   
  enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug//, type
        case productType = "product_type"
       case docDescription = "description"
        case ratings,gallery, image, price
        
    }
}

//
//
//class ProductsByShopsID: Codable, Identifiable{
//
//    var docs: [ProductsCard] = [ProductsCard]()
//    var totalDocs: Int
//
//
//
//    class ProductsCard: Codable, Identifiable {
//        var id : String
//        var name, slug: String
//        var description: String
//        var price: Int
//        var image: String
//
//        enum CodingKeys: String, CodingKey {
//            case id = "_id"
//
//            case name, slug ,description,price,image
//
//        }
//
//
//
//    }
//}



import Foundation

// MARK: - Welcome
struct ProductsByShopsID: Codable {
    let docs: [ProductsCard]
    let totalDocs, limit, totalPages, page: Int?
    let pagingCounter: Int?
    let hasPrevPage, hasNextPage: Bool?
    let prevPage, nextPage: Int?
}

struct ProductsCard: Codable {
    let id, name, slug: String?
   // let type: TypeClass
    let productType: String?
    let productOrderTypes: [String]?
   // let categories, tags: [Category]
    let variations: [Variation]
    let variationOptions: [VariationOption]
    let orders: [String]?
    //let shop: Shop
    let docDescription: String?
    let inStock, isTaxable: Bool?
    let salePrice: Int?
    let ratings: Int?
    let sku: String?
    let gallery: [String]?
    let image: String?
    let status: String?
    let height, length, width: String?
    let price: Int?
    let quantity: Int?
    let unit: String?
   // let ratingCount: [RatingCount]
    let createdAt, updatedAt: String?
    let v: Int?
    let maxPrice, minPrice: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug//, type
        case productType = "product_type"
        case productOrderTypes = "product_order_types"
       // case categories, tags//,
      case  variations
       case variationOptions = "variation_options"
        case orders//, shop
        case docDescription = "description"
        case inStock = "in_stock"
        case isTaxable = "is_taxable"
        case salePrice = "sale_price"//
        case ratings, sku,gallery, image, status, height, length, width, price, quantity, unit
        //case ratingCount = "rating_count"
        case createdAt, updatedAt
        case v = "__v"
        case maxPrice = "max_price"
        case minPrice = "min_price"
    }
}
//// MARK: - Category
//struct Category: Codable {
//    let id, name, slug: String
//    let children: [String]?
//    let details, icon: String
//    let type: TypeEnum
//    let products: [String]?
//    let createdAt, updatedAt: String
//    let v: Int
//    let parent, image: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name, slug, children, details, icon, type, products, createdAt, updatedAt
//        case v = "__v"
//        case parent, image
//    }
//}

//enum TypeEnum: String, Codable {
//    case the6316Fe57Baf027Ab6Bd0101F = "6316fe57baf027ab6bd0101f"
//    case the632026C74B9881136Df7Ca02 = "632026c74b9881136df7ca02"
//}

//// MARK: - RatingCount
//struct RatingCount: Codable {
//    let rating: Int
//    let user: String
//    let positiveFeedbacksCount, negativeFeedbacksCount, abusiveReportsCount: Int
//    let id, createdAt, updatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case rating, user
//        case positiveFeedbacksCount = "positive_feedbacks_count"
//        case negativeFeedbacksCount = "negative_feedbacks_count"
//        case abusiveReportsCount = "abusive_reports_count"
//        case id = "_id"
//        case createdAt, updatedAt
//    }
//}

//// MARK: - Shop
//struct Shops: Codable {
//    let rating: Int
//    let deleted: Bool
//    let id, owner: String
//    let staffs: [String]
//    let isActive: Bool
//    let ordersCount, productsCount: Int
//   // let balance: Balances
//    let name, slug, shopDescription: String
//    let coverImage: String
//    let logo: String
//    /let address: Addresss
//    let settings: ShopSettings
//    let createdAt, updatedAt: String
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case rating, deleted
//        case id = "_id"
//        case owner, staffs
//        case isActive = "is_active"
//        case ordersCount = "orders_count"
//        case productsCount = "products_count"
//        case balance, name, slug
//        case shopDescription = "description"
//        case coverImage = "cover_image"
//        case logo, address, settings, createdAt, updatedAt
//        case v = "__v"
//    }
//}

// MARK: - Address
struct Addresss: Codable {
    let streetAddress, country, city, state: String
    let zip, id: String

    enum CodingKeys: String, CodingKey {
        case streetAddress = "street_address"
        case country, city, state, zip
        case id = "_id"
    }
}

// MARK: - Balance
struct Balances: Codable {
    let totalEarnings, withdrawnAmount, currentBalance: Int
    let paymentInfo: PaymentInfos
    let id: String

    enum CodingKeys: String, CodingKey {
        case totalEarnings = "total_earnings"
        case withdrawnAmount = "withdrawn_amount"
        case currentBalance = "current_balance"
        case paymentInfo = "payment_info"
        case id = "_id"
    }
}

// MARK: - PaymentInfo
struct PaymentInfos: Codable {
    let account, name, email, bank: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case account, name, email, bank
        case id = "_id"
    }
}

// MARK: - ShopSettings
struct ProductSettings: Codable {
    let socials: [String]?
    let contact: String
    let location: Locations
    let website, id: String

    enum CodingKeys: String, CodingKey {
        case socials, contact, location, website
        case id = "_id"
    }
}

// MARK: - Location
struct Locations: Codable {
    let lat, lng: Double
    let coordinates: [Double]
    let type, city, state, country: String
    let zip, formattedAddress, id: String

    enum CodingKeys: String, CodingKey {
        case lat, lng, coordinates, type, city, state, country, zip, formattedAddress
        case id = "_id"
    }
}

//// MARK: - TypeClass
//struct TypeClass: Codable {
//    let settings: TypeSettings
//    let id, name, slug, icon: String
//    let banners: [String]
//    let promotionalSliders: [String]
//    let createdAt, updatedAt: String
//    let v: Int
//
//    enum CodingKeys: String, CodingKey {
//        case settings
//        case id = "_id"
//        case name, slug, icon, banners
//        case promotionalSliders = "promotional_sliders"
//        case createdAt, updatedAt
//        case v = "__v"
//    }
//}

// MARK: - TypeSettings
//struct TypeSettings: Codable {
//    let isHome: Bool
//    let layoutType, productCard: String
//}

// MARK: - VariationOption
struct VariationOption: Codable {
    let title: String
    let price: Int
    let sku: String
    let isDisable: Bool
    let variationImages: [String]
    let quantity: Int
    let options: [Option]
    let id: String
    let createdAt, updatedAt: AtedAt

    enum CodingKeys: String, CodingKey {
        case title, price, sku
        case isDisable = "is_disable"
        case variationImages = "variation_images"
        case quantity, options
        case id = "_id"
        case createdAt, updatedAt
    }
}

enum AtedAt: String, Codable {
    case the20221014T084147518Z = "2022-10-14T08:41:47.518Z"
    case the20221014T084321405Z = "2022-10-14T08:43:21.405Z"
    case the20221014T084347762Z = "2022-10-14T08:43:47.762Z"
    case the20221014T084410548Z = "2022-10-14T08:44:10.548Z"
    case the20221025T070332937Z = "2022-10-25T07:03:32.937Z"
}

// MARK: - Option
struct Option: Codable {
    let name: Name
    let value, id: String
    let createdAt, updatedAt: AtedAt

    enum CodingKeys: String, CodingKey {
        case name, value
        case id = "_id"
        case createdAt, updatedAt
    }
}

enum Name: String, Codable {
    case color = "Color"
    case size = "Size"
    case testAttribute = "Test Attribute"
}

// MARK: - Variation
struct Variation: Codable {
    let id, value, meta: String
    let attribute: Attribute
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case value, meta, attribute, createdAt, updatedAt
        case v = "__v"
    }
}

enum Attribute: String, Codable {
    case the6317034Dbaf027Ab6Bd01669 = "6317034dbaf027ab6bd01669"
    case the6347D57B183E779053C0Faf6 = "6347d57b183e779053c0faf6"
}


