//
//  rat.swift
//  raseef
//
//  Created by Teamx tec on 07/12/2022.
//
//
//  rat.swift
//  raseef
//
//  Created by Teamx tec on 07/12/2022.
//

import SwiftUI


struct Api_Rating2_Previews: PreviewProvider {

    static var previews: some View {
        Api_Rating2()

    }
}
struct Api_Rating2: View {
    let ratingsArray: [Double]
    let color: Color
    @State var rating: Double = UserDefaults.standard.double(forKey: "rating")
    
    init(maxRating: Int = 5, starColor: Color = .yellow) {
       
        ratingsArray = Array(stride(from: 0.0, through: Double(max(1, maxRating)), by: 0.5))
        color = starColor
    }
    
    var body: some View {
        VStack(spacing:0) {
            HStack(spacing: 5) {
                ForEach(ratingsArray, id: \.self) { ratingElement in
                    if ratingElement > 0 {
                        if Int(exactly: ratingElement) != nil && ratingElement <= self.rating {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                                .foregroundColor(color)
                               
                        } else if Int(exactly: ratingElement) == nil && ratingElement == self.rating {
                            Image(systemName: "star.leadinghalf.fill")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                                .foregroundColor(color)
                          
                               
                            
                        } else if Int(exactly: ratingElement) != nil && self.rating + 0.5 != ratingElement {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                          
                                .foregroundColor(color)
                             
                        }
                    }
                }
            }
            
            .overlay(
                Slider(value: $rating, in: 0.0...ratingsArray.last!, step: 0.5)
                    .tint(.clear)
                    .opacity(0.1)
            )
        }
        .onAppear {
            rating = Int(exactly: rating) != nil ? rating : Double(Int(rating)) + 0.5
        }
    }
}

import SwiftUI


struct Api_Rating_Previews: PreviewProvider {

    static var previews: some View {
        Api_Rating(rating:  .constant(3))

    }
}
struct Api_Rating: View {
    let ratingsArray: [Double]
    let color: Color
    @Binding var rating: Double
    
    init(rating: Binding<Double>, maxRating: Int = 5, starColor: Color = .yellow) {
        _rating = rating
        ratingsArray = Array(stride(from: 0.0, through: Double(max(1, maxRating)), by: 0.5))
        color = starColor
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                ForEach(ratingsArray, id: \.self) { ratingElement in
                    if ratingElement > 0 {
                        if Int(exactly: ratingElement) != nil && ratingElement <= rating {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                                .foregroundColor(color)
                               
                        } else if Int(exactly: ratingElement) == nil && ratingElement == rating {
                            Image(systemName: "star.leadinghalf.fill")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                                .foregroundColor(color)
                          
                               
                            
                        } else if Int(exactly: ratingElement) != nil && rating + 0.5 != ratingElement {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                          
                                .foregroundColor(color)
                             
                        }
                    }
                }
            }
            
            .overlay(
                Slider(value: $rating, in: 0.0...ratingsArray.last!, step: 0.5)
                    .tint(.clear)
                    .opacity(0.1)
            )
        }
        .onAppear {
            rating = Int(exactly: rating) != nil ? rating : Double(Int(rating)) + 0.5
        }
    }
}
