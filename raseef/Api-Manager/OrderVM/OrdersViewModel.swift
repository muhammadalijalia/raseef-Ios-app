//
//  OrdersViewModel.swift
//  raseef
//
//  Created by Teamx tec on 29/12/2022.
//



import Foundation
class OrdersViewModel: ObservableObject{
    
   @Published var orders = [OrdersDoc]()
    @Published var delieveredDict = [OrdersDoc]()
    
    func Orders() async {
         do {
             let orderd = try await Webservice().getOrders()
             DispatchQueue.main.async {
                 
                // self.orders = orderd
                 var Process = Dictionary(grouping: orderd, by: { ($0.status.name == "Order Processing")})
                 
                 
  
             
               self.orders = Process[true] ?? []
                 var delievered = Dictionary(grouping: orderd, by: { ($0.status.name == "Delivered")})
                 self.delieveredDict = delievered[true] ?? []
                 print(delievered[true])
//                print(self.orders)
//                 for (key, _) in a
//                 {
//                     print(a[key]?.count as Any)
//
//                     if a[key] == "Order Processing" {
//
//
//                     }
//                   //  a[key] = value.sorted(by: { "Order Processing" })
//                 }
//
                 
                     //                 for i in 0..<self.orders.count{
                     //                     if self.orders[i].status.name == "Order Processing"
                     //                     {
                     ////                         print(self.orders[i].id!)
                     ////                         print(self.orders[i].total!)
                     ////
                     ////                         for p in 0..<self.orders[i].products.count
                     ////                         {
                     ////                             print(self.orders[i].products[p].productInfo.name!)
                     ////                             print(self.orders[i].products[p].productInfo.productIDDescription!)
                     ////                             print(self.orders[i].products[p].subtotal!)
                     ////                             print(self.orders[i].products[p].orderQuantity!)
                     ////                         }
                     //
                     //                     }
                     //                     else
                     //                     {
                     //                         print("no response")
                     //                     }
                     //
                     //                 }
                     
                 
             }
           
             } catch {
               
             print(error)
          
         }
     }
    
}
