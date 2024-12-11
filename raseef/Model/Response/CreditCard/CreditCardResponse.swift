//
//  CreditCardResponse.swift
//  raseef
//
//  Created by Teamx tec on 23/12/2022.
//

import Foundation


// MARK: - Welcome
struct CreditCardResponse: Codable {
    let object: String?
    let data: [Datum]?
    let hasMore: Bool?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case object, data
        case hasMore = "has_more"
        case url
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id, object: String?
    let billingDetails: CC_BillingDetails?
    let card: CC_Card?
    let created: Int?
    let customer: String?
    let livemode: Bool?
    //let metadata: Metadata?
    let type: String?
    var ChkVariable : Bool?
    enum CodingKeys: String, CodingKey {
        case id, object
        case billingDetails = "billing_details"
        case card, created, customer, livemode, type ,ChkVariable
       // metadata
    }
}

// MARK: - BillingDetails
struct CC_BillingDetails: Codable {
    let address: CC_Address?
    let email, name, phone: String?
}

// MARK: - Address
struct CC_Address: Codable {
    let city, country, line1, line2: String?
    let postalCode, state: String?

    enum CodingKeys: String, CodingKey {
        case city, country, line1, line2
        case postalCode = "postal_code"
        case state
    }
}

// MARK: - Card
struct CC_Card: Codable {
    let brand: String?
    let checks: Checks?
    let country: String?
    let expMonth, expYear: Int?
    let fingerprint, funding: String?
    let generatedFrom: String?
    let last4: String?
    let networks: Networks?
    let threeDSecureUsage: ThreeDSecureUsage?
    let wallet: String?

    enum CodingKeys: String, CodingKey {
        case brand, checks, country
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case fingerprint, funding
        case generatedFrom = "generated_from"
        case last4, networks
        case threeDSecureUsage = "three_d_secure_usage"
        case wallet
    }
}

// MARK: - Checks
struct Checks: Codable {
    let addressLine1Check, addressPostalCodeCheck: String?
    let cvcCheck: String?

    enum CodingKeys: String, CodingKey {
        case addressLine1Check = "address_line1_check"
        case addressPostalCodeCheck = "address_postal_code_check"
        case cvcCheck = "cvc_check"
    }
}

// MARK: - Networks
struct Networks: Codable {
    let available: [String]?
    let preferred: String?
}

// MARK: - ThreeDSecureUsage
struct ThreeDSecureUsage: Codable {
    let supported: Bool?
}


