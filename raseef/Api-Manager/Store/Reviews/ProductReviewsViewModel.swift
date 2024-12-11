//
//  ProductReviewsViewModel.swift
//  raseef
//
//  Created by Teamx tec on 07/12/2022.
//

import Foundation
import SwiftUI

@MainActor
class ProductReviewsViewModel: ObservableObject {
    
   
    @Published var review_rating: Double = 0.0
        @Published var review_comment: String = ""
        @Published var reviewDate: String = ""

    @Published var product_reciew = [ProductReview]()
    @Published var product_reciew_docs = [ReviewDocs]()
    @Published var ratings : [Double] = []
   func reviews(product_id: String) async {
        do {
            let reviews = try await Webservice().getProductReviews(id: product_id)
            DispatchQueue.main.async { [self] in
                
                self.product_reciew_docs = reviews
                

             
            }
          
            } catch {
              
            print(error)
         
        }
    }
    
}

