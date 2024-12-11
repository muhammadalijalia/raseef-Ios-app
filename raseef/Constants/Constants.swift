//
//  Constants.swift
//  raseef
//
//  Created by Teamx tec on 11/10/2022.
//

import Foundation

import SwiftUI

struct Constants{

    
    static let base_url = "https://api.teamxmv.com/api/";
   
    static let LoginWithEmail = base_url+"token";
    static let LoginWithPhoneNo  = base_url + "token/phone";
    static let ForgetPassword = base_url+"forget-password";
    static let VerifyForgetPassword = base_url+"verify-forget-password-token";
    static let ResetPassword = base_url+"reset-password";
    static let RegisterWithPhone = base_url+"register/phone";
    static let VerifyPhoneRegistration = base_url+"register/phone-verify";
    static let Resend_Registration_OTP = base_url+"register/resend-otp";
    static let Dashboard_Api = base_url+"dashboard";
    
    ////STORE
 static let zues_base_url = "https://zues.teamxmv.com/api/"
    static let raseef_base_url = "https://raseefapi.teamxmv.com/api";
    ///
    static let getshops = zues_base_url+"shops";
    static let getshopsByslug = zues_base_url+"shops/";

    ///Products
    static let getProductsbyShopId = zues_base_url+"products";
    static let getProductBySlug = zues_base_url + "products/" ;
    
    //ProductReviews
    static let ProductReviews = zues_base_url + "reviews/" ;
    
    
    //GetDashboard/
    
    static let Dashboard = zues_base_url + "dashboard";
    
    //Get Oders
    static let GetOrders = zues_base_url + "orders";
    
    //Get Notififcations
    
    
    static let notifications = zues_base_url +  "notifications";
    
    
    // Stripe Api
    static let stripe_api = "https://api.stripe.com/v1/payment_methods";
    
    //ADD CREDIT CARd
    
    static let add_creditCard = zues_base_url + "stripe/cards"
    
    // GET Credit Card
    static let get_creditCard = zues_base_url + "stripe/cards"
    
    // delete Credit Card
    static let del_creditCard = zues_base_url + "stripe/cards/"
    
    
    // Create Order
    
    static let Create_order = zues_base_url + "orders"
}
