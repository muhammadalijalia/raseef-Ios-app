//
//  RegisterphoneResponse.swift
//  Multivender
//
//  Created by Teamx tec on 30/09/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RegisterphoneResponse: Codable {
    let message: String
    let success: Bool
    let id, provider, phoneNumber: String
    let twilio: Twilio

    enum CodingKeys: String, CodingKey {
        case message, success, id, provider
        case phoneNumber = "phone_number"
        case twilio
    }
}

// MARK: - Twilio
struct Twilio: Codable {
    let sid, serviceSid, accountSid, to: String
    let channel, status: String
    let valid: Bool
   // let lookup: Lookup
    let amount, payee: JSONNull?
   // let sendCodeAttempts: [SendCodeAttempt]
    let dateCreated, dateUpdated: String
    let url: String
}

