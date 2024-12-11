////
////  DashboardTabBarView.swift
////  Multivendor
////
////  Created by Rehan Ali Khan on 26/07/2022.
////
//
//import SwiftUI
//import Alamofire
//
//struct Dashboardiew: View {
//
//    @State private var selection: String = "home"
//
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.white
//        UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().unselectedItemTintColor = UIColor.black
//    }
//
//    struct Item {
//
//        let title: String
//        var tabView: DashboardViews
//        let icon: String
//
//        init(title: String, tabView: DashboardViews, icon: String) {
//            self.title = title
//            self.tabView = tabView
//            self.icon = icon
//        }
//
//    }
//
//    enum DashboardViews: Int, CaseIterable, Decodable {
//        case notification
//        case home
//        case cart
//
//        @ViewBuilder var tabItemView: some View {
//            switch self {
//            case .notification:
//                SignInView()
//            case .home:
//                ContentView()
//            case .cart:
//                ForegtPassword()
//            }
//        }
//    }
//
//
//
//    @State var items = [
//        Item(title: "cart", tabView: .notification, icon: "cart"),
//        Item(title: "home", tabView: .home, icon: "house"),
//        Item(title: "car", tabView: .cart, icon: "car")
//    ]
//
//    var body: some View
//    {
//        TabView{
//            ForEach(items, id: \.title) { item in // << dynamically !!
//
//                       item.tabView.tabItemView
//                   .tabItem{
//                       Label("Profile",systemImage: item.icon)
//                   }
//
//           }
//        }
//
////        NavigationView {
////                Text("Hello, World!").padding()
////                .navigationTitle("SwiftUI")
////                .toolbar {
////                    ToolbarItemGroup(placement: .bottomBar) {
////
////                        HStack(spacing:100){
////                            ForEach(items, id: \.title) { item in // << dynamically !!
////
////        Button(action: {
////                                    print("Button action")
////                                }) {
////
////                                    Image(systemName: item.icon)
////
////                                }
////
////                                      }
////
////                        }
////       }
////                }
////
////        }
//
//
//
//
//
//
//
//        .onChange(of: selection) { title in // << reorder with centered item
//            let target = 1
//            if var i = items.firstIndex(where: { $0.title == title }) {
//                if i > target {
//                    i += 1
//                }
//                items.move(fromOffsets: IndexSet(integer: target), toOffset: i)
//            }
//        }
//    //}
//}
//
//struct TabBarShape: Shape {
//
//    private enum Constants {
//        static let cornerRadius: CGFloat = 20
//        static let buttonRadius: CGFloat = 30
//        static let buttonPadding: CGFloat = 5
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath()
//
//        path.move(to: .init(x: 0, y: rect.height))
//        path.addLine(to: .init(x: 0, y: rect.height - Constants.cornerRadius))
//        path.addArc(withCenter: .init(x: Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        let lineEnd = rect.width/2 - 2 * Constants.buttonPadding - Constants.buttonRadius
//        path.addLine(to: .init(x: lineEnd, y: 0))
//        path.addArc(withCenter: .init(x: lineEnd, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addArc(withCenter: .init(x: rect.width/2, y: Constants.buttonPadding), radius: Constants.buttonPadding + Constants.buttonRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
//
//        let lineStart = rect.width/2 + 2 * Constants.buttonPadding + Constants.buttonRadius
//        path.addArc(withCenter: .init(x: lineStart, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        path.addLine(to: .init(x: rect.width - Constants.cornerRadius, y: 0))
//        path.addArc(withCenter: .init(x: rect.width - Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addLine(to: .init(x: rect.width, y: rect.height))
//        path.close()
//
//        return Path(path.cgPath)
//    }
//}
//}
//
////struct CShape: Shape {
////
////    func path(in rect: CGRect) -> Path {
////
////        return Path { path in
////            path.move(to: CGPoint(x: 0, y: 0))
////            path.addLine(to: CGPoint(x: 0, y: rect.height))
////            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
////            path.addLine(to: CGPoint(x: rect.width, y: 0))
////
////            path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius : 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
////        }
////    }
////}
//
//struct DashboardTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        Dashboardiew()
//    }
//}


