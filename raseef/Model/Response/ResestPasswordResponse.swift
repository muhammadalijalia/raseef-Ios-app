//
//  ResestPasswordResponse.swift
//  Multivender
//
//  Created by TeamX Pakistan on 02/10/2022.
//

import Foundation

struct ResetPasswordResponse: Decodable{
    
    let statusCode: Int?
    let success: String?
    let message: String?
   
}
