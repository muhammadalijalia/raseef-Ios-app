//
//  NotificationResponse.swift
//  raseef
//
//  Created by Teamx tec on 19/12/2022.
//

import Foundation

// MARK: - Welcome
struct NotificationResponse: Codable  {
    //var id: UUID()
    
    let docs: [NotificationDocs]?
    let totalDocs, limit, totalPages, page: Int?
    let pagingCounter: Int?
    let hasPrevPage, hasNextPage: Bool?
    //let prevPage, nextPage: JSONNull?
}

// MARK: - Doc
struct NotificationDocs: Codable , Identifiable {
    let id, title, docDescription, user: String?
    let unread: Bool?
    let orderID, notificationType, createdAt, updatedAt: String?
   // let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case docDescription = "description"
        case user, unread
        case orderID = "order_id"
        case notificationType = "notification_type"
        case createdAt, updatedAt
       // case v = "__v"
    }
}