//import SwiftUI
//
//struct  Dashboardiew: View {
//
//    var body: some View {
//        VStack {
//            Spacer()
//            TabBarShape()
//                .fill(Color.white)
//                .frame(height: 80)
//                .shadow(color: Color.black.opacity(0.4), radius: 2, x: 0, y: -1)
//                .overlay(
//                    Button(action: {}, label: {
//                        Text("")
//                            .frame(width: 60, height: 60, alignment: .center)
//                            .background(Color.blue)
//                            .cornerRadius(30)
//                    }).offset(x: 0, y: -36)
//                )
//        }.ignoresSafeArea()
//    }
//}
//
//struct TabBarShape: Shape {
//
//    private enum Constants {
//        static let cornerRadius: CGFloat = 20
//        static let buttonRadius: CGFloat = 30
//        static let buttonPadding: CGFloat = 5
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath()
//
//        path.move(to: .init(x: 0, y: rect.height))
//        path.addLine(to: .init(x: 0, y: rect.height - Constants.cornerRadius))
//        path.addArc(withCenter: .init(x: Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        let lineEnd = rect.width/2 - 2 * Constants.buttonPadding - Constants.buttonRadius
//        path.addLine(to: .init(x: lineEnd, y: 0))
//        path.addArc(withCenter: .init(x: lineEnd, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addArc(withCenter: .init(x: rect.width/2, y: Constants.buttonPadding), radius: Constants.buttonPadding + Constants.buttonRadius, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
//
//        let lineStart = rect.width/2 + 2 * Constants.buttonPadding + Constants.buttonRadius
//        path.addArc(withCenter: .init(x: lineStart, y: Constants.buttonPadding), radius: Constants.buttonPadding, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
//
//        path.addLine(to: .init(x: rect.width - Constants.cornerRadius, y: 0))
//        path.addArc(withCenter: .init(x: rect.width - Constants.cornerRadius, y: Constants.cornerRadius), radius: Constants.cornerRadius, startAngle: -CGFloat.pi/2, endAngle: 0, clockwise: true)
//        path.addLine(to: .init(x: rect.width, y: rect.height))
//        path.close()
//
//        return Path(path.cgPath)
//    }
//}
//
//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        Dashboardiew()
//    }
//}


// 🔥BOYCOTT on russia - terrorist must be punished!
// «Русский военный корабль, иди на хуй!» (c) Ukrainian Frontier Guard
//
// ATTENTION: This is a demo - use it as you wish. Reference is appriciated.
// If you want to thank - buy me coffee: https://secure.wayforpay.com/donate/asperi

import SwiftUI
func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
    return UIColor(
        red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
        green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
        blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
        alpha: 1.0)
}
extension Dashboardiew {
  func setupTabBar() {
    UITabBar.appearance().barTintColor = .black
    UITabBar.appearance().tintColor = .blue
   // UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
    UITabBar.appearance().clipsToBounds = true
  }
}
struct Dashboardiew: View {

    @State private var selection: String = "house"
    @State private var tbHeight = CGFloat.zero
    init() {
     // setupTabBar()
       UITabBar.appearance().barTintColor = UIColor.blue
       UITabBar.appearance().tintColor = .green
       // UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor =   UIColor.blue
         UITabBar.appearance().backgroundColor =  UIColor(named:"gray")
        //UITabBar.appearance().backgroundColor =   UIColorFromRGB(0xffffff)
        
        //  UITabBar.appearance().unselectedItemTintColor = UIColor.black
                //UITabBar.appearance().barTintColor = .black
        UITabBarAppearance().shadowColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.primary)
     //  UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
       // UITabBar.appearance().standardAppearance = UITabBarAppearance()
        

    }
 
