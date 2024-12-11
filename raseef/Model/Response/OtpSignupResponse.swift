//
//  OtpSignupResponse.swift
//  raseef
//
//  Created by Teamx tec on 02/11/2022.
//

import Foundation
import Foundation

// MARK: - Welcome
struct OtpSignupResponse: Decodable {
    let token: String
    let user: newuser
    //let permissions: [String]
}

// MARK: - User
struct newuser: Codable {
    let id, name, password: String
   // let shops: [JSONAny]
    let isActive: Bool
    let contact: String
    let emailVerified, contactVerified: Bool
    let roles: [String]
  //  let address: [JSONAny]
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, password
        case isActive = "is_active"
        case contact
        case emailVerified = "email_verified"
        case contactVerified = "contact_verified"
        case roles, createdAt, updatedAt
        case v = "__v"
    }
}
