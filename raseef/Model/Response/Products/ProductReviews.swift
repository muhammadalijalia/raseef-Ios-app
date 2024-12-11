//
//  ProductReviews.swift
//  raseef
//
//  Created by Teamx tec on 07/12/2022.
//




import Foundation

// MARK: - Welcome
struct ProductReview: Codable {
    let docs: [ReviewDocs]?
    let totalDocs, limit, totalPages, page: Int?
    let pagingCounter: Int?
    let hasPrevPage, hasNextPage: Bool?
   // let prevPage, nextPage: JSONNull?
}

// MARK: - Doc
struct ReviewDocs: Codable {
    let id: String?
    let user: Users

    var comment: String?
    let photos: [String]?
    var rating: Double
    let positiveFeedbacksCount, negativeFeedbacksCount, abusiveReportsCount: Int?
   // let feedbacks: [JSONAny]
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user//, shop, product,
        case comment, photos
        case positiveFeedbacksCount = "positive_feedbacks_count"
        case rating
        case negativeFeedbacksCount = "negative_feedbacks_count"
        case abusiveReportsCount = "abusive_reports_count"
       // case feedbacks,
        case createdAt, updatedAt
        case v = "__v"
    }
}



// MARK: - User
struct Users: Codable {
    var id, name, email: String?
  //  let shops: [JSONAny]
  
   
   // let profile: Profile

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email
      
        
        
    }
}

