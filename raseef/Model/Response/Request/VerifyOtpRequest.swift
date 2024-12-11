//
//  VerifyOtpRequest.swift
//  Multivender
//
//  Created by Teamx tec on 03/10/2022.
//

import Foundation
import SwiftUI
class VerifyotpRequest: ObservableObject{
   
    @Published var phone_number = ""
    @Published var code = ""
    @Published var otp_id  = ""
    @Published var sid  = ""
}

