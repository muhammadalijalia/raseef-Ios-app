//
//  DashboardViewModel.swift
//  Multivender
//
//  Created by apple on 09/10/2022.
//


import Combine
import Foundation
import SwiftUI
//import SwiftUIX
//import AlertToast


class DashboardViewModel: ObservableObject{
    
    @Published var P_Products = [PopularProduct]()
    @Published var P_Shops = [PopularShop]()
 
    func dashboard() async {
         do {
             let dashboard = try await Webservice().getDashboardData()
             DispatchQueue.main.async {
                 
                 self.P_Products = dashboard.popularProducts
                 self.P_Shops = dashboard.popularShops
            
              
             }
           
             } catch {
               
             print(error)
          
         }
     }
    
}
