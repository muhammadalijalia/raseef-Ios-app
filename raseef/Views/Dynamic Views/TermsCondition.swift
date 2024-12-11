//
//  PrivacyPolicyView.swift
//  Multivendor
//
//  Created by Rehan Ali Khan on 13/06/2022.
//

import SwiftUI

struct TermsCondition: View {
    
    @State var text = "Little & Big is committed to protecting your privacy because we are committed to valuing people. Our Privacy Policy below sets out how your personal information is collected, used and protected. The Demo Country Privacy Principles also apply to us.This Privacy Policy describes our policies and procedures on the collection, holding, use and disclosure of your personal information and should be read together with our Terms and Conditions. By providing your personal information you consent to our collection, use and disclosure of that information in accordance with this Privacy Policy."
    
    var body: some View {
       
            VStack(alignment: .center) {
                
                ScrollView(showsIndicators: true) {
                    Text("\(text)")
                        .padding(.horizontal, 20)
                        .font(.custom(helvitica: .helvetica, style: .body))
                    
                }
                .padding(.top, 10)
                .padding(.bottom, 0)
                .background(.white)
                .cornerRadius(8)
            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 25)
            .padding(.bottom, 30)
            .background(Color.customBackground)
           // .navigationBarTitleDisplayMode(.large)
           
        
        //.navigationBarHidden(true)
        .navigationTitle("Privacy Policy")
    }
}

struct TermsCondition_Previews: PreviewProvider {
    static var previews: some View {
        TermsCondition()
    }
}
