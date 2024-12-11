//
//  NotificationViewModel.swift
//  raseef
//
//  Created by Teamx tec on 19/12/2022.
//

import Foundation

class NotificationViewModel: ObservableObject{
    @Published var notifications = [NotificationDocs]()
  
        
    func getNotifications(user_id:String) async {
             do {
                 let response = try await Webservice().getNotifications(user_id:user_id)
                 DispatchQueue.main.async {
                  
                     self.notifications = response.docs ?? []
                 }
               
                 } catch {
                   
                 print(error)
              
             }
         }
        
    

    
}
