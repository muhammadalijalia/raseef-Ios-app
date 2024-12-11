//
//  ShippingAddressForm.swift
//  raseef
//
//  Created by Teamx tec on 29/12/2022.
//

import SwiftUI

struct ShippingAddressForm: View {
    @State private var streetAddress: String = ""
    @State private var country: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zip: String = ""
    @State private var id: String = ""

    var body: some View {
        Form {
            Group {
                TextField("Street address", text: $streetAddress)
                TextField("Country", text: $country)
                TextField("City", text: $city)
                TextField("State", text: $state)
                TextField("Zip code", text: $zip)
                TextField("ID", text: $id)
            }
        }
    }
}

struct ShippingAddressForm_Previews: PreviewProvider {
    static var previews: some View {
        ShippingAddressForm()
    }
}
