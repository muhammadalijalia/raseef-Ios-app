//
//  SearchText.swift
//  raseef
//
//  Created by Teamx tec on 07/11/2022.
//

import Foundation
//
//  ContentView.swift
//  MovieSearchApp
//
//  Created by Mohammad Azam on 6/23/21.
//

import SwiftUI

struct SearchText: View {

  //  @StateObject private var movieListVM = MovieListViewModel()
     @StateObject private var shopListVM = ShopListViewModel()
    @State private var searchText: String = ""
    @State private var rating: Int = 3
    var body: some View {
         NavigationView {
              //maybe id change by _id in model
             VStack{
                 Text("Sdas")
                 List(shopListVM.shops, id: \.id) { shop in
                     Section{
                         HStack {
                             let u = URL(string:shop.logo ?? "")
                             AsyncImage(url: u
                                        , content: { image in
                                 image.resizable()
                                     .aspectRatio(contentMode: .fit)
    //                                 .frame(maxWidth: 60)

                             }, placeholder: {
                                 ProgressView()
                             })
                             .frame(width: 100, height: 120, alignment: .center)
                             VStack(alignment:.leading){
                                 Text(shop.name ?? "")
                                     .font(.system(size: 18, weight: .bold, design: .default))
                                 Text(shop.settings?.location?.formattedAddress ?? "")
                                     .lineLimit(4)
                                     .font(.system(size: 10, weight: .light, design: .default))
                                 HStack(spacing:0){
                                     Image(systemName: "mappin.and.ellipse")

                                     Text("1Km")
                                         .font(.system(size: 12, weight: .light, design: .default))
                                 }


                                 HStack{
                                     ForEach(0..<5)
                                     {i in

                                         Image(

                                            systemName: Int((shop.rating ?? 1)) <= i ?"star":"star.fill")
                                         .resizable()
                                         .frame(width: 20,height:20)
                                     }

                                     //            .foregroundColor(rating >= i ? Color.yellow: Color.gray)

                                 }
                             }
                             //.frame(maxWidth:100,maxHeight: 100)

                             .frame(width: 150, height: 70, alignment: .center)

                         }
                         .overlay(

                             Image(systemName: "plus")
                                 .foregroundColor(Color.orange)
                                 .offset(x:170,y:-50)
                         )

                     }
                 }
                 .listStyle(.insetGrouped)
             }
             .onAppear{
                 Task{
                     await
                     shopListVM.search(name: "")
                 }
                
             }

            // .listStyle(.plain)
//                 .searchable(text: $searchText)
//                 .onChange(of: searchText) { value in
//                    Task {
//                         if !value.isEmpty &&  value.count > 0 {
//                             await shopListVM.search(name: value)
//                         } else {
//                              shopListVM.shops.removeAll()
//                         }
//                     }
//                 }

                 .navigationTitle("Shops")
         }
      //  NavigationView {
//            List(movieListVM.movies, id: \.imdbId) { movie in
//                HStack {
//                    AsyncImage(url: movie.poster
//                               , content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: 100)
//                    }, placeholder: {
//                        ProgressView()
//                    })
//                    Text(movie.title)
//                }
//            }.listStyle(.plain)
//                .searchable(text: $searchText)
//                .onChange(of: searchText) { value in
//                   Task {
//                        if !value.isEmpty &&  value.count > 3 {
//                            await movieListVM.search(name: value)
//                        } else {
//                            movieListVM.movies.removeAll()
//                        }
//                    }
//                }
//
//                .navigationTitle("Movies")
//        }
    }
}

struct SearchText_Previews1: PreviewProvider {
    static var previews: some View {
        SearchText()
    }
}
