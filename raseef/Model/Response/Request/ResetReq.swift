//
//  ResetReq.swift
//  raseef
//
//  Created by Teamx tec on 01/11/2022.
//



//import Foundation
//import SwiftUI
//class ResetReq: ObservableObject{
//
//    @Published var email = ""
//    @Published var token = ""
//    @Published var reset_new_password  = ""
//    @Published var reset_new_confirm_password  = ""
//}
import Foundation
import SwiftUI
class ResetReq: ObservableObject{
   
    @Published var email = ""
    @Published var token = ""
    @Published var  password  = ""
    @Published var  confirm_password  = ""
}
