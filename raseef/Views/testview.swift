////
////  testview.swift
////  raseef
////
////  Created by Teamx tec on 25/10/2022.
////
//
//import SwiftUI
//class Cart: ObservableObject {
//   @Published var cartItems: [CartItem]
//   init() {
//      self.cartItems = []
//}}
//struct CartItem: Identifiable {
//   var id: String
// //  var product: Product
//   var count: Int
//init(count: Int) {
//   self.id = UUID().uuidString
//  // self.product = product
//   self.count = count
//}}
//
//struct testview: View {
//    @ObservedObject var cart: Cart
//    enum Tab {
//        case no
//       case home
//       case profile
//       case shop
//        case notification
//    }
//    @State private var selection: Tab = .no
//    var body: some View {
//       TabView(selection: $selection) {
//    YourLocation().tabItem {
//           Label("Home", systemImage: "house")}.tag(Tab.home)
//           Text("dsdasda").tabItem { Label("Profile", systemImage: "person")}.tag(Tab.profile)
//           Text("daasd").tabItem { Label("Shop", systemImage: "bag")}.tag(Tab.shop)
//           Text("daasd").tabItem { Label("Notification", systemImage: "bell")}.tag(Tab.notification)
//    }
//       .padding(.bottom,10)
//       .environmentObject(cart)
//    }
//}
//
//struct testview_Previews: PreviewProvider {
//    static var previews: some View {
//        testview(cart: Cart())
//    }
//}
