//
//  Extension.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 03/07/2022.
//

import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

class Extensions: ObservableObject{
    
    func timeAgo(time:String) -> String{
        //let string = product_reviewVm.reviewDate ?? "2022-12-05T07:07:15.933Z"
        let string = time
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        // the date you want to format
        let exampleDate = formatter2.date(from: string)
        
        // ask for the full relative date
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        // get exampleDate relative to the current date
        let relativeDate = formatter.localizedString(for: exampleDate!, relativeTo: Date.now)
        
        // print it out
        print("Relative date is: \(relativeDate)")
        return relativeDate
    }
    
    let shared = UserDefaults.standard
    
   
    
}
