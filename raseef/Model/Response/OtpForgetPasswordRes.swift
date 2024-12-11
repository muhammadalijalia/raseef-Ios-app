//
//  OtpForgetPasswordRes.swift
//  Multivender
//
//  Created by Teamx tec on 03/10/2022.
//

import Foundation



// MARK: - Welcome
struct OtpForgetPasswordRes: Decodable {
    let token: String?
    let success: Bool?
    let message: String?
  
}
   
