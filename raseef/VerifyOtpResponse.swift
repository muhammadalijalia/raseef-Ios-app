//
//  VerifyOtpResponse.swift
//  Multivender
//
//  Created by Teamx tec on 03/10/2022.
//
import Foundation

// MARK: - Welcome
struct VerifyOtpResponse: Codable {
    let message: String?
    let success: Bool?
    let profile: WelcomeProfile
}

// MARK: - WelcomeProfile
struct WelcomeProfile: Codable {
    let emailVerified: Bool?
    let id, name, email, password: String?
    //let shops: []
    let isActive: Bool?
    let roles, address: [String]?
    let createdAt, updatedAt: String?
    let v: Int
    //let profile: ProfileProfile
    let contact: String?

    enum CodingKeys: String, CodingKey {
        case emailVerified = "email_verified"
        case id = "_id"
        case name, email, password
        case isActive = "is_active"
        case roles, address, createdAt, updatedAt
        case v = "__v"
        case contact
    }
}