//    init() {
//   // UITabBar.appearance().backgroundColor = UIColor.white
//      //  UITabBar.appearance().isTranslucent = false
//      UITabBar.appearance().unselectedItemTintColor = UIColor.black
//        UITabBar.appearance().barTintColor = .black
//    }
    struct Item {
        
        let title: String
        let color: Color
        var tabView: DashboardViews
        let icon: String
        
        init(title: String,color: Color ,tabView: DashboardViews, icon: String) {
            self.title = title
            self.color = color
            self.tabView = tabView
            self.icon = icon
        }
        
    }
    
    enum DashboardViews: Int, CaseIterable, Decodable {
        case notification
        case home
        case cart
        
        @ViewBuilder var tabItemView: some View {
            switch self {
            case .notification:
                ContentView()
            case .home:
                ContentView()
            case .cart:
                ForegtPassword()
            }
        }
    }
 
    @State var items = [
        Item(title: "cart", color: .white,tabView: .notification, icon: "cart"),
        Item(title: "house", color: .orange,tabView:.cart, icon: "house"),
        Item(title: "car", color: .green,tabView:.home ,icon: "car"),
    ]
    
    var selected: Item {
        items.first { $0.title == selection } ?? items[0]
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection)
            {
                ForEach(items, id: \.title) { item in
                    TabContent(height: $tbHeight) {
                       // item.color
                        item.tabView.tabItemView
                    }
                    
                    .tabItem {
                        if selection != item.title {
                            
                            Image(systemName: item.icon)
                                
                            Text(item.title)
                                
                        }
                            
                    }
                }
            }
            
          
           // .shadow(color: .red, radius: 5)
            .font(.headline)
            
                  
            .onChange(of: selection) { title in
                let target = 1
                if var i = items.firstIndex(where: { $0.title == title }) {
                    if i > target {
                        i += 1
                    }
                    items.move(fromOffsets: IndexSet(integer: target), toOffset: i)
                }
            }
            TabSelection(height: tbHeight, item: selected)
                //.accentColor(Color.gray)
        }
    }
    
    struct TabSelection: View {
        let height: CGFloat
        let item: Item
        
        var body: some View {
            VStack {
                Spacer()
                Curve()
                  
                  //  .cornerRadius(15)
//                    .shadow(color: Color(red: 192/255, green: 9/255, blue: 31/255),
//                                                                       radius: 5, x: 5, y: 5)
//                    .overlay(
//                                       RoundedRectangle(cornerRadius: 15)
//                                           .stroke(Color(red: 236/255, green: 234/255, blue: 235/255),
//                                                   lineWidth: 4)
//                                           .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255),
//                                                   radius: 3, x: 5, y: 5)
//                                           .clipShape(
//                                               RoundedRectangle(cornerRadius: 15)
//                                           )
//                                           .shadow(color: Color.white, radius: 2, x: -2, y: -2)
//                                           .clipShape(
//                                               RoundedRectangle(cornerRadius: 15)
//                                           )
//                                   )
                    .frame(maxWidth: .infinity, maxHeight: height)
                  .foregroundColor(Color.customBackground)
                    //.background(Color.white)
            }
            .shadow(color: Color.black.opacity(0.5), radius: 14, x: 0, y: 4)
            .ignoresSafeArea()
            .overlay(
                Circle()
                
                    .foregroundColor(.black)
                    .frame(height: height)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                
                    .overlay(
                        Image(systemName: item.icon)
                        
                        .font(.title)
                        .foregroundColor(.white)
                            
                            )
                    .shadow(color: Color(hex:0x727c8e), radius:12, x: 0 , y: 8)
                , alignment: .bottom)
        }
    }
    
    struct TabContent<V: View>: View {
        @Binding var height: CGFloat
        @ViewBuilder var content: () -> V
        var body: some View {
            GeometryReader { gp in
                content()
                    .frame(width: gp.size.width, height: gp.size.height)
                    .background(Color.customBackground)
                   
                    .onAppear {
                        height = gp.safeAreaInsets.bottom
                    }
                    .onChange(of: gp.size) { _ in
                        height = gp.safeAreaInsets.bottom
                    }
            }
        }
    }
    
    struct Curve: Shape {
        func path(in rect: CGRect) -> Path {
            let h = rect.maxY * 0.7
            return Path {
                $0.move(to: .zero)
                $0.addLine(to: CGPoint(x: rect.midX / 2.0, y: rect.minY ))
                $0.addCurve(to: CGPoint(x: rect.midX, y: h), control1: CGPoint(x: rect.midX * 0.8, y: rect.minY), control2: CGPoint(x: rect.midX * 0.7, y: h))
                $0.addCurve(to: CGPoint(x: rect.midX * 3.0 / 2.0, y: rect.minY), control1: CGPoint(x: rect.midX * 1.3, y: h), control2: CGPoint(x: rect.midX * 1.2, y: rect.minY))
                $0.addLine(to: CGPoint(x: rect.maxX , y: rect.minY ))
            }
        }
    }
}

struct Dashboardiew_Previews: PreviewProvider {
    static var previews: some View {
        Dashboardiew()
    }
}
