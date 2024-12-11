////
////  Rating.swift
////  raseef
////
////  Created by Teamx tec on 18/11/2022.
////
//
//import SwiftUI
//
//struct Rating: View {
//    @Binding var rating: Int?
//    private func startType(index: Int) -> String
//    {
//
//        if let rating = self.rating{
//            return index <= rating ? "star.fill":"star"
//        }else
//        {
//            return "star"
//        }
//    }
//    var body: some View {
//
//        ForEach(1...5, id : \.self)
//            {
//
//                index in
//
//                Image(systemName: self.startType(index: index))
////                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(Color.orange)
//                    .onTapGesture {
//                        self.rating = index
//                    }
//            }
//        }
//
//}
//
//struct Rating_Previews1: PreviewProvider {
//    static var previews: some View {
//        Rating(rating: .constant(3))
//    }
//}
//
//struct fullStar : View {
//    var body: some View {
//        Image(systemName: "star.fill")
//            .resizable()
//            .renderingMode(.template)
//            .foregroundColor(.yellow)
//          
//            .frame(width: 15, height: 15)
//          
//    }
//}
//
//struct halfStar: View {
//    var body: some View {
//        Image(systemName: "star.leadinghalf.fill")
//            .resizable()
//            .renderingMode(.template)
//            .foregroundColor(.yellow)
//          
//            .frame(width: 15, height: 15)
//        //.star(size: starSize)
//    }
//}
//
//struct emptyStar:  View {
//    var body: some View {
//        Image(systemName: "star")
//            .resizable()
//            .renderingMode(.template)
//            .foregroundColor(.yellow)
//          
//            .frame(width: 15, height: 15)
//        //  .star(size: starSize)
//    }
//}
//struct RatingView_Api: View {
//    init(_ rating: Binding<Double>, maxRating: Int = 4) {
//        _rating = rating
//        self.maxRating = maxRating
//    }
//
//    let maxRating: Int
//    @Binding var rating: Double
//    @State private var starSize: CGSize = .zero
//    @State private var controlSize: CGSize = .zero
//    @GestureState private var dragging: Bool = false
//
//    var body: some View {
//        ZStack {
//            HStack {
//                ForEach(0..<Int(rating), id: \.self) { idx in
//                    fullStar()
//                }
//
//                if (rating != floor(rating)) {
//                    halfStar()
//                }
//                ForEach(Array(stride(from: 0, through: (Int(Double(maxRating) - rating)), by: 1))
//        , id: \.self)   { idx in
//              //  ForEach(0..<Int(Double(maxRating) - rating), id: \.self)
//                
//             
//                    emptyStar()
//                }
//            }
//            .background(
//                GeometryReader { proxy in
//                    Color.clear.preference(key: ControlSizeKey.self, value: proxy.size)
//                }
//            )
//            .onPreferenceChange(StarSizeKey.self) { size in
//                starSize = size
//            }
//            .onPreferenceChange(ControlSizeKey.self) { size in
//                controlSize = size
//            }
//
//            Color.clear
//                .frame(width: controlSize.width, height: controlSize.height)
//                .contentShape(Rectangle())
//                .gesture(
//                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                        .onChanged { value in
//                            rating = rating(at: value.location)
//                        }
//                )
//        }
//    }
//
//  
//
////    public var fullStar: some View {
////        Image(systemName: "star.fill")
////            .resizable()
////            .frame(width: 30, height: 30)
////            .renderingMode(.template)
////            .foregroundColor(.yellow)
////
////            //.star(size: starSize)
////
////    }
//
//
//
//    private func rating(at position: CGPoint) -> Double {
//        let singleStarWidth = starSize.width
//        let totalPaddingWidth = controlSize.width - CGFloat(maxRating)*singleStarWidth
//        let singlePaddingWidth = totalPaddingWidth / (CGFloat(maxRating) - 1)
//        let starWithSpaceWidth = Double(singleStarWidth + singlePaddingWidth)
//        let x = Double(position.x)
//
//        let starIdx = Int(x / starWithSpaceWidth)
//        let starPercent = x.truncatingRemainder(dividingBy: starWithSpaceWidth) / Double(singleStarWidth) * 100
//
//        let rating: Double
//        if starPercent < 25 {
//            rating = Double(starIdx)
//        } else if starPercent <= 75 {
//            rating = Double(starIdx) + 0.5
//        } else {
//            rating = Double(starIdx) + 1
//        }
//
//        return min(Double(maxRating), max(0, rating))
//    }
//}
//
//fileprivate extension Image {
//    func star(size: CGSize) -> some View {
//        return self
//            .font(.title)
//            .background(
//                GeometryReader { proxy in
//                    Color.clear.preference(key: StarSizeKey.self, value: proxy.size)
//                }
//            )
//            .frame(width: size.width, height: size.height)
//    }
//}
//
//fileprivate protocol SizeKey: PreferenceKey { }
//fileprivate extension SizeKey {
//    static var defaultValue: CGSize { .zero }
//    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
//        let next = nextValue()
//        value = CGSize(width: max(value.width, next.width), height: max(value.height, next.height))
//    }
//}
//
//fileprivate struct StarSizeKey: SizeKey { }
//fileprivate struct ControlSizeKey: SizeKey { }
//
////struct Rating_Previews1: PreviewProvider {
////    static var previews: some View {
////       // Rating(rating: .constant(3))
////        //Rating_api_response(rating: .constant(1))
////        RatingView_Api(.constant(1), maxRating: 4)
////
////    }
////}
