//
//  GetAllOrders.swift
//  raseef
//
//  Created by Teamx tec on 29/12/2022.
//

import Foundation


// MARK: - Welcome
struct GetAllOrders: Codable {
    //var id: UUID
    
    let docs: [OrdersDoc]
    let totalDocs, limit, totalPages, page: Int?
    let pagingCounter: Int?
    let hasPrevPage, hasNextPage: Bool?
    
}

// MARK: - Doc
struct OrdersDoc: Codable , Identifiable  {
    let usedPoints: Int?
    let id: String?
    let status: StatusClass
    let amount, salesTax, paidTotal: Int?
    let total : Double?
    let deliveryFee: Int?
    let userRiding: Bool?
    let products: [ProductDetail]
    enum CodingKeys: String, CodingKey {
        case usedPoints = "used_points"
        case id = "_id"
       
        case status, amount
        case salesTax = "sales_tax"
        case total
        case paidTotal = "paid_total"
        case deliveryFee = "delivery_fee"
        case userRiding = "user_riding"
        case products
      
    }
}


// MARK: - Product
struct ProductDetail: Codable , Identifiable {
    let id: String?
    let productInfo: ProductID
   
    let orderQuantity, unitPrice, subtotal: Int?
   

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productInfo = "product_id"
        
        case orderQuantity = "order_quantity"
        case unitPrice = "unit_price"
        case subtotal
    }
}

// MARK: - ProductID
struct ProductID: Codable , Identifiable  {
    let id, name, slug: String?
    let productIDDescription: String?
    let ratings: Int?
    let image: String?
    let status: String?
    let price, quantity: Int?
   enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
      
        case productIDDescription = "description"
       
        case ratings, image, status, price, quantity

       
    }
}

// MARK: - StatusClass
struct StatusClass: Codable , Identifiable  {
    let id, name: String?
    let color: String?
    let serial: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, color, serial
       
    }
}




