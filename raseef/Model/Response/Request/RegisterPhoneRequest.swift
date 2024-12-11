//
//  RegisterPhoneRequest.swift
//  Multivender
//
//  Created by Teamx tec on 30/09/2022.
//

import Foundation
import SwiftUI
class RegisterPhoneRequest: ObservableObject{
    @Published var name = ""
    @Published var contact = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isAgreementSigned : Bool = false

}
