////
////  Grid2.swift
////  raseef
////
////  Created by Teamx tec on 08/11/2022.
////
//
//import SwiftUI
//
//struct Grid2: View {
//    let data = (1...100).map { "Item \($0)" }
//
//      let columns = [
//          GridItem(.adaptive(minimum: 150))
//      ]
//    let column: [GridItem] =
//                 Array(repeating: .init(.flexible()), count: 2)
//    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
//    @State var rating = 2
//    var body: some View {
//        GeometryReader{ geo in
//        ScrollView {
//            LazyVGrid(columns: gridItemLayout, spacing: 20) {
//                ForEach(0..<5) { shop in
//               
//                       // HStack(spacing:15){
//                          
//                        VStack(){
//                            
//                            Button{
//                                
//                            //    self.pushtoStore.toggle()
//                            }label:{
//                            
//                                Image(icon: .icecreamShop)
//                                 .resizable()
//                                .frame(width: 128, height: 120)
//                                
//                            }
//                            
//                            .overlay {
//                                Image(icon: .plus_with_orange)
//                                    .resizable()
//                                    .frame(width: 15, height: 15)
//                                    .offset(x:50,y:-50)
//                            }
//                            VStack(alignment: .leading){
//                            HStack(spacing:10){
//                                
//                                
//                                Text("shop.name")
//                                    .font(.system(size:13))
//                                //                                                                .padding(.leading,5)
//                                
//                              
//                                (Text(Image(icon: .location_pin)) + Text("1Km"))
//                                    .font(.system(size:10))
//                                
//                            }
//                            Text("shop.settings.location.formattedAddress")
//                                .font(.system(size:10))
//                                .lineLimit(3)
//                            //   .padding(.leading,10)
//                                .frame(width:110)
//                                HStack(spacing:2){
//                                ForEach(0..<5)
//                                {i in
//                                    
//                                    Image(
//                                        
//                                        systemName: rating <= i ?"star":"star.fill")
//                                    .resizable()
//                                    .frame(width: 8,height:8)
//                                }
//                                
//                                
//                            }
//                        }
//                            }
//                            .frame(width: 160, height: 220)
//                            .background(Color.white)
//                            .padding(.horizontal,5)
//
//                    //}
//                
//                
//           
//            }
//                
//            }
//            
//        }
//       
//        .padding(.top,0)
//        .frame(width: geo.size.width, height: geo.size.height )
//        }
//    }
//}
//
//struct Grid2_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid2()
//    }
//}
