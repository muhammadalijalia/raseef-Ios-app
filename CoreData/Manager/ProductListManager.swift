//
//  ProductListManager.swift
//  raseef
//
//  Created by Teamx tec on 17/12/2022.
//

import Foundation


import Foundation


import CoreData
class ProductListManager :ObservableObject{
    static let shared = ProductListManager()
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    init() {
        self.persistentContainer = NSPersistentContainer(name: "ProductCard")
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func updateList() {
        
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
        }
        
    }



    
     func deleteList(productlist: MyProductCardList) {
        
         viewContext.delete(productlist)
        
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }
    func resetAllCoreData() {

         // get all entities and loop over them
         let entityNames = self.persistentContainer.managedObjectModel.entities.map({ $0.name!})
         entityNames.forEach { [weak self] entityName in
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

            do {
                try self?.persistentContainer.viewContext.execute(deleteRequest)
                try self?.persistentContainer.viewContext.save()
            } catch {
                // error
            }
        }
    }
    func getAllList() -> [MyProductCardList] {
        
        let fetchRequest: NSFetchRequest<MyProductCardList> = MyProductCardList.fetchRequest()
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func saveList(listPaymentOption:[String],listId:String,listname: String,listdesc:String,listprice:Int32,listimage:String,listInc_Desc:Int32) {
        
        let list = MyProductCardList(context: persistentContainer.viewContext)
        list.paymentOptions = listPaymentOption 
        list.id = listId
        list.name = listname
        list.detail = listdesc
        list.price = listprice
        list.image = listimage
        list.no_of_orders = listInc_Desc
        print(list)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
        
    }
    
}
