//
//  LoginErrorResponse.swift
//  Multivender
//
//  Created by Teamx tec on 29/09/2022.
//

import Foundation
import Foundation

// MARK: - Welcome
struct LoginErrorResponse: Decodable {
    let statusCode: Int?
   
    let message: String?
    let error: String?
}
