//
//  ShopListViewModel.swift
//  raseef
//
//  Created by Teamx tec on 07/11/2022.
//


import Foundation
import SwiftUI

@MainActor
class ShopListViewModel: ObservableObject {
    
    //teamx working
    @Published  var showSheet = false
//    @Published var Docs : [ShopResponse] = []
//    @Published var shops: [ShopResponse.Docs] = []
    ///
     @Published var shops = [ShopDocs]()
    //@Published  var nextpage = 1
    //@Published var hasNextpage = UserDefaults.standard.bool(forKey:"hasNextPage")
    @ObservedObject var wb = Webservice()
    
    @Published var HasNext = false
    
    @Published var pagNo : Int? =  1
    @Published var membersListFull =  false
    func search(name: String) async {
        do {
            
            UserDefaults.standard.removeObject(forKey: "shopResponse?.totalDocs")
            UserDefaults.standard.removeObject(forKey: "shopResponse?.hasNextPage")
            let shop = try await Webservice().getShops(searchTerm: name,pgNo: pagNo!)
             //po shop[0].settings.location.formattedAddress
            self.shops.append(contentsOf: shop)
          
          
            self.HasNext = UserDefaults.standard.bool(forKey: "shopResponse?.hasNextPage")
            
            if HasNext{
                self.pagNo! += 1
            }
         
//            print(self.shops.count)
//           let totalDocs = UserDefaults.standard.integer(forKey: "shopResponse?.totalDocs")
//            print(totalDocs)
          
//            if self.shops.count == totalDocs
//            {
//                self.membersListFull = true
//                print(self.membersListFull)
//
//            }
//            else
//            {
//                self.pagNo = self.pagNo! + 1;
//                print(self.pagNo)
//            }
       self.showSheet = true
     
             
        } catch {
            print(error)
            self.shops = []
        }
    }
  
}

