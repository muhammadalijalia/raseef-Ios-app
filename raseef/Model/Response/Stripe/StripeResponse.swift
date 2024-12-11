//
//  StripeResponse.swift
//  raseef
//
//  Created by Teamx tec on 22/12/2022.
//

import Foundation
// MARK: - Welcome
struct StripeError: Codable {
    let error: Errors
}

// MARK: - Error
struct Errors: Codable {
    let code: String?
    let docURL: String?
    let message, param: String?
    let requestLogURL: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case code
        case docURL = "doc_url"
        case message, param
        case requestLogURL = "request_log_url"
        case type
    }
}


// MARK: - Welcome
struct StripeResponse: Codable {
    let id, object: String?
    let billingDetails: BillingDetails?
    let card: Card?
    let created: Int?
   // let customer: JSONNull?
    let livemode: Bool?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, object
        case billingDetails = "billing_details"
        case card, created, livemode, type
        //customer
    }
}

// MARK: - BillingDetails
struct BillingDetails: Codable {
    let address: BillingAddress?
    let email, name, phone: String?
}

// MARK: - Address
struct BillingAddress: Codable {
    let city, country, line1, line2: String?
    //let postalCode, state: JSONNull?

    enum CodingKeys: String, CodingKey {
        case city, country, line1, line2
       // case postalCode = "postal_code"
        //case state
    }
}

// MARK: - Card
struct Card: Codable {
    let brand: String?
  //  let checks: Checks
    let country: String?
    let expMonth, expYear: Int?
    let funding: String?
   // let generatedFrom: JSONNull?
    let last4: String?
  //  let networks: Networks
    //let threeDSecureUsage: ThreeDSecureUsage
//    let wallet: JSONNull?

    enum CodingKeys: String, CodingKey {
        case brand, country //checks
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case funding
        //case generatedFrom = "generated_from"
        case last4//, networks
       // case threeDSecureUsage = "three_d_secure_usage"
       // case wallet
    }
}


