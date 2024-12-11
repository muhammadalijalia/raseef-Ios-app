//
//  raseefApp.swift
//  raseef
//
//  Created by Teamx tec on 11/10/2022.
//

import SwiftUI
import PayPalCheckout
//placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
///TEXT FIElD MODIFIER
///
struct FieldsModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
            .padding(1)
        

    }
}
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
@main
struct raseefApp: App {
    //@Environment(\.sizeCategory) var sizeCategory
    let persistenceController = ProductListManager.shared
    init(){
        let config = CheckoutConfig(
          clientID: "AR9SSWb7ENF2_PJDej_SOIFhOlGss0F9DYMA7wUWiVsrIncQXRaRkXnVYMTmSFeM_45iGoNl1rITVOo8",
         // returnUrl: "YOUR_RETURN_URL",
          environment: .sandbox
        )
        Checkout.set(config: config)
        
    }
    var body: some Scene {
        WindowGroup {
         //Store_Product_Variable()
     //  CurrentOrders()
        //PaymentMethodCard()
        checkout(Total: .constant(3.0))
  //PaymentCardList()
           // Store_Product_Simple()
                .environment(\.managedObjectContext, persistenceController.viewContext)
            //PaymentMethod()
            // Grid()
            
          //  Store_Product_Variable()
            //OTPTextFieldView { otp, completionHandler in }
//        StoreProfile()
//                .environment(\.managedObjectContext, persistenceController.viewContext)
           // Store_Product_List()
            //Splash()
         //permissionLocation()
          //ResetPassword()
        }
    }
}



extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

//
//  Image.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 20/05/2022.
//

import SwiftUI

extension Image {
    
    init(icon: Icon) {
        self.init(icon.rawValue)
    }
    
    init(systemIcon: SystemIcon) {
        self.init(systemName: systemIcon.rawValue)
    }
}

enum Icon: String {
 //   case profileIcon = "profileIcon"
    case profile_img = "women1"
    case Shirt = "Shirt"
    case icecreamProdcut = "icecreamProdcut"
    case email_orange = "email_orange"
    case shoplogo = "shoplogo"
    case StorePic = "StorePic"
    case bag_g = "bag_g"
    case home_g = "home_g"
    case notification_g = "notification_g"
    case notification_g1 = "notification_g1"
    case profile_g = "profile_g"
    case AppRate = "AppRate"
    case back = "back"
    case icecreamShop = "icecreamShop"
    case plus_with_orange = "plus_with_orange"
    case shop = "shop"
    case navbar =  "shineOrange"
    case account = "arrowDown"
    case apple_logo = "apple_logo"
    case email_ait = "ait-the-rate"
    case attachment_icon = "attachment_icon"
    case bell_icon1 = "bell_icon1"
    case bell_icon2 = "bell_icon2"
    case camera_icon = "camera_icon"
    case camera_with_bg = "camera_with_bg"
    case car_plate_number = "car_plate_number"
    case car = "car"
    case ccCard = "ccCard"
    case chatting = "chatting"
    case checkmark = "checkmark"
    case credit_card_payment = "credit_card_payment"
    case document = "document"
    case email_with_bg = "email_with_bg"
 //   case email = "email"
    case faq = "faq"
    case favorite = "favorite"
    case fb = "fb"
    case fire = "fire"
    case Google = "Google"
    case gray_circle = "gray_circle"
    case headphone_support = "headphone_support"
    case heart = "heart"
    case help2 = "help2"
    case information_button = "information_button"
    case internet_icon = "search"
    case left_arrow = "left_arrow"
    case location_pin = "location_pin"
    case lock = "lock"
    case map_icon = "map_icon"
    case menu = "menu"
    case mobile_model = "mobile_model"
    case Online_Review_rafiki_1 = "Online_Review_rafiki_1"
    case pedestrian_man = "pedestrian_man"
    case phone_icon_green = "phone_icon_green"
    case phone_call_orange = "phone_call_orange"
    //case plus = "plus"
    case privacy_policy_1 = "privacy_policy_1"
    case read_msg_check = "read_msg_check"
    case recorder_icon = "recorder_icon"
    case search_icon = "search_icon"
    case shop_icon = "shop_icon"
    case shopping_bag = "shopping_bag"
    case smiley_icon = "smiley_icon"
    case star = "star"
    case toggle_button = "toggle_button"
    case UAE = "UAE"
    case US = "US"
    case vertical = "vertical"
    case yellow_circle = "yellow_circle"
    case Splash = "Splash"
    case logo = "logo"
    case logo_white = "logo_white"
    case splash_logo = "splash_logo"
    case Order_Ahead = "Order_Ahead"
    case New_Restauant = "New_Restauant"
    case Order_While = "Order_While"
    case Get_Notification = "Get_Notification"
    case WHITE_BG = "WHITE_BG"
    //////////////////////////////////////////////
    case Clothesshop = "Clothesshop"
    case arrowDown = "arrowBelow"
    case arrAbove  = "arrAbove"
    case bigTick = "bigTick"
    case camera = "camera"
    case cart = "cart"
    case delete = "delete"
    case drawer = "drawer"
    case email = "email"
    case eyeClosed = "eyeClosed"
    case eyeOpened = "eyeOpened"
    case facebook = "facebook"
    case google = "google"
    case home = "home"
    case leftArrow = "leftArrow"
    case logout = "logout"
    case mainCategory = "mainCategory"
    case minus = "minus"
    case mobileNumber = "mobileNumber"
    case name = "profileIcon"
    case notification = "notification"
    case orderHistory = "orderHistory"
    case password = "password"
    case paymentMethod = "paymentMethod"
    case plus = "plus"
    case rightArrowCircle = "rightArrowCircle"
    case rightArrowDark = "rightArrowDark"
    case rightArrowLight = "rightArrowLight"
    case searchIcon = "searchIcon"
    case selected = "selected"
    case settings = "settings"
 //   case splash = "splash"
    case support = "support"
    case tick = "tick"
    case unselected = "unselected"
    case cross = "cross"
    case fillCircle = "fillCircle"
    case emptyStar = "emptyStar"
    case filledStar = "filledStar"
    case eMobail = "eMobail"
    case email_rate = "aittherate"
    
}

enum SystemIcon: String {
    case eyeOpened = "eye"
    case eyeClosed = "eye.slash"
    case box = "square"
    case checkbox = "checkmark.square"
    case person = "person"
}
